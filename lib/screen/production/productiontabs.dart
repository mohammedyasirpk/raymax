// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:byon_care/admin_screen/helper/capitalized.dart';
import 'package:byon_care/admin_screen/viewall_screens/ourproduct.dart';
import 'package:byon_care/constents.dart';
import 'package:byon_care/models/product_model_class.dart';
import 'package:byon_care/repository/topsnackbar.dart';
import 'package:byon_care/screen/production/widget/add_button_loading.dart';
import 'package:byon_care/service_manager/dropdowntextfield.dart';
import 'package:byon_care/servicess/firestore_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:intl/intl.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AddProductionDetails extends StatefulWidget {
  const AddProductionDetails({
    Key? key,
    this.productData,
  }) : super(key: key);

  final ProductModel? productData;

  @override
  State<AddProductionDetails> createState() => _AddProductionDetailsState();
}

class _AddProductionDetailsState extends State<AddProductionDetails> {
  bool? isloading = false;

  String? qrcode;
  final TextEditingController qrcodecontroller = TextEditingController();

  late Future<List<ProductModel>>? futureourproductforproduction;

  ProductModel? selectedProduct;
  String? selectedmodel;

  @override
  void initState() {
    qrcode = widget.productData?.qrId;
    // selectedProduct = widget.productData;

    futureourproductforproduction =
        FirestoreServices().getourProductsforproduction();
    super.initState();
  }

  @override
  void dispose() {
    qrcodecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Timestamp timestamp = Timestamp.now();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: kbyoncolor3,
        elevation: 0,
        title: Text(
          widget.productData == null ? 'Add Production' : "Edit Production",
          style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontFamily: kfontRubikMedium),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20)
            .copyWith(bottom: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: FutureBuilder<List<ProductModel>>(
                  future: futureourproductforproduction,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                          child: SizedBox(
                        height: 90,
                        width: 90,
                        child: LoadingIndicator(
                            indicatorType: Indicator.ballSpinFadeLoader,
                            colors: const [
                              Colors.red,
                              Colors.pink,
                              Colors.green
                            ],
                            strokeWidth: 2,
                            pathBackgroundColor: Colors.red),
                      ));
                    } else if (snapshot.hasError) {
                      return Text("Error: ${snapshot.error}");
                    } else if (!snapshot.hasData) {
                      return const Text("No data available");
                    }

                    List<ProductModel> listOfProducts = snapshot.data ?? [];

                    listOfProducts.sort(
                      (a, b) {
                        if (a.productName == null || b.productName == null) {
                          return 0;
                        }
                        return (a.productName!.compareTo(b.productName!));
                      },
                    );

                    return ListView(
                      physics: BouncingScrollPhysics(),
                      children: [
                        Text(
                          'Product Details',
                          style: TextStyle(
                              fontFamily: kfontPoppinsRegular, fontSize: 16),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        DropdownButtonFormField<ProductModel>(
                          value: selectedProduct,
                          decoration: textFieldDecoration(
                              label: 'Product Name', hint: 'Product Name'),
                          items: listOfProducts.map((product) {
                            return DropdownMenuItem<ProductModel>(
                              child: Text(capitalizeFirstLetter(
                                  product.productName ?? 'Not available')),
                              value: product,
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedmodel = null;
                              selectedProduct = value;
                              if ((selectedProduct?.modelList ?? [])
                                  .isNotEmpty) {
                                selectedmodel =
                                    selectedProduct?.modelList?.first;
                              }
                            });
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        DropdownButtonFormField<String>(
                          value: selectedmodel,
                          decoration: textFieldDecoration(
                              label: 'Modal Name', hint: 'Modal Name'),
                          items:
                              (selectedProduct?.modelList ?? []).map((model) {
                            return DropdownMenuItem<String>(
                              child: Text(capitalizeFirstLetter(model)),
                              value: model,
                            );
                          }).toList(),
                          onChanged: (value) {
                            selectedmodel = value;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        //qrcode if it only add
                        widget.productData == null
                            ? TextFormField(
                                controller: qrcodecontroller,
                                decoration: textFieldDecoration(
                                    label: 'QrCode',
                                    hint: 'QrCode',
                                    suffix: GestureDetector(
                                      onTap: () async {
                                        qrcode = await FlutterBarcodeScanner
                                            .scanBarcode('#ff6666', 'Cancel',
                                                false, ScanMode.DEFAULT);

                                        if (qrcode == "-1") {
                                          qrcode = null;
                                        } else {
                                          qrcodecontroller.text = qrcode ?? "";
                                        }
                                      },
                                      child: Image.asset(
                                        'images/qrcodescan.png',
                                        height: 20,
                                        width: 20,
                                        color: Colors.black,
                                      ),
                                    )),
                                onTap: () async {
                                  setState(() {});
                                },
                              )
                            : SizedBox(),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Product Info',
                          style: TextStyle(
                              fontFamily: kfontPoppinsRegular, fontSize: 16),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // AddProductscreencontainer(),
                        MaterialButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          highlightElevation: 0,
                          onPressed: () {},
                          elevation: .8,
                          color: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Text(
                                              "Warranty",
                                              style: TextStyle(
                                                  color: Color(0xff777676),
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              selectedProduct?.warranty != null
                                                  ? "${selectedProduct?.warranty} Month"
                                                  : 'Not available',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 20, 20, 20),
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Text(
                                                "Additional.W",
                                                style: TextStyle(
                                                    color: Color(0xff777676),
                                                    fontSize: 11,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 0,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 1,
                                              ),
                                              Text(
                                                selectedProduct
                                                            ?.additionalWarranty !=
                                                        null
                                                    ? "${selectedProduct?.additionalWarranty} Month"
                                                    : 'Not available',
                                                // complaint.closedDate != null
                                                //     ? DateFormat('yyyy-MM-dd')
                                                //         .format(complaint.registerDate!.toDate())

                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 20, 20, 20),
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Production",
                                                style: TextStyle(
                                                    color: Color(0xff777676),
                                                    fontSize: 11,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                DateFormat("dd-MMM-yyyy")
                                                    .format(timestamp.toDate()),
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 20, 20, 20),
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    );
                  }),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            color: Colors.blueGrey.shade400,
                            onPressed: () {
                              Navigator.pop(context, false);
                            },
                            child: const Text(
                              'Cancel',
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
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            color: Colors.red,
                            onPressed: () async {
                              if (isloading == true) {
                                return;
                              }

                              ///checking its add or edit and if it add qrcode take from qrcode controller if it edit then take the previous qrcode
                              widget.productData == null
                                  ? selectedProduct?.qrId =
                                      qrcodecontroller.text
                                  : selectedProduct?.qrId =
                                      widget.productData?.qrId;
                              if (selectedProduct == null) {
                                showsnackbar("Please Select Product Name",
                                    context, SnackbarCondition.warning);
                                return;
                              }
                              if (selectedmodel == null) {
                                showsnackbar('Please Select Model Name',
                                    context, SnackbarCondition.warning);
                                return;
                              }

                              if (widget.productData == null) {
                                if (selectedProduct?.qrId == null ||
                                    selectedProduct!.qrId!.length < 4) {
                                  showsnackbar('Please Enter a Qr Id', context,
                                      SnackbarCondition.warning);
                                  return;
                                }
                              }
                              setState(() {
                                isloading = true;
                              });
                              var firebaseOutPut = await FirebaseFirestore
                                  .instance
                                  .collection("items")
                                  .where("qrCode",
                                      isEqualTo: selectedProduct!.qrId)
                                  .get();
                              setState(() {
                                isloading = false;
                              });

                              if (widget.productData == null) {
                                if (firebaseOutPut.docs.isNotEmpty) {
                                  showsnackbar('This Qr ID Already Exist',
                                      context, SnackbarCondition.failure);
                                  return;
                                }
                              }

                              if (selectedProduct == null &&
                                  selectedmodel == null) {
                                return;
                              }

                              await FirestoreServices()
                                  .uploadproductionfordealer(
                                      selectedProduct!,
                                      selectedmodel!,
                                      widget.productData?.docId);
                              showsnackbar(
                                  widget.productData == null
                                      ? 'Production Added Successfully'
                                      : 'Production Edit Successfully',
                                  context,
                                  SnackbarCondition.success);

                              qrcodecontroller.clear();
                            },
                            child: isloading == true
                                ? SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: AddButtonLoading())
                                : Text(
                                    widget.productData == null ? 'Add' : "Edit",
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
              ],
            )
          ],
        ),
      ),
    );
  }
}
