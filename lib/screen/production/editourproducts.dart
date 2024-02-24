// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_escapesimport 'package:byon_care/admin_screen/add_our_product.dart';
import 'package:byon_care/customerr_screen/helper/warrenty_year.dart';
import 'package:byon_care/models/product_model_class.dart';
import 'package:byon_care/repository/topsnackbar.dart';
import 'package:byon_care/screen/production/pdf/pdf.dart';
import 'package:byon_care/service_manager/dropdowntextfield.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:share_plus/share_plus.dart';
import '../../constents.dart';
import 'widget/add_button_loading.dart';

class AddOurProductProduction extends StatefulWidget {
  const AddOurProductProduction({Key? key, required this.productData})
      : super(key: key);

  final ProductModel productData;

  @override
  State<AddOurProductProduction> createState() =>
      _AddOurProductProductionState();
}

class _AddOurProductProductionState extends State<AddOurProductProduction> {
  final TextEditingController mrpController = TextEditingController();

  final TextEditingController productmodelController = TextEditingController();

  int? selectedCountProduct;
  bool isLoadingPrint = false;
   bool isLoadingShare = false;

  String capitalizeFirstLetter(String s) {
    if (s.isEmpty) {
      return s;
    }
    return s[0].toUpperCase() + s.substring(1);
  }

  String? selectedCount;

  String? selectedModel;

  @override
  void dispose() {
    mrpController.dispose();
    productmodelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [],
          backgroundColor: kbyoncolor3,
          elevation: 0,
          title: const Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              'Print Label',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: kfontPoppinsSemiBold,
                  fontSize: 22),
            ),
          )),
      body: ListView(
        children: [
          AspectRatio(
            aspectRatio: 1 / .6,
            child: Stack(
              alignment: Alignment.topCenter,
              fit: StackFit.expand,
              children: [
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: widget.productData.imageUrl == null
                      ? Image.asset(
                          "images/5357829_prev.jpg",
                        )
                      : CachedNetworkImage(
                          imageUrl: widget.productData.imageUrl!),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, right: 40),
                      child: getWarrantyYear(
                          warrenty: widget.productData.warranty ?? 0,
                          additionalWarranty:
                              widget.productData.additionalWarranty ?? 0,
                          widthDecidingValue: false),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  capitalizeFirstLetter(
                      widget.productData.productName ?? "not Available"),
                  style: const TextStyle(
                      fontFamily: kfontPoppinsMedium,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  onPressed: () {},
                  minWidth: double.infinity,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  highlightElevation: 0,
                  elevation: .8,
                  color: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Warranty",
                                  style: TextStyle(
                                      color: Color(0xff777676),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${widget.productData.warranty} Months",
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 20, 20, 20),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        height: 20,
                        child: const VerticalDivider(
                          thickness: 1.5,
                          color: Color(0xff777676),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Container(
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Additional.W',
                                    style: TextStyle(
                                        color: Color(0xff777676),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "${widget.productData.additionalWarranty} Months",
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 20, 20, 20),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        height: 20,
                        child: const VerticalDivider(
                          thickness: 1.5,
                          color: Color(0xff777676),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Container(
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Total Warranty",
                                    style: TextStyle(
                                        color: Color(0xff777676),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${(widget.productData.additionalWarranty ?? 0) + (widget.productData.warranty ?? 0)} Months",
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 20, 20, 20),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Other Info",
                  style:
                      TextStyle(fontFamily: kfontPoppinsMedium, fontSize: 16),
                ),
                const SizedBox(
                  height: 25,
                ),
                DropdownButtonFormField<String>(
                  value: selectedModel,
                  decoration: textFieldDecoration(
                      label: 'Modal Name', hint: 'Modal Name'),
                  items: (widget.productData.modelList ?? []).map((model) {
                    return DropdownMenuItem<String>(
                      child: Text(model),
                      value: model,
                    );
                  }).toList(),
                  onChanged: (value) {
                    selectedModel = value;
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp("[0-9\]")),
                        ],
                        controller: productmodelController,
                        decoration: textFieldDecoration(
                            hint: 'ProductId Start At',
                            label: 'ProductId Start At'),
                        onChanged: (value) {},
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      width: 100,
                      child: DropdownButtonFormField<int>(
                        //  value: selectedProduct,
                        decoration:
                            textFieldDecoration(label: 'Count', hint: 'Count'),
                        items: [5, 10, 20, 30, 40]
                            .map((e) => DropdownMenuItem<int>(
                                value: e, child: Text(e.toString())))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedCountProduct = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Row(children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              color: Colors.blueGrey.shade400,
                              onPressed: () async {
                                if (selectedModel == null) {
                                  showsnackbar(
                                      "Please Select Model Name", context,SnackbarCondition.warning);
                                  return;
                                }
                                if (productmodelController.text.isEmpty) {
                                  showsnackbar(
                                      "Please Enter Product Id", context,SnackbarCondition.warning);
                                  return;
                                }

                                if (selectedCountProduct == null) {
                                  showsnackbar("Please Select Count", context,SnackbarCondition.warning);
                                  return;
                                }
                                setState(() {
                                  isLoadingShare = true;
                                });
                                String? path = await shareWinnersListPdf(
                                    context,
                                    modelName: selectedModel ?? "Not Available",
                                    count: selectedCountProduct ?? 0,
                                    productionIdStartAt: int.tryParse(
                                            productmodelController.text) ??
                                        0,
                                    productData: widget.productData);
                                setState(() {
                                  isLoadingShare = false;
                                });
                                Share.shareXFiles([XFile(path)]);
                              },
                              child: isLoadingShare ? AddButtonLoading(): Text(
                                'Share',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  Expanded(
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 20),
                          child: Row(
                            children: [
                              Expanded(
                                child: MaterialButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  color: Colors.red,
                                  onPressed: () async {
                                    if (selectedModel == null) {
                                      showsnackbar(
                                          "Please Select Model Name", context,SnackbarCondition.warning);
                                      return;
                                    }
                                    if (productmodelController.text.isEmpty) {
                                      showsnackbar(
                                          "Please Enter Product Id", context,SnackbarCondition.warning);
                                      return;
                                    }

                                    if (selectedCountProduct == null) {
                                      showsnackbar(
                                          "Please Select Count", context,SnackbarCondition.warning);
                                      return;
                                    }
                                      setState(() {
                                      isLoadingPrint = true;
                                    });

                                    final pdfData = await printWinnersListPdf(
                                        context,
                                        modelName:
                                            selectedModel ?? "Not Available",
                                        count: selectedCountProduct ?? 0,
                                        productionIdStartAt: int.tryParse(
                                                productmodelController.text) ??
                                            0,
                                        productData: widget.productData);

                                    await Printing.layoutPdf(
                                        onLayout: (PdfPageFormat format) =>
                                            pdfData);

                                              setState(() {
                                      isLoadingPrint = false;
                                    });

                                    // Share.shareXFiles([XFile(path)]);
                                  },
                                  child: isLoadingPrint  ? AddButtonLoading() : Text(
                                    'Print',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ],
                          )))
                ]),
              ],
            ),
          )
        ],
      ),
    );
  }
}
