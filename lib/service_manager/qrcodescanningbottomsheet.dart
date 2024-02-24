// ignore_for_file: unnecessary_cast, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace
import 'package:byon_care/constents.dart';
import 'package:byon_care/models/product_model_class.dart';
import 'package:byon_care/servicess/firestore_services.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../customerr_screen/helper/getGraphvalue.dart';
import '../models/graph_value_model.dart';

Future<bool?> qrcodescanningproductdetails(
  context,
  String qrId, {
  required Function(ProductModel? productData) onconformed,
  bool? isStarWarranty,bool? isService,
}) async {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
    ),
    backgroundColor: Colors.white,
    builder: (context) {
      return StatefulBuilder(builder: (context, setState) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30, bottom: 5),
                child: const Text(
                  'Product Details',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              FutureBuilder<ProductModel?>(
                  future: FirestoreServices().getproductbyqrcode(qrId),
                  builder: (context, snapshot) {
                    ProductModel? productdata = snapshot.data;

                    final GraphValueModel? graphdata = getGraphValue(
                      purchaseDate: productdata?.purchaseDateTime,
                      warranty: productdata?.warranty ?? 0,
                      additionalWarranty: productdata?.additionalWarranty ?? 0,
                    );


                    if (isService == true && productdata?.purchaseDateTime == null){
                      return   Container(
                          height: 300,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            child: Column(
                              children: [
                                Expanded(
                                    child: Center(
                                  child: snapshot.connectionState ==
                                          ConnectionState.waiting
                                      ? CircularProgressIndicator(
                                          color: kbyoncolor3,
                                        )
                                      : Column(
                                          children: [
                                            Image.asset(
                                              'images/product not found.png',
                                              height: 100,
                                              width: 100,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              'This Product is Not Sold Yet',
                                              style: TextStyle(
                                                  fontFamily:
                                                      kfontPoppinsMedium),
                                            ),
                                          ],
                                        ),
                                )),
                                Row(
                                  children: [
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
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10))),
                                                color: Colors.blueGrey.shade400,
                                                onPressed: () {
                                                  Navigator.pop(context, false);
                                                },
                                                child: const Text(
                                                  'Cancel',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600),
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
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10))),
                                                color: Colors.red,
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text(
                                                  'Ok',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600),
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
                          ));
                    }

                    if (isStarWarranty == true && productdata?.purchaseDateTime != null){
                      return   Container(
                          height: 300,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            child: Column(
                              children: [
                                Expanded(
                                    child: Center(
                                  child: snapshot.connectionState ==
                                          ConnectionState.waiting
                                      ? CircularProgressIndicator(
                                          color: kbyoncolor3,
                                        )
                                      : Column(
                                          children: [
                                            Image.asset(
                                              'images/product not found.png',
                                              height: 100,
                                              width: 100,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              'This Product is Already Sold',
                                              style: TextStyle(
                                                  fontFamily:
                                                      kfontPoppinsMedium),
                                            ),
                                          ],
                                        ),
                                )),
                                Row(
                                  children: [
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
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10))),
                                                color: Colors.blueGrey.shade400,
                                                onPressed: () {
                                                  Navigator.pop(context, false);
                                                },
                                                child: const Text(
                                                  'Cancel',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600),
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
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10))),
                                                color: Colors.red,
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text(
                                                  'Ok',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600),
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
                          ));
                    }

                    if (productdata == null) {
                      return Container(
                          height: 300,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            child: Column(
                              children: [
                                Expanded(
                                    child: Center(
                                  child: snapshot.connectionState ==
                                          ConnectionState.waiting
                                      ? CircularProgressIndicator(
                                          color: kbyoncolor3,
                                        )
                                      : Column(
                                          children: [
                                            Image.asset(
                                              'images/product not found.png',
                                              height: 100,
                                              width: 100,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              'Product Not Found!',
                                              style: TextStyle(
                                                  fontFamily:
                                                      kfontPoppinsMedium),
                                            ),
                                          ],
                                        ),
                                )),
                                Row(
                                  children: [
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
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10))),
                                                color: Colors.blueGrey.shade400,
                                                onPressed: () {
                                                  Navigator.pop(context, false);
                                                },
                                                child: const Text(
                                                  'Cancel',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600),
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
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10))),
                                                color: Colors.red,
                                                onPressed: () {
                                                                                                    Navigator.of(context).pop();

                                                },
                                                child: const Text(
                                                  'Ok',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600),
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
                          ));
                    }

                    return Container(
                      height: 300,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 15,
                                              width: 15,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white),
                                              child: Icon(
                                                Icons.numbers,
                                                color: kbyoncolor3,
                                                size: 13,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'Product Id',
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  color: Color(0xff8E8E93),
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 22),
                                          child: Text(
                                            // complaintdata.qrId ??
                                            productdata.qrId ?? 'not available',
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Color(0xff57726C),
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 15,
                                              width: 15,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white),
                                              child: Icon(
                                                Icons
                                                    .branding_watermark_outlined,
                                                color: kbyoncolor3,
                                                size: 13,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "Model Name",
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  color: Color(0xff8E8E93),
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 22),
                                          child: Text(
                                            // complaintdata.productData
                                            //         ?.brandName ??
                                            productdata.modalName ??
                                                'not available',
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Color(0xff57726C),
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 15,
                                              width: 15,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white),
                                              child: Icon(
                                                FontAwesomeIcons.typo3,
                                                color: kbyoncolor3,
                                                size: 13,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "Purchase Date",
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  color: Color(0xff8E8E93),
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 22),
                                          child:Text(
                                                    productdata
                                                                .purchaseDateTime ==
                                                            null
                                                        ? "Not available"
                                                        : DateFormat(
                                                                'dd-MM-yyyy')
                                                            .format(
                                                                productdata
                                                                .purchaseDateTime!
                                                                .toDate()),
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color:
                                                            Color(0xff57726C),
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  )
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 15,
                                              width: 15,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white),
                                              child: Icon(
                                                Icons.model_training_rounded,
                                                color: kbyoncolor3,
                                                size: 13,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "Product Name",
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  color: Color(0xff8E8E93),
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 22),
                                          child: Text(
                                         
                                            productdata.productName ??
                                                'not available',
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Color(0xff57726C),
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 15,
                                              width: 15,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white),
                                              child: Icon(
                                                Icons.color_lens,
                                                color: kbyoncolor3,
                                                size: 13,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "Dealer",
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  color: Color(0xff8E8E93),
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 22),
                                          child: Text(
                                           
                                            productdata.dealerName ??
                                                'not available',
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Color(0xff57726C),
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 15,
                                              width: 15,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white),
                                              child: Icon(
                                                Icons.expand_circle_down,
                                                color: kbyoncolor3,
                                                size: 13,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'Warranty',
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  color: Color(0xff8E8E93),
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 22),
                                          child: Text(
                                            "${(productdata.warranty ?? 0) + (productdata.additionalWarranty ?? 0)} Months",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Color(0xff57726C),
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white),
                                    child: Icon(
                                      Icons.new_releases,
                                      color: kbyoncolor3,
                                      size: 13,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Extensive Warranty',
                                          style: TextStyle(
                                              fontSize: 11,
                                              color: Color(0xff8E8E93),
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          "${productdata.warranty ?? 0} Months",
                                          
                                          style: TextStyle(
                                              fontSize: 11,
                                              color: Color(0xff8E8E93),
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 5, right: 5, top: 5),
                            child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                              child: LinearProgressIndicator(
                                value: graphdata?.warrantyValue ?? 0,
                                minHeight: 10,
                                backgroundColor: Colors.grey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10),
                                color: graphdata?.warrantyColor ??
                                    Colors.grey.withOpacity(0.2),
                              ),
                            ),
                          ),
                          SizedBox(
                                    height: 15,
                                  ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white),
                                    child: Icon(
                                      Icons.new_releases,
                                      color: kbyoncolor3,
                                      size: 13,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Conditional Warranty',
                                          style: TextStyle(
                                              fontSize: 11,
                                              color: Color(0xff8E8E93),
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          "${productdata.additionalWarranty ?? 0} Months",
                                          style: TextStyle(
                                              fontSize: 11,
                                              color: Color(0xff8E8E93),
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 5, right: 5, top: 5),
                            child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                              
                              child: LinearProgressIndicator(
                                value: graphdata?.additionalWarranty ?? 0,
                                minHeight: 10,
                                backgroundColor: Colors.grey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10),
                                color: graphdata?.additionalWarrantyColor ??
                                    Colors.grey.withOpacity(0.2),
                              ),
                            ),
                          ),
                          Row(
                            children: [
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
                                                  Radius.circular(10))),
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
                                                  Radius.circular(10))),
                                          color: Colors.red,
                                          onPressed: () {
                                            onconformed(productdata);
                                          },
                                          child: const Text(
                                            'Confirm',
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
                    );
                  }),
            ],
          ),
        );
      });
    },
  );
}
