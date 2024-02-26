import 'package:byon_care/admin_screen/add_our_product.dart';
import 'package:byon_care/admin_screen/shimmer/user_shimmer.dart';
import 'package:byon_care/drawer/drawer.dart';
import 'package:byon_care/models/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../constents.dart';
import '../customerr_screen/widgets/listtile_product.dart';
import '../customerr_screen/widgets/our_product.dart';
import '../models/complaints_model.dart';
import '../models/product_model_class.dart';
import '../repository/topsnackbar.dart';
import '../screen/myproductViewScreen.dart';
import '../screen/userview_screens.dart/screen_admin_userview.dart.dart';
import '../service_manager/addservicedetails_screen.dart';
import '../service_manager/complaint_service_container.dart';
import '../service_manager/qrcodescanningbottomsheet.dart';
import '../service_manager/servicemanagershimmer.dart';
import '../service_manager/viewallscreen.dart';
import 'all_our_product_screen.dart';
import 'ourproduct/our_product_details.dart';
import 'shimmer/lastsale_shimmer.dart';
import 'shimmer/our_product_shimmer.dart';
import 'user/edit_user_screen.dart';
import 'viewall_screens/user_all.dart';
import 'viewallscreen.dart';
import 'widgets/user_container.dart';

class ScreenAdmin extends StatelessWidget {
  ScreenAdmin({Key? key, required this.userdata}) : super(key: key);

  final UserModel userdata;

  final servicestream = FirebaseFirestore.instance
      .collection("complaints")
      .orderBy("registerDate", descending: true)
      .limit(1)
      .snapshots();

  final ourProductStreamAdmin =
      FirebaseFirestore.instance.collection("ourProduct").limit(5).snapshots();

  final productStreamAdmin = FirebaseFirestore.instance
      .collection("items")
      .orderBy("purchaseDate", descending: true)
      .where("purchaseDate", isNull: false)
      .limit(1)
      .snapshots();

  final usersStream = FirebaseFirestore.instance
      .collection("users")
      .orderBy("registeredDate", descending: true)
      .limit(3)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          SpeedDial(backgroundColor: kbyoncolor3, icon: Icons.add, children: [
        SpeedDialChild(
          child: const Icon(Icons.miscellaneous_services),
          label: "Add Service",
          onTap: () async {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      Addservice(complaintData: ComplaintModel()),
                ));
          },
        ),
        SpeedDialChild(
          shape: const CircleBorder(side: BorderSide.none),
          child: Image.asset(
            "images/qrcodescan.png",
            width: 20,
          ),
          label: "Scan Product",
          onTap: () async {
            String? qrcode = await FlutterBarcodeScanner.scanBarcode(
                '#ff6666', 'Cancel', false, ScanMode.DEFAULT);
            if (qrcode != "-1") {
              await qrcodescanningproductdetails(context, qrcode,
                  onconformed: (productdata) async {
                if (productdata != null && productdata.productionDate != null) {
                  Navigator.pop(
                    context,
                    true,
                  );
                } else {
                  showsnackbar(
                      "Invalid Product", context, SnackbarCondition.failure);
                }
              });
            }
          },
        ),
      ]),
      endDrawer: MyDrawer(userdta: userdata),
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
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Last Sale',
                        style: TextStyle(
                            fontFamily: kfontPoppinsMedium, fontSize: 20),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AllSalesViewScreen(),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: productStreamAdmin,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const LastSaleShimmer();
                    }
                    if (snapshot.hasError) {
                      return Text("Error: ${snapshot.error}");
                    }
                    if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
                      return const SizedBox();
                    }
                    final List<ProductModel> listOfproductModel = [];
                    List<QueryDocumentSnapshot<Map<String, dynamic>>>
                        listOfProducts = snapshot.data?.docs ?? [];
                    for (var item in listOfProducts) {
                      final product = item.data();

                      final ProductModel model =
                          ProductModel.fromMap(product, item.id);

                      listOfproductModel.add(model);
                    }

                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        final item = listOfproductModel[index];

                        return ProductListTile(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MyProductViewScreen(
                                  productData: item, userData: userdata),
                            ));
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
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Services',
                        style: TextStyle(
                            fontFamily: kfontPoppinsMedium, fontSize: 20),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ViewAllScreen(userData: userdata),
                              ));
                        },
                        child: const Text(
                          'View All',
                          style: TextStyle(color: kbyoncolor3),
                        ))
                  ],
                ),
              ),
            ],
          ),
          StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: servicestream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return ShimmerServiceManager();
              }

              if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              }

              if (!snapshot.hasData || snapshot.data == null) {
                return const Text("");
              }
              List<ComplaintModel> complaintList = [];
              for (QueryDocumentSnapshot<Map<String, dynamic>> element
                  in snapshot.data?.docs ?? []) {
                complaintList.add(ComplaintModel.fromMap(
                    element.data(), element.id, element.data()["productId"]));
              }

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: complaintList.isNotEmpty
                        ? ListView.separated(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return ComplainServiceContainer(
                                  userData: userdata,
                                  complaint: complaintList[index]);
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(
                                height: 10,
                              );
                            },
                            itemCount: complaintList.length,
                          )
                        : const Center(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'No data available',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: kfontPoppinsRegular),
                              ),
                            ),
                          ),
                  ),
                ],
              );
            },
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
                            builder: (context) =>
                                AdminAllOurProducts(userdata: userdata),
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
            height: 5,
          ),
          SizedBox(
            height: 200,
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: ourProductStreamAdmin,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
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
                    return const SizedBox();
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                                builder: (context) => OurProductDetailScreen(
                                  productData: productModel,
                                  userData: userdata,
                                ),
                              ));
                        },
                        onLongPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddOurProductAdmin(
                                    productData: productModel),
                              ));
                        },
                        productData: productModel,
                      );
                    },
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'Recent Users',
                    style:
                        TextStyle(fontFamily: kfontPoppinsMedium, fontSize: 20),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ScreenUserViewAll(),
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
              stream: usersStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return UserShimmerContainer();
                } else if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                } else if (!snapshot.hasData) {
                  return const Text("No data available");
                }

                final List<UserModel> listOfUserstModel = [];
                List<QueryDocumentSnapshot<Map<String, dynamic>>>
                    listOfProducts = snapshot.data!.docs;

                for (var user in listOfProducts) {
                  final userData = user.data();

                  final usermodel = UserModel.fromMap(userData, user.id);
                  listOfUserstModel.add(usermodel);
                }

                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    final item = listOfUserstModel[index];
                    // return UserShimmerContainer();
                    return UserContainer(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  UserDetailsViewScreen(userData: item),
                            ));
                      },
                      userData: item,
                      onLongPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  EditUserScreen(userData: item),
                            ));
                      },
                    );
                  },
                );
              })
        ],
      ),
    );
  }
}
