// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, dead_code
import 'package:byon_care/constents.dart';
import 'package:byon_care/customerr_screen/repository/customer_repo.dart';
import 'package:byon_care/customerr_screen/widgets/listtile_product.dart';
import 'package:byon_care/customerr_screen/widgets/our_product.dart';
import 'package:byon_care/drawer/drawer.dart';
import 'package:byon_care/models/product_model_class.dart';
import 'package:byon_care/models/usermodel.dart';

import 'package:byon_care/screen/graph_container.dart';
import 'package:byon_care/screen/production/viewall_prodution.dart';
import 'package:byon_care/screen/rating_button.dart';
import 'package:byon_care/screen/screen_last_production.dart';
import 'package:byon_care/service_manager/servicemanagershimmer.dart';
import 'package:byon_care/servicess/firestore_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../myproductViewScreen.dart';
import 'editourproducts.dart';
import 'productiontabs.dart';
import 'productionwarrantytile.dart';

class ProductionDashboard extends StatefulWidget {
  const ProductionDashboard({Key? key, required this.userData})
      : super(key: key);

  final UserModel userData;

  @override
  State<ProductionDashboard> createState() => _ProductionDashboard();
}

class _ProductionDashboard extends State<ProductionDashboard> {
  int selectedValue = 0;

  final currentUserEmail = FirebaseAuth.instance.currentUser!.email;

  final CustomerRepo customerRepo = CustomerRepo();

  Stream<QuerySnapshot<Map<String, dynamic>>>? productStreamforproduction;

  @override
  void initState() {
    productStreamforproduction = FirebaseFirestore.instance
        .collection("items").orderBy("productionDate",descending: true)
    
        .limit(2)
        .snapshots();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        title: Image.asset(
          "images/Raymax logo.png",
          width: 190,
        ),
      ),
      endDrawer: MyDrawer(userdta: widget.userData),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                  child: Column(
                    children: [
                      Stack(children: [
                        Column(
                          children: [
                            MaterialButton(
                              height: 230,
                              minWidth: double.infinity,
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
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20, top: 20),
                              child: Row(
                                children: [
                                  Text('Last Week',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: Colors.black)),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: RatingButton(),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text('0 count',
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400)),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 0, top: 10),
                              child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: GraphContainer()),
                            )
                          ],
                        )
                      ]),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 15),
              child: Text('Add Production',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.black)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: ProductionWarrantyListtile(
                onTap: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddProductionDetails(),
                      ));
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: productStreamforproduction,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: ShimmerServiceManager());
                }

                final List<ProductModel> listOfproductModel = [];
                List<QueryDocumentSnapshot<Map<String, dynamic>>>
                    listOfProducts = snapshot.data!.docs;
                for (var item in listOfProducts) {
                  final product = item.data();

                  final ProductModel model =
                      ProductModel.fromMap(product, item.id);

                  listOfproductModel.add(model);
                }
                if (listOfproductModel.isEmpty) {
                  return SizedBox();
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15)
                          .copyWith(bottom: 10),
                      child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Last Production',
                        style: TextStyle(
                            fontFamily: kfontPoppinsMedium, fontSize: 20),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ScreenLastSaleProduction(userData:widget. userData),
                              ));
                        },
                        child: const Text(
                          'View All',
                          style: TextStyle(color: kbyoncolor3),
                        ))
                  ],
                ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: listOfproductModel.length,
                        itemBuilder: (context, index) {
                          final item = listOfproductModel[index];
                          return ProductListTile(
                            

                               onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyProductViewScreen(productData: item,userData: widget.userData,),));
                          },
                            productData: item,
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Product Label',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.black)),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductionViewAll(),
                            ));
                      },
                      child: Text(
                        'View All',
                        style: TextStyle(color: Colors.green),
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 200,
              child: FutureBuilder<List<ProductModel>>(
                  future: FirestoreServices().getourProductsforproduction(),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    List<ProductModel> listOfProducts = snapshot.data ?? [];

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: kbyoncolor3,
                        ),
                      );
                    }
                    if (listOfProducts.isEmpty) {
                      return Center(
                          child: Text(
                        'No Products Available',
                        style: TextStyle(
                            fontFamily: kfontPoppinsMedium, fontSize: 15),
                      ));
                    }
                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 10,).copyWith(bottom: 5),
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: listOfProducts.length,
                      itemBuilder: (context, index) {
                        return OurProductTile(
                          productData: listOfProducts[index],
                          onPress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddOurProductProduction(
                                      productData: listOfProducts[index]),
                                ));
                          },
                        );
                      },
                    );
                  }),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
