// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:byon_care/admin_screen/helper/capitalized.dart';
import 'package:byon_care/constants/string_constant.dart';
import 'package:byon_care/customerr_screen/helper/getGraphvalue.dart';
import 'package:byon_care/customerr_screen/helper/warrenty_year.dart';
import 'package:byon_care/models/graph_value_model.dart';
import 'package:byon_care/models/product_model_class.dart';
import 'package:byon_care/models/usermodel.dart';
import 'package:byon_care/screen/production/productiontabs.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../constents.dart';
import 'production/screen_production_edit.dart';

class MyProductViewScreen extends StatefulWidget {
  const MyProductViewScreen(
      {Key? key, required this.productData, this.userData})
      : super(key: key);

  final ProductModel productData;
  final UserModel? userData;

  @override
  State<MyProductViewScreen> createState() => _MyProductViewScreenState();
}

class _MyProductViewScreenState extends State<MyProductViewScreen> {
  GraphValueModel? graphdata;

  UserModel? user;

  late Stream<DocumentSnapshot<Map<String, dynamic>>> lastSaleProducts;
  late ProductModel product;

  @override
  void initState() {
   product = widget.productData;

    lastSaleProducts = FirebaseFirestore.instance
        .collection("items")
        .doc(widget.productData.docId)
        .snapshots();

    graphdata = getGraphValue(
        purchaseDate: widget.productData.purchaseDateTime,
        warranty: widget.productData.warranty ?? 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            widget.userData?.role == kproduction
                ? IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddProductionDetails(
                                    productData: widget.productData,
                                  )));
                    },
                    icon: Icon(Icons.edit))
                : SizedBox(),
          ],
          backgroundColor: kbyoncolor3,
          elevation: 0,
          title: const Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              'My Product View',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: kfontPoppinsSemiBold,
                  fontSize: 22),
            ),
          )),
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: lastSaleProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                }

     final productfire = snapshot.data;
                final data = productfire?.data() ?? {} ;
                final ProductModel productDatafire = ProductModel.fromMap(data, productfire!.id);
                product = productDatafire;


          return ListView(
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
                              imageUrl: product.imageUrl!),
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
                                widthDecidingValue: false)),
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
                         product.productName ?? "not Available"),
                      style: const TextStyle(
                          fontFamily: kfontPoppinsMedium,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Product Info",
                      style:
                          TextStyle(fontFamily: kfontPoppinsMedium, fontSize: 16),
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
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Additional.W",
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
                                        "Model Name",
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
                                      product.modalName ??
                                            'Not Available',
                                        //"${(productData.additionalWarranty ?? 0) + (productData.warranty ?? 0)} Months",
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
                      height: 20,
                    ),
                    const Text(
                      "Warranty Status",
                      style:
                          TextStyle(fontFamily: kfontPoppinsMedium, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      // height: 110,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 0.5),
                              blurRadius: 0.5,
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 15,
                                  width: 15,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle, color: Colors.white),
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
                                        widget.productData.warranty != null
                                            ? "${widget.productData.warranty} Months"
                                            : 'not available',
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
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 5, right: 5, top: 5),
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
                              height: 20,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 15,
                                  width: 15,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle, color: Colors.white),
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
                                        widget.productData.additionalWarranty !=
                                                null
                                            ? "${widget.productData.additionalWarranty} Months"
                                            : 'not available',
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
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 5, right: 5, top: 5),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: LinearProgressIndicator(
                                  value: graphdata?.additionalWarranty ?? 0,
                                  minHeight: 10,
                                  backgroundColor: Colors.grey.withOpacity(0.2),
                                  color: graphdata?.additionalWarrantyColor ??
                                      Colors.grey.withOpacity(0.2),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Description",
                      style:
                          TextStyle(fontFamily: kfontPoppinsMedium, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text((widget.productData.description ?? "Not Available"))
                  ],
                ),
              )
            ],
          );
        }
      ),
    );
  }
}
