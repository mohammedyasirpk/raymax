// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors, unused_local_variable, avoid_print, prefer_const_declarations, body_might_complete_normally_nullable
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../../../models/product_model_class.dart';

pw.Widget tableDivider({bool? isLastItem}) {
  //no right padding for last item
  return pw.Row(children: [
    pw.Container(
      width: 1,
      color: PdfColors.grey,
    ),
    pw.SizedBox(
      width: isLastItem != true ? 4 : 0,
    ),
  ]);
}

pw.Widget tableTopDivider({bool? isLastItem}) {
  //no right padding for last item
  return pw.Row(children: [
    pw.Container(
      color: PdfColors.black,
      width: 1,
    ),
    pw.SizedBox(
      width: isLastItem != true ? 4 : 0,
    ),
  ]);
}

Future<Uint8List> printWinnersListPdf(context,
    {required ProductModel productData,
    required String modelName,
    required int productionIdStartAt,
    required int mrp,
    required int count}) async {
  var pdf = pw.Document();

  final imageByteData = await rootBundle.load('images/RAYpng.png');
  // Convert ByteData to Uint8List
  final imageUint8List = imageByteData.buffer
      .asUint8List(imageByteData.offsetInBytes, imageByteData.lengthInBytes);

  final imageByteData1 = await rootBundle.load('images/price.png');
  // Convert ByteData to Uint8List
  final imageUint8List1 = imageByteData1.buffer
      .asUint8List(imageByteData1.offsetInBytes, imageByteData1.lengthInBytes);

  final font = await PdfGoogleFonts.leagueGothicRegular();
  final font1 = await PdfGoogleFonts.moulpaliRegular();
  final font2 = await PdfGoogleFonts.nokoraRegular();
  final font3 = await PdfGoogleFonts.chauPhilomeneOneRegular();
  final font4 = await PdfGoogleFonts.philosopherBold();

  final pdf1 = pw.Document();
  final PdfColor greyColor = PdfColor.fromHex('D9D9D9');

  const double point = 1.0;
  const double inch = 72.0;
  const double cm = inch / 2.54;
  const double mm = inch / 25.4;

  pdf.addPage(
    pw.Page(
        pageFormat: PdfPageFormat(
          9 * cm,
          double.infinity,
        ),
        build: (pw.Context context) {
          List<int> serialNo = [];
          for (var i = 0; i < count; i++) {
            serialNo.add(i);
          }
          return pw.Column(
              children: serialNo
                  .map((e) => pw.Container(
                        margin: pw.EdgeInsets.only(bottom: 3 * mm),
                        padding: pw.EdgeInsets.all(4 * mm),
                        height: 6 * cm,
                        width: 9 * cm,
                        child: pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          children: [
                            pw.SizedBox(
                              width: 5,
                            ),
                            pw.Transform.rotateBox(
                              angle: 3.14 / 2,
                              child: pw.Text(
                                  productData.productName ?? 'Not Available',
                                  style: pw.TextStyle(
                                    fontSize: 17,
                                    font: font,
                                  )),
                            ),
                            pw.SizedBox(
                              width: 5,
                            ),
                            pw.Container(
                              height: 120,
                              decoration: pw.BoxDecoration(
                                  color: greyColor,
                                  borderRadius: pw.BorderRadius.circular(3)),
                              child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.end,
                                mainAxisAlignment: pw.MainAxisAlignment.end,
                                children: [
                                  pw.Transform.rotateBox(
                                    angle: 3.14 / 2,
                                    child: pw.Text(modelName,
                                        style: pw.TextStyle(
                                            fontSize: 10, font: font1)),
                                  ),
                                  pw.Transform.rotateBox(
                                    angle: 3.14 / 2,
                                    child: pw.Text('   Model Name : ',
                                        style: pw.TextStyle(
                                            fontSize: 10, font: font1)),
                                  ),
                                ],
                              ),
                            ),
                            pw.SizedBox(
                              width: 25,
                            ),
                            pw.BarcodeWidget(
                                height: 70,
                                width: 70,
                                barcode: pw.Barcode.qrCode(),
                                data: "${productionIdStartAt + e}",
                                textStyle: pw.TextStyle(fontSize: 24)),
                            pw.SizedBox(
                              width: 5,
                            ),
                            pw.Column(
                              mainAxisSize: pw.MainAxisSize.min,
                              mainAxisAlignment: pw.MainAxisAlignment.center,
                              children: [
                                pw.Transform.rotateBox(
                                  angle: 3.14 / 2,
                                  child: pw.Text("${productionIdStartAt + e}",
                                      style: pw.TextStyle(
                                          fontSize: 7, font: font1)),
                                ),
                                pw.Transform.rotateBox(
                                  angle: 3.14 / 2,
                                  child: pw.Text('Serial no : ',
                                      style: pw.TextStyle(
                                          fontSize: 7, font: font1)),
                                ),
                              ],
                            ),
                            pw.Column(
                              mainAxisSize: pw.MainAxisSize.min,
                              mainAxisAlignment: pw.MainAxisAlignment.center,
                              children: [
                                pw.Transform.rotateBox(
                                  angle: 3.14 / 2,
                                  child: pw.Text("${mrp + 0}",
                                      style: pw.TextStyle(
                                          fontSize: 12, font: font3)),
                                ),
                                pw.Transform.rotateBox(
                                  angle: 3.14 / 2,
                                  child: pw.Image(
                                      pw.MemoryImage(imageUint8List1),
                                      height: 10,
                                      width: 10),
                                )
                              ],
                            ),
                            pw.Transform.rotateBox(
                              angle: 3.14 / 2,
                              child: pw.Image(pw.MemoryImage(imageUint8List),
                                  height: 50, width: 140),
                            )
                          ],
                        ),
                      ))
                  .toList());
        }),
  );
  return await pdf.save();
}

Future<String> shareWinnersListPdf(context,
    {required ProductModel productData,
    required String modelName,
    required int productionIdStartAt,
    required int count,
    required int mrp}) async {
  var path;
  late File file;
  Directory directory;
  if (Platform.isAndroid) {
    path = (await getExternalStorageDirectory())!.path;
    file = File("$path/best_pdf.pdf");
  } else if (Platform.isIOS) {
    path = await getApplicationDocumentsDirectory();
    directory = await Directory("${path.path}/best_pdfs").create();
    file = File("${directory.path}/best_pdf.pdf");
  }

  if (await file.exists()) {
    try {
      await file.delete();
    } on Exception catch (e) {
      print(e);
    }
  }

  await file.writeAsBytes(await printWinnersListPdf(
    context,
    modelName: modelName,
    count: count,
    productData: productData,
    productionIdStartAt: productionIdStartAt,
    mrp: mrp,
  ));
  return file.path;
}