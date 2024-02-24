// ignore_for_file: prefer_const_constructors
import 'package:byon_care/customerr_screen/constants/constents.dart';
import 'package:byon_care/customerr_screen/widgets/addmy_producttile.dart';
import 'package:byon_care/customerr_screen/widgets/listtile_product.dart';
import 'package:byon_care/customerr_screen/widgets/our_product.dart';
import 'package:byon_care/drawer/drawer.dart';
import 'package:byon_care/models/usermodel.dart';
import 'package:byon_care/repository/topsnackbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../admin_screen/all_our_product_screen.dart';
import '../admin_screen/ourproduct/our_product_details.dart';
import '../admin_screen/shimmer/our_product_shimmer.dart';
import '../constants/string_constant.dart';
import '../constents.dart';
import '../models/product_model_class.dart';
import '../screen/complaint_screen.dart';
import '../screen/myproductViewScreen.dart';
import '../service_manager/qrcodescanningbottomsheet.dart';
import 'repository/customer_repo.dart';

class NewCustomerScreen extends StatefulWidget {
  const NewCustomerScreen({Key? key, required this.userData}) : super(key: key);

  final UserModel userData;

  @override
  State<NewCustomerScreen> createState() => _NewCustomerScreenState();
}

final currentUserID = FirebaseAuth.instance.currentUser!.uid;

final CustomerRepo customerRepo = CustomerRepo();

final productStreamfordealer = FirebaseFirestore.instance
    .collection("items")
    .where("customerId", isEqualTo:currentUserID )
   
    .snapshots();

final ourProductStreamAdmin =
    FirebaseFirestore.instance.collection("ourProduct").limit(5).snapshots();

String? qrCode;

class _NewCustomerScreenState extends State<NewCustomerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SpeedDial(
          backgroundColor: kbyoncolor3,
          icon: Icons.support_agent_outlined,
          children: [
            SpeedDialChild(
              child: const Icon(Icons.graphic_eq_outlined),
              label: 'Enquiry',
              onTap: () async {
                await launchUrl(Uri.parse('tel:$customerServiceNumber'));
              },
            ),
            SpeedDialChild(
              shape: const CircleBorder(side: BorderSide.none),
              child: const Icon(Icons.report_problem_outlined),
              label: 'Complaint',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ComplaintScreen(
                        userModel: widget.userData,
                      ),
                    ));
              },
            ),
          ]),
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
      backgroundColor: Colors.grey[200],
      endDrawer: MyDrawer(userdta: widget.userData),
      body: ListView(
        children: [
          ///first postion
          Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width * .5,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        "images/1.2 (1).png",
                        fit: BoxFit.fill,
                      ),
                      CarouselSlider(
                        options: CarouselOptions(
                            autoPlay: true,
                            height: MediaQuery.of(context).size.width * .5),
                        items: [
                          "images/MPPTchargehighsize.png",
                          "images/2.png",
                          "images/3.png",
                          "images/4.png",
                          "images/5.png",
                        ].map((image) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                alignment: Alignment.center,
                                child: Image.asset(
                                image,
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                // Container(color: Colors.grey,width: ,),
                Container(
                  alignment: Alignment.centerRight,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        margin: const EdgeInsets.only(left: 20),
                        width: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  "images/isologo.png",
                                  width: 30,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Image.asset(
                                  "images/Picsart_24-02-12_12-34-37-933.png",
                                  width: 30,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Image.asset(
                                  "images/Nositeservice .png",
                                  width: 27,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        margin: const EdgeInsets.only(left: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image.asset("images/xeon2.png", height: 10),
                            const SizedBox(
                              width: 5,
                            ),
                            Image.asset("images/zender1.png", height: 10),
                            const SizedBox(
                              width: 5,
                            ),
                            Image.asset(
                              "images/xeon1.png",
                             
                              height: 5,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          /// second portion
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text('Your Product',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.black)),
              ),
               const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 0),
                child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: productStreamfordealer,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                          child: CircularProgressIndicator(
                        color: kbyoncolor3,
                      ));
                    } else if (snapshot.hasError) {
                      return Text("Error: ${snapshot.error}");
                    } else if (!snapshot.hasData ||
                        snapshot.data!.docs.isEmpty) {
                      return SizedBox();
                    }
                    final List<ProductModel> listOfproductModel = [];
                    List<QueryDocumentSnapshot<Map<String, dynamic>>>
                        listOfProducts = snapshot.data!.docs;
                    for (var item in listOfProducts) {
                      final product = item.data();

                      final ProductModel model =
                          ProductModel.fromMap(product, item.id);

                 //     if (model.purchaseDateTime != null) {
                        listOfproductModel.add(model);
                   //   }
                    }

                    return ListView.builder(
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
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: AddMyProductTile(
                  onTap: () async {
                    String? qrcode = await FlutterBarcodeScanner.scanBarcode(
                        '#ff6666', 'Cancel', false, ScanMode.DEFAULT);
                    if (qrcode != "-1") {

                    await qrcodescanningproductdetails(context, qrcode,
                          onconformed: (productdata)async {
                        if (productdata != null && productdata.productionDate != null) {
                         await customerRepo.addProductForCustomer(productData:productdata ,userData:widget.userData ,);
                          Navigator.pop(
                            context,
                            true,
                          );
                        }else {
                          showsnackbar("Invalid Product", context, SnackbarCondition.failure);
                        }
                      });
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'Our Products',
                    style:
                        TextStyle(fontFamily: kfontPoppinsMedium, fontSize: 20),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  AdminAllOurProducts(userdata: widget.userData),
                          ));
                    },
                    child: const Text(
                      'View All',
                      style: TextStyle(color: kbyoncolor3),
                    ))
              ],
            ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 200,
                child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream: ourProductStreamAdmin,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            return OurProductShimmer();
                          },
                        );
                      } else if (snapshot.hasError) {
                        return Text("Error: ${snapshot.error}");
                      } else if (!snapshot.hasData) {
                        return const Text("No data available");
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

                      return ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(bottom: 5),
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: listOfproductModel.length,
                        itemBuilder: (context, index) {
                          ProductModel productModel = listOfproductModel[index];

                          // return OurProductShimmer();

                          return OurProductTile(
                            onPress: () {
                               Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OurProductDetailScreen(productData:productModel ,userData: widget.userData,),
                              ));
                            },
                            onLongPress: () {},
                            productData: productModel,
                          );
                        },
                      );
                    }),
              ),
              SizedBox(
                height: 10,
              )
            ],
          )
        ],
      ),
    );
  }
}
