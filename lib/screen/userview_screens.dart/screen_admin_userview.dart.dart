// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures, deprecated_member_use, unnecessary_cast
import 'package:byon_care/admin_screen/shimmer/shimmer_service.dart';
import 'package:byon_care/admin_screen/user/edit_user_screen.dart';
import 'package:byon_care/constants/string_constant.dart';
import 'package:byon_care/constents.dart';
import 'package:byon_care/customerr_screen/helper/getGraphvalue.dart';
import 'package:byon_care/models/complaints_model.dart';
import 'package:byon_care/models/graph_value_model.dart';
import 'package:byon_care/models/product_model_class.dart';
import 'package:byon_care/models/usermodel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screen_technician_manager_user_view.dart';

class UserDetailsViewScreen extends StatefulWidget {
  const UserDetailsViewScreen({
    Key? key,
    required this.userData,
  }) : super(
          key: key,
        );

  final UserModel userData;

  @override
  State<UserDetailsViewScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<UserDetailsViewScreen> {
  String heading = "Products";

  Stream<QuerySnapshot<Map<String, dynamic>>>? productStreamforproduction;

  String capitalizeFirstLetter(String s) {
    if (s.isEmpty) {
      return s;
    }
    return s[0].toUpperCase() + s.substring(1);
  }

  int value = 10;

  ComplaintModel? complaint;

  Future<List<ComplaintModel>>? servicehistoryfuture;

  GraphValueModel? graphdata;

  final currentUserEmail = FirebaseAuth.instance.currentUser!.email;

  late UserModel user;
  late Stream<DocumentSnapshot<Map<String, dynamic>>> userStreamAd;

  @override
  void initState() {
    user = widget.userData;

    userStreamAd = FirebaseFirestore.instance
        .collection("users")
        .doc(widget.userData.uid)
        .snapshots();

    if (widget.userData.role == 'production') {
      heading = 'Last Production';
    } else if (widget.userData.role == 'dealer') {
      heading = 'Last Sales';
    } else if (widget.userData.role == 'service manager') {
      heading = 'Service Details';
    } else if (widget.userData.role == 'technician') {
      heading = 'Service Details';
    } else {
      heading = 'Products';
    }

    if (widget.userData?.role == 'production') {
      productStreamforproduction = FirebaseFirestore.instance
          .collection("items")
          .orderBy('productionDate', descending: true)
          .snapshots();
    } else if (widget.userData?.role == 'dealer') {
      productStreamforproduction = FirebaseFirestore.instance
          .collection("items")
          .where("dealerId", isEqualTo: widget.userData?.uid)
          .snapshots();
      super.initState();
    } else {
      productStreamforproduction = FirebaseFirestore.instance
          .collection("items")
          .where("customerId", isEqualTo: widget.userData?.uid)
          .snapshots();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kbyoncolor3,
          title: Text(
            'User View',
            style: TextStyle(
                color: Colors.white,
                fontFamily: kfontPoppinsSemiBold,
                fontSize: 22),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditUserScreen(
                          userData: widget.userData,
                        ),
                      ));
                },
                icon: Icon(Icons.edit))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                  stream: userStreamAd,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (snapshot.hasError) {
                      return Text("Error: ${snapshot.error}");
                    }

                 final userDataStream = snapshot.data;
                  final userData = userDataStream?.data() ?? {} ;
              
                final UserModel userDataModel = UserModel.fromMap(userData, userDataStream!.id);
                user = userDataModel;

                    return MaterialButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                        width: 90,
                                        height: 90,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.elliptical(5, 5)),
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: kbyoncolor3, width: 2),
                                              image: user.image ==
                                                      null
                                                  ? const DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: AssetImage(
                                                          "images/profile_pic-removebg-preview.png"))
                                                  : DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: NetworkImage(user.image!))),
                                        )),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 0),
                                            child: Text(
                                             user.name ??
                                                  'Not Available',
                                              style: TextStyle(
                                                  color: Color(0xff230304),
                                                  fontSize: 20,
                                                  fontFamily:
                                                      kfontPoppinsMedium,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          Text(
                                            capitalizeFirstLetter(
                                                user.role ??
                                                    'customer'),
                                            style: TextStyle(
                                              color: Color(0xff230304)
                                                  .withOpacity(0.9),
                                              fontSize: 13,
                                              fontFamily: kfontRobotoRegular,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.email_outlined,
                                                color: Colors.grey,
                                                size: 15,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Expanded(
                                                child: Text(
                                                 user.email ??
                                                      'Not Available',
                                                  style: TextStyle(
                                                    color: Color(0xff230304)
                                                        .withOpacity(0.7),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.phone,
                                                size: 15,
                                                color: Colors.grey,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                user.phoneNo ??
                                                    'Not Available',
                                                style: TextStyle(
                                                  color: Color(0xff230304)
                                                      .withOpacity(0.7),
                                                  fontSize: 13,
                                                  fontFamily:
                                                      kfontRobotoRegular,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  heading,
                  style:
                      TextStyle(fontFamily: kfontPoppinsMedium, fontSize: 20),
                ),
              ),
              widget.userData.role == ktechnician ||
                      widget.userData.role == kserviceManager
                  ? UserViewTechnicianandSerManagerScreen(
                      userData: widget.userData,
                    )
                  : Expanded(
                      child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                          stream: productStreamforproduction,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                  child: ShimmerServiceManager(
                                userData: widget.userData,
                              ));
                            }
                            final List<ProductModel> listOfproductModel = [];
                            if (snapshot.data == null) {
                              return Center(
                                child: Text(
                                  'No Data Available',
                                  style: TextStyle(
                                      fontFamily: kfontPoppinsMedium,
                                      fontSize: 15),
                                ),
                              );
                            }
                            List<QueryDocumentSnapshot<Map<String, dynamic>>>
                                listOfProducts = snapshot.data!.docs;

                            for (var item in listOfProducts) {
                              final product = item.data();

                              final ProductModel model =
                                  ProductModel.fromMap(product, item.id);

                              listOfproductModel.add(model);
                            }
                            if (listOfproductModel.isEmpty) {
                              return Center(
                                child: Text(
                                  'No Products Available',
                                  style: TextStyle(
                                      fontFamily: kfontPoppinsMedium,
                                      fontSize: 15),
                                ),
                              );
                            }

                            return ListView.separated(
                              scrollDirection: Axis.vertical,
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                GraphValueModel? graphdata = getGraphValue(
                                    purchaseDate: listOfproductModel[index]
                                        .purchaseDateTime,
                                    warranty:
                                        listOfproductModel[index].warranty ?? 0,
                                    additionalWarranty:
                                        listOfproductModel[index]
                                                .additionalWarranty ??
                                            0);

                                return Container(
                                  margin: const EdgeInsets.only(
                                      right: 10, left: 10),
                                  child: MaterialButton(
                                    height: 130,
                                    child: Row(
                                      children: [
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        SizedBox(
                                            width: 80,
                                            child: listOfproductModel[index]
                                                        .imageUrl ==
                                                    null
                                                ? Image.asset(
                                                    "images/5357829_prev.jpg",
                                                  )
                                                : CachedNetworkImage(
                                                    imageUrl:
                                                        listOfproductModel[
                                                                index]
                                                            .imageUrl!)),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    capitalizeFirstLetter(
                                                      listOfproductModel[index]
                                                              .productName ??
                                                          " Not Available",
                                                    ),
                                                    style: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 18,
                                                        color: Colors.black)),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                RichText(
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: listOfproductModel[
                                                                    index]
                                                                .modalName
                                                                ?.toUpperCase() ??
                                                            "",
                                                        style: const TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.grey,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                      const TextSpan(
                                                        text:
                                                            " ", // Add space here
                                                        style: TextStyle(
                                                          // Adjust space width here
                                                          letterSpacing: 2.0,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            listOfproductModel[
                                                                        index]
                                                                    .qrId ??
                                                                "",
                                                        style: const TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.grey,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "WARRANTY EXPIRY",
                                                    ),
                                                    Text(
                                                      "${(listOfproductModel[index].warranty ?? 0) + (listOfproductModel[index].additionalWarranty ?? 0)} Months",
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff777676),
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                SizedBox(
                                                    height: 9,
                                                    child: listOfproductModel[
                                                                    index]
                                                                .purchaseDateTime ==
                                                            null
                                                        ? SizedBox()
                                                        : LinearProgressIndicator(
                                                            value: (graphdata
                                                                        ?.warrantyValue ??
                                                                    0) +
                                                                (graphdata
                                                                        ?.additionalWarranty ??
                                                                    0),
                                                            backgroundColor:
                                                                Colors.grey
                                                                    .withOpacity(
                                                                        0.2),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            color: graphdata
                                                                ?.warrantyColor,
                                                          ))
                                              ]),
                                        )
                                      ],
                                    ),
                                    minWidth: double.infinity,
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    highlightElevation: 0,
                                    onPressed: () {},
                                    elevation: .8,
                                    color: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(height: 10);
                              },
                              itemCount: listOfproductModel.length,
                            );
                          }))
            ],
          ),
        ));
  }
}
