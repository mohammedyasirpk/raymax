// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, dead_code
import 'package:byon_care/constents.dart';
import 'package:byon_care/drawer/drawer.dart';
import 'package:byon_care/models/complaints_model.dart';
import 'package:byon_care/models/product_model_class.dart';
import 'package:byon_care/models/usermodel.dart';
import 'package:byon_care/screen/graph_container.dart';
import 'package:byon_care/screen/rating_button.dart';
import 'package:byon_care/service_manager/addservicedetails_screen.dart';
import 'package:byon_care/service_manager/complaint_service_container.dart';
import 'package:byon_care/service_manager/openservices_screen.dart';
import 'package:byon_care/service_manager/servicemanagershimmer.dart';
import 'package:byon_care/service_manager/viewallscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';

import '../repository/topsnackbar.dart';
import '../service_manager/qrcodescanningbottomsheet.dart';

class ServiceTechnicianDashboard extends StatefulWidget {
  const ServiceTechnicianDashboard({Key? key, required this.userData})
      : super(key: key);

  final UserModel userData;

  @override
  State<ServiceTechnicianDashboard> createState() =>
      _ServiceManagerDashboardState();
}

class _ServiceManagerDashboardState extends State<ServiceTechnicianDashboard> {
  int selectedValue = 0;

  Stream<QuerySnapshot<Map<String, dynamic>>>? servicestream;

  @override
  void initState() {
    servicestream = FirebaseFirestore.instance
        .collection("complaints")
        .where("technicianId", isEqualTo: widget.userData.uid)
        .orderBy("registerDate", descending: true)
        .limit(7)
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
                                child: Text('0 Count',
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
                              padding:
                                  EdgeInsets.only(top: 10, left: 20, right: 10),
                              child: Row(
                                children: [
                                  Text('Top Products',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: Colors.black)),
                                  Spacer(),
                                  RatingButton()
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 22, top: 10),
                                child: Text(
                                  'Raymax Product One',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 5),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  height: 13,
                                  width: 200,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: kbyoncolor3),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 5),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  ' January 4, 2024',
                                  style: GoogleFonts.poppins(
                                    color: Colors.grey,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 22, top: 5),
                                child: Text(
                                  'Raymax Product Two',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 5),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  height: 13,
                                  width: 200,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: kbyoncolor3),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 5),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  ' January 4, 2024',
                                  style: GoogleFonts.poppins(
                                    color: Colors.grey,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 22, top: 5),
                                child: Text(
                                  'Raymax Product Three',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 5),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  height: 13,
                                  width: 200,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: kbyoncolor3),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 5),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  ' January 4, 2024',
                                  style: GoogleFonts.poppins(
                                    color: Colors.grey,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ]),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0).copyWith(bottom: 0),
              child: Row(
                children: [
                  Expanded(
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
                              builder: (context) => ViewAllScreen(
                                userData: widget.userData,
                              ),
                            ));
                      },
                      child: Text(
                        'View All',
                        style: TextStyle(color: kbyoncolor3),
                      ))
                ],
              ),
            ),
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: servicestream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return ShimmerServiceManager();
                }

                List<ComplaintModel> allcomplaintlist = [];

                for (QueryDocumentSnapshot<Map<String, dynamic>> element
                    in snapshot.data?.docs ?? []) {
                  ComplaintModel xcomplaints = ComplaintModel.fromMap(
                      element.data(), element.id, element.data()["productId"]);
                  allcomplaintlist.add(xcomplaints);
                }

                return Column(
                  children: [
                   
                    Padding(
                      padding: const EdgeInsets.all(10.0).copyWith(top: 0),
                      child: allcomplaintlist.isNotEmpty
                          ? ListView.separated(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return ComplainServiceContainer(
                                    userData: widget.userData,
                                    complaint: allcomplaintlist[index]);
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(
                                  height: 10,
                                );
                              },
                              itemCount: allcomplaintlist.length,
                            )
                          : Center(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'No data available in 7 days',
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
          ],
        ),
      ),
      floatingActionButton:
          SpeedDial(backgroundColor: kbyoncolor3, icon: Icons.add, children: [
        SpeedDialChild(
          child: const Icon(Icons.graphic_eq_outlined),
          label: "Add Service",
          onTap: () async {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Addservice(
                      complaintData:
                          ComplaintModel(productData: ProductModel())),
                ));
          },
        ),
        SpeedDialChild(
          shape: const CircleBorder(side: BorderSide.none),
          child:  Image.asset("images/qrcodescan.png",width: 20,),
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
    );
  }
}
