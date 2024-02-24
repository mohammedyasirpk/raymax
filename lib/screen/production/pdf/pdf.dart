// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors, unused_local_variable, avoid_print, prefer_const_declarations, body_might_complete_normally_nullable
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:math' as math;
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
    required int count}) async {
  var pdf = pw.Document();

  final imageByteData = await rootBundle.load('images/RAYpng.png');
  // Convert ByteData to Uint8List
  final imageUint8List = imageByteData.buffer
      .asUint8List(imageByteData.offsetInBytes, imageByteData.lengthInBytes);

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
        pageFormat:
            PdfPageFormat(80 * mm, double.infinity, marginAll: 0.15 * mm),
        build: (pw.Context context) {
          return pw.ListView.builder(
              itemCount: count,
              itemBuilder: (context, index) {
                return pw.Transform.rotate(
                  child: pw.Container(
                    child: pw.Column(
                      children: [
                        pw.SizedBox(
                          height: 5,
                        ),
                        pw.Text(productData.productName ?? 'Not Available',
                            style: pw.TextStyle(
                              fontSize: 20,
                              font: font,
                            )),
                        pw.SizedBox(
                          height: 5,
                        ),
                        pw.Container(
                          height: 20,
                          decoration: pw.BoxDecoration(
                              color: greyColor,
                              borderRadius: pw.BorderRadius.circular(3)),
                          child: pw.Padding(
                            padding: pw.EdgeInsets.only(left: 5, right: 5),
                            child: pw.Row(
                              children: [
                                pw.Text('Model Name  ',
                                    style: pw.TextStyle(
                                        fontSize: 10, font: font1)),
                                pw.Text(modelName,
                                    style: pw.TextStyle(
                                        fontSize: 10, font: font1)),
                              ],
                            ),
                          ),
                        ),
                        pw.SizedBox(
                          height: 20,
                        ),
                        pw.Row(
                            mainAxisAlignment: pw.MainAxisAlignment.center,
                            children: [
                              pw.BarcodeWidget(
                                  height: 80,
                                  width: 80,
                                  barcode: pw.Barcode.qrCode(),
                                  data: "${productionIdStartAt + 0}",
                                  textStyle: pw.TextStyle(fontSize: 24)),
                            ]),
                        pw.SizedBox(
                          height: 5,
                        ),
                        pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          children: [
                            pw.Text('Serial no : ',
                                style: pw.TextStyle(fontSize: 7, font: font1)),
                            pw.Text("${productionIdStartAt + 0}",
                                style: pw.TextStyle(fontSize: 7, font: font1)),
                          ],
                        ),
                        pw.SizedBox(
                          height: 5,
                        ),
                        pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          children: [
                            pw.Image(pw.MemoryImage(imageUint8List),
                                height: 50, width: 140),
                          ],
                        ),
                        pw.SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  angle: 45 * math.pi / 90,
                );
              });
        }),
  );

  return await pdf.save();
}

Future<String> shareWinnersListPdf(context,
    {required ProductModel productData,
    required String modelName,
    required int productionIdStartAt,
    required int count}) async {
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
  ));
  return file.path;
}