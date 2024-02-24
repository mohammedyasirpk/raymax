import 'package:byon_care/admin_screen/helper/capitalized.dart';
import 'package:byon_care/admin_screen/user/edit_user_screen.dart';
import 'package:byon_care/constants/string_constant.dart';
import 'package:byon_care/customerr_screen/helper/warrenty_year.dart';
import 'package:byon_care/models/product_model_class.dart';
import 'package:byon_care/models/usermodel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../constents.dart';
import '../add_our_product.dart';

class OurProductDetailScreen extends StatefulWidget {
  OurProductDetailScreen({Key? key, required this.productData, this.userData})
      : super(key: key);

  final ProductModel productData;

  final UserModel? userData;



  @override
  State<OurProductDetailScreen> createState() => _OurProductDetailScreenState();
}



class _OurProductDetailScreenState extends State<OurProductDetailScreen> {

    late  Stream<DocumentSnapshot<Map<String, dynamic>>> ourProductStreamAd ;
late ProductModel product;
  @override
  void initState() {
   product = widget.productData;
   ourProductStreamAd =   FirebaseFirestore.instance.collection("ourProduct").doc( widget. productData.docId).snapshots();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      appBar: AppBar(
          actions: [
            widget.userData?.role == kadmin
                ? IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                AddOurProductAdmin(productData: widget.productData),
                          ));
                    },
                    icon: const Icon(Icons.edit))
                : const SizedBox(),
          ],
          backgroundColor: kbyoncolor3,
          elevation: 0,
          title: const Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              'Our Product View',
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
                      : CachedNetworkImage(imageUrl: widget.productData.imageUrl!),
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
          StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              stream: ourProductStreamAd,
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

                return Container(
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
                      MaterialButton(
                        onPressed: () {},
                        minWidth: double.infinity,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        highlightElevation: 0,
                        elevation: .8,
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${product.warranty} Months",
                                        style: const TextStyle(
                                            color:
                                                Color.fromARGB(255, 20, 20, 20),
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          "${product.additionalWarranty} Months",
                                          style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 20, 20, 20),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${(product.additionalWarranty ?? 0) + (widget.productData.warranty ?? 0)} Months",
                                          style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 20, 20, 20),
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
                        "Models",
                        style: TextStyle(
                            fontFamily: kfontPoppinsMedium, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Wrap(
                          spacing: 10,
                          children: (product.modelList ?? []).map((e) {
                            return MaterialButton(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              highlightElevation: 0,
                              onPressed: () {},
                              elevation: .8,
                              color: Colors.white,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                              ),
                              child: Text(
                                e.toUpperCase(),
                                style: const TextStyle(
                                  fontFamily: kfontPoppinsMedium,
                                  fontSize: 12,
                                ),
                              ),
                            );
                          }).toList()),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Description",
                        style: TextStyle(
                            fontFamily: kfontPoppinsMedium, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text((product.description ?? ""))
                    ],
                  ),
                );
              })
        ],
      ),
    );
  }
}
