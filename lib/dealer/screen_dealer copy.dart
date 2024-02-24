// ignore_for_file: prefer_const_constructors, unused_local_variable
import 'package:byon_care/customerr_screen/constants/constents.dart';
import 'package:byon_care/customerr_screen/customer_screen.dart';
import 'package:byon_care/customerr_screen/repository/customer_repo.dart';
import 'package:byon_care/customerr_screen/widgets/listtile_product.dart';
import 'package:byon_care/customerr_screen/widgets/our_product.dart';
import 'package:byon_care/dealer/data/dealerwarrantytiles.dart';
import 'package:byon_care/drawer/drawer.dart';
import 'package:byon_care/models/usermodel.dart';
import 'package:byon_care/repository/topsnackbar.dart';
import 'package:byon_care/servicess/firestore_services.dart';
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
import '../admin_screen/viewall_screens/ourproduct.dart';
import '../admin_screen/viewallscreen.dart';
import '../constants/string_constant.dart';
import '../constents.dart';
import '../models/product_model_class.dart';
import '../screen/complaint_screen.dart';
import '../screen/myproductViewScreen.dart';
import '../service_manager/qrcodescanningbottomsheet.dart';

class DealerScreen extends StatefulWidget {
  const DealerScreen({Key? key, required this.userData}) : super(key: key);

  final UserModel userData;

  @override
  State<DealerScreen> createState() => _DealerScreen();
}

class _DealerScreen extends State<DealerScreen> {
  final currentUserEmail = FirebaseAuth.instance.currentUser!.email;

  late Stream<QuerySnapshot<Map<String, dynamic>>> productStream;

  final CustomerRepo customerRepo = CustomerRepo();
  @override
  void initState() {
     productStream = FirebaseFirestore.instance
        .collection("items")
        .where("dealerId", isEqualTo:FirebaseAuth.instance.currentUser!.uid)
        .limit(2)
        .snapshots();
    super.initState();
  }

  final ourProductStreamAdmin =
      FirebaseFirestore.instance.collection("ourProduct").limit(5).snapshots();

  String? qrCode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SpeedDial(
          backgroundColor: kbyoncolor3,
          icon: Icons.support_agent_outlined,
          children: [
            SpeedDialChild(
              child: const Icon(Icons.phone),
              label: 'Phone',
              onTap: () async {
                await launchUrl(Uri.parse('tel:$customerServiceNumber'));
              },
            ),
            SpeedDialChild(
              shape: const CircleBorder(side: BorderSide.none),
              child: const Icon(Icons.report_problem),
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
                        ].map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                alignment: Alignment.center,
                                child: Image.asset(
                                  i,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        margin: const EdgeInsets.only(left: 10),
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
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                        ).copyWith(right: 10),
                        // margin: const EdgeInsets.only(left: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image.asset("images/xeon2.png", height: 8),
                            const SizedBox(
                              width: 5,
                            ),
                            Image.asset("images/zender1.png", height: 8),
                            const SizedBox(
                              width: 5,
                            ),
                            Image.asset(
                              "images/xeon1.png",
                              height: 7,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Last Sales',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Colors.black)),
                    TextButton(
                        onPressed: () {
                           Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AllSalesViewScreen(dealerData: widget.userData),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: productStream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                          child: CircularProgressIndicator(color: kbyoncolor3));
                    } else if (snapshot.hasError) {
                      return Text("Error: ${snapshot.error}");
                    } else if (!snapshot.hasData) {
                      return Text("");
                    }
                    final List<ProductModel> listOfproductModel = [];
                    List<QueryDocumentSnapshot<Map<String, dynamic>>>
                        listOfProducts = snapshot.data!.docs;
                    for (var item in listOfProducts) {
                      final product = item.data();

                      final ProductModel model =
                          ProductModel.fromMap(product, item.id);

                      if (model.purchaseDateTime != null) {
                        listOfproductModel.add(model);
                      }
                    }
                  

                    return ListView.builder(
                      
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: listOfproductModel.length,
                      itemBuilder: (context, index) {
                        final item = listOfproductModel[index];
                        return ProductListTile(
                             onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyProductViewScreen(productData: item,userData:widget.userData ,),));
                          },
                          productData: item,
                        );
                      },
                    );
                  },
                ),
              ),
            
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: DealerListtile(
                  onTap: () async {
                    String? qrcode = await FlutterBarcodeScanner.scanBarcode(
                        '#ff6666', 'Cancel', false, ScanMode.DEFAULT);
                    if (qrcode != "-1") {

                    // final productmodelData =   await  FirestoreServices().
                    // if(productmodelData != null){
                    //   showsnackbar("This Product is All ready Sold", context);
                    //   return;
                    // }
   

                      qrcodescanningproductdetails(context, qrcode,isStarWarranty: true,
                          onconformed: (productdata) {

                        if (productdata != null) {
                          FirestoreServices()
                              .startWarranty(widget.userData, productdata);
                          Navigator.pop(
                            context,
                            true,
                          );
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
                child:Row(
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
              StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: ourProductStreamAdmin,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
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

                    return SizedBox(
                      height: 200,
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(bottom: 5),
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: listOfproductModel.length,
                        itemBuilder: (context, index) {
                          ProductModel productModel = listOfproductModel[index];
                          return OurProductTile(
                            onPress: () {
                                 Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OurProductDetailScreen(productData:productModel ,userData: widget.userData,),
                              ));
                            },
                           
                            productData: productModel,
                          );
                        },
                      ),
                    );
                  }),
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
