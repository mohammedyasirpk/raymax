// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures, deprecated_member_use, unnecessary_cast
import 'package:byon_care/constents.dart';
import 'package:byon_care/models/complaints_model.dart';
import 'package:byon_care/models/graph_value_model.dart';
import 'package:byon_care/models/usermodel.dart';
import 'package:byon_care/repository/topsnackbar.dart';
import 'package:byon_care/service_manager/addservicedetails_screen.dart';
import 'package:byon_care/service_manager/editservicedetails.dart';
import 'package:byon_care/service_manager/qrcodescanningbottomsheet.dart';
import 'package:byon_care/service_manager/serviceviewsecondshimmer.dart';
import 'package:byon_care/service_manager/serviceviewshimmer.dart';
import 'package:byon_care/servicess/firestore_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../customerr_screen/helper/getGraphvalue.dart';
import '../servicess/firebaseMessage/send_notification.dart';




class ServieViewScreen extends StatefulWidget {
  const ServieViewScreen({
    Key? key,
    required this.complaintid,
    this.title,
    required this.userData,
  }) : super(
          key: key,
        );

  final String? title;

  final ComplaintModel complaintid;

  final UserModel? userData;

  @override
  State<ServieViewScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServieViewScreen> {
  int value = 10;

  ComplaintModel? complaint;

   
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kbyoncolor3,
        title: Text(
          'Service View',
          style: TextStyle(
              color: Colors.white,
              fontFamily: kfontPoppinsSemiBold,
              fontSize: 22),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Addservice(
                          complaintData: widget.complaintid ),
                    ));
              },
              icon: Icon(Icons.edit))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection("complaints")
                  .doc(widget.complaintid.id)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Column(
                    children: [
                      ShimmerServiceViewFirstContainer(),
                      SizedBox(
                        height: 20,
                      ),
                      ServiceViewShimmerSecondContainer(),
                      SizedBox(
                        height: 20,
                      ),
                      ServiceViewShimmerSecondContainer(),
                      SizedBox(
                        height: 20,
                      ),
                      ServiceViewShimmerSecondContainer(),
                      SizedBox(
                        height: 20,
                      ),
                      ServiceViewShimmerSecondContainer()
                    ],
                  );
                }
                if (snapshot.hasError ) {
                  return Text('Error: ${snapshot.error}');
                }

                if (snapshot.hasData) {
                  ComplaintModel complaintdata = ComplaintModel.fromMap(
                      snapshot.data!.data() as Map<String, dynamic>,
                      snapshot.data!.id,snapshot.data!.data()?["productId"]);
                  complaint = complaintdata;

                  final GraphValueModel? graphdata = getGraphValue(
                    purchaseDate: complaintdata.productData?.purchaseDateTime,
                    warranty: complaintdata.productData?.warranty ?? 0,
                    additionalWarranty:
                        complaintdata.productData?.additionalWarranty ?? 0,
                  );

                  return Column(
                    children: [
                      MaterialButton(
                        height: 100,
                        minWidth: double.infinity,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        highlightElevation: 0,
                        onPressed: () {},
                        elevation: .8,
                        color: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: kbyoncolor3),
                                        child: Center(
                                            child: Text(
                                          complaintdata.name
                                                  ?.split("")
                                                  .first
                                                  .toUpperCase() ??
                                              "Not Available",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 22,
                                              fontFamily: kfontPoppinsMedium),
                                        )),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 9),
                                              child: Text(
                                                complaintdata.name ?? '',
                                                style: TextStyle(
                                                    color: Color(0xff230304),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                            TextButton(
                                                onPressed: () async {
                                                  await launchUrl(Uri.parse(
                                                      'tel:${complaintdata.phoneNo}'));
                                                },
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.phone,
                                                      size: 14,
                                                      color: Colors.grey,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      complaintdata.phoneNo ??
                                                          '',
                                                      style: TextStyle(
                                                        color: Color(0xff230304)
                                                            .withOpacity(0.7),
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  FutureBuilder<List<UserModel>>(
                                    future: FirestoreServices()
                                        .availableServiceTechnician(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<List<UserModel>>
                                            snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return CircularProgressIndicator(
                                            color: Colors.white);
                                      } else if (snapshot.hasError) {
                                        return Text('Error: ${snapshot.error}');
                                      } else {
                                        // PopupMenuButton

                                        return PopupMenuButton<UserModel>(
                                          padding: EdgeInsets.all(0),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(13.0),
                                            ),
                                          ),
                                          enabled: widget.userData?.role !=
                                              "technician",
                                          onSelected: (UserModel technician) async {
                                           await FirestoreServices()
                                                .changeTechnicianfromcomplaint(
                                                    complaintdata.id!,
                                                    technician);

                                                  
                                                  
                                                   
                                            sendFcmMessage(
                                                token:
                                                    technician.notification ??
                                                        '',
                                                body:
                                                    'You have a new service from ${complaint?.name ?? ""}',
                                                title: 'New Service',
                                                isLegacy: false);
                                          },
                                          itemBuilder: (BuildContext context) {
                                            return snapshot.data!
                                                .map((UserModel technician) {
                                              return PopupMenuItem<UserModel>(
                                                value: technician,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(technician.name),
                                                    Divider(),
                                                  ],
                                                ),
                                              );
                                            }).toList();
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 15),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'Technician',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xff0D5257),
                                                    fontSize: 13,
                                                  ),
                                                ),
                                                SizedBox(width: 5),
                                                Container(
                                                  height: 14,
                                                  width: 1,
                                                  decoration: BoxDecoration(
                                                      color: Color(0xff0D5257)),
                                                ),
                                                SizedBox(width: 5),
                                                Text(
                                                  complaintdata
                                                          .technicianName ??
                                                      'Select a Technician',
                                                  style: TextStyle(
                                                    color: Color(0xff0D5257),
                                                    fontSize: 13,
                                                  ),
                                                ),
                                                SizedBox(width: 5),
                                                Icon(
                                                  Icons.keyboard_arrow_down,
                                                  size: 15,
                                                  color: Colors.grey,
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: InkWell(
                                onTap: () async {
                                  String? qrcode =
                                      await FlutterBarcodeScanner.scanBarcode(
                                          '#ff6666',
                                          'Cancel',
                                          false,
                                          ScanMode.DEFAULT);
                                  if (qrcode != "-1") {
                                    qrcodescanningproductdetails(
                                        context, qrcode, isService: true,
                                        onconformed: (productdata) async {
                                      if (productdata != null) {
                                        await FirestoreServices()
                                            .editcomplaintproductdetails(
                                                productdata, complaintdata.id!);

                                        Navigator.pop(
                                          context,
                                          true,
                                        );
                                      }
                                    });
                                  }
                                },
                                child: Image.asset(
                                  'images/qrcodescan.png',
                                  height: 40,
                                  width: 40,
                                  color: kbyoncolor3,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Theme(
                        data: Theme.of(context)
                            .copyWith(dividerColor: Colors.transparent),
                        child: Container(
                          decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 0.5), //(x,y)
                                  blurRadius: 0.5,
                                ),
                              ],
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: ExpansionTile(
                            initiallyExpanded: true,
                            onExpansionChanged: (value) {},
                            tilePadding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 5),
                            title: const Text(
                              "Customer Details",
                              style: TextStyle(
                                  color: Color(0xff00281F),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                            childrenPadding:
                                const EdgeInsets.all(24).copyWith(top: 0),
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                          Icons.person,
                                          color: kbyoncolor3,
                                          size: 13,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Customer Name ",
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
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 22),
                                    child: Text(
                                      complaintdata.name ?? '',
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                          Icons.phone,
                                          color: kbyoncolor3,
                                          size: 13,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Phone Number ",
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
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 22),
                                    child: Text(
                                      complaintdata.phoneNo ?? '',
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                          Icons.markunread_mailbox_outlined,
                                          color: kbyoncolor3,
                                          size: 13,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Address",
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
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 22),
                                    child: Text(
                                      complaintdata.address ?? "",
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
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Theme(
                        data: Theme.of(context)
                            .copyWith(dividerColor: Colors.transparent),
                        child: Container(
                          decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 0.5),
                                  blurRadius: 0.5,
                                ),
                              ],
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: ExpansionTile(
                            initiallyExpanded: true,
                            onExpansionChanged: (value) {},
                            tilePadding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 5),
                            title: const Text(
                              "Product Details",
                              style: TextStyle(
                                  color: Color(0xff00281F),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                            childrenPadding:
                                const EdgeInsets.all(24).copyWith(top: 0),
                            children: [
                              Column(
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
                                                          shape:
                                                              BoxShape.circle,
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
                                                          color:
                                                              Color(0xff8E8E93),
                                                          fontWeight:
                                                              FontWeight.w400),
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
                                                      const EdgeInsets.only(
                                                          left: 22),
                                                  child: Text(
                                                    complaintdata.qrId ??
                                                        'Not available',
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color:
                                                            Color(0xff57726C),
                                                        fontWeight:
                                                            FontWeight.w400),
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
                                                          shape:
                                                              BoxShape.circle,
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
                                                          color:
                                                              Color(0xff8E8E93),
                                                          fontWeight:
                                                              FontWeight.w400),
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
                                                      const EdgeInsets.only(
                                                          left: 22),
                                                  child: Text(
                                                    complaintdata.productData
                                                            ?.modalName ??
                                                        'not Available',
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color:
                                                            Color(0xff57726C),
                                                        fontWeight:
                                                            FontWeight.w400),
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
                                                          shape:
                                                              BoxShape.circle,
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
                                                          color:
                                                              Color(0xff8E8E93),
                                                          fontWeight:
                                                              FontWeight.w400),
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
                                                      const EdgeInsets.only(
                                                          left: 22),
                                                  child: Text(
                                                    complaintdata.productData
                                                                ?.purchaseDateTime ==
                                                            null
                                                        ? "Not available"
                                                        : DateFormat(
                                                                'dd-MM-yyyy')
                                                            .format(complaintdata
                                                                .productData!
                                                                .purchaseDateTime!
                                                                .toDate()),
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color:
                                                            Color(0xff57726C),
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
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
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Colors.white),
                                                      child: Icon(
                                                        Icons
                                                            .model_training_rounded,
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
                                                          color:
                                                              Color(0xff8E8E93),
                                                          fontWeight:
                                                              FontWeight.w400),
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
                                                      const EdgeInsets.only(
                                                          left: 22),
                                                  child: Text(
                                                    complaintdata.productData
                                                            ?.productName ??
                                                        'not available',
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color:
                                                            Color(0xff57726C),
                                                        fontWeight:
                                                            FontWeight.w400),
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
                                                          shape:
                                                              BoxShape.circle,
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
                                                          color:
                                                              Color(0xff8E8E93),
                                                          fontWeight:
                                                              FontWeight.w400),
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
                                                      const EdgeInsets.only(
                                                          left: 22),
                                                  child: Text(
                                                    complaintdata.productData
                                                            ?.dealerName ??
                                                        'not available',
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color:
                                                            Color(0xff57726C),
                                                        fontWeight:
                                                            FontWeight.w400),
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
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Colors.white),
                                                      child: Icon(
                                                        Icons
                                                            .expand_circle_down,
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
                                                          color:
                                                              Color(0xff8E8E93),
                                                          fontWeight:
                                                              FontWeight.w400),
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
                                                      const EdgeInsets.only(
                                                          left: 22),
                                                  child: Text(
                                                    complaintdata.productData
                                                                ?.warranty !=
                                                            null
                                                        ? "${(complaintdata.productData?.warranty ?? 0) + (complaintdata.productData?.additionalWarranty ?? 0)} Months"
                                                        : 'not available',
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color:
                                                            Color(0xff57726C),
                                                        fontWeight:
                                                            FontWeight.w400),
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Extensive Warranty',
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      color: Color(0xff8E8E93),
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                Text(
                                                  complaintdata.productData
                                                              ?.warranty !=
                                                          null
                                                      ? "${complaintdata.productData?.warranty} Months"
                                                      : 'not available',
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      color: Color(0xff8E8E93),
                                                      fontWeight:
                                                          FontWeight.w400),
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
                                        backgroundColor:
                                            Colors.grey.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(10),
                                        color: graphdata?.warrantyColor ??
                                            Colors.grey.withOpacity(0.2),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
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
                                              complaintdata.productData
                                                          ?.additionalWarranty !=
                                                      null
                                                  ? "${complaintdata.productData?.additionalWarranty} Months"
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
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5, top: 5),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: LinearProgressIndicator(
                                        value:
                                            graphdata?.additionalWarranty ?? 0,
                                        minHeight: 10,
                                        backgroundColor:
                                            Colors.grey.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(10),
                                        color: graphdata
                                                ?.additionalWarrantyColor ??
                                            Colors.grey.withOpacity(0.2),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Theme(
                        data: Theme.of(context)
                            .copyWith(dividerColor: Colors.transparent),
                        child: Container(
                          decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 0.5),
                                  blurRadius: 0.5,
                                ),
                              ],
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: ExpansionTile(
                            onExpansionChanged: (value) {},
                            tilePadding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 5),
                            title: const Text(
                              "Service Details",
                              style: TextStyle(
                                  color: Color(0xff00281F),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                            childrenPadding:
                                const EdgeInsets.all(24).copyWith(top: 0),
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.compare_outlined,
                                        size: 13,
                                        color: kbyoncolor3,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Complaints",
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
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 0),
                                    child: Text(
                                      complaintdata.complaints ??
                                          'not available',
                                      maxLines: 5,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.compost_rounded,
                                        size: 13,
                                        color: kbyoncolor3,
                                      ),
                                      Text(
                                        "Component",
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
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 0),
                                    child: Text(
                                      complaintdata.component ??
                                          'not available',
                                      maxLines: 5,
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xff57726C),
                                          fontWeight: FontWeight.w400),
                                    ),
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
                                          Icon(
                                            FontAwesomeIcons.coins,
                                            size: 13,
                                            color: kbyoncolor3,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "Service Charges",
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
                                        height: 5,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 0),
                                        child: Text(
                                          '₹ ${complaintdata.servicecharges ?? 0}',
                                          maxLines: 5,
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Color(0xff57726C),
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      FutureBuilder<List<UserModel>>(
                                        future: FirestoreServices()
                                            .availableServiceTechnician(),
                                        builder: (BuildContext context,
                                            AsyncSnapshot<List<UserModel>>
                                                snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return CircularProgressIndicator(
                                              color: Colors.white,
                                            );
                                          } else if (snapshot.hasError) {
                                            return Text(
                                                'Error: ${snapshot.error}');
                                          } else {
                                            return PopupMenuButton<String>(
                                              padding: EdgeInsets.all(0),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(13.0),
                                                ),
                                              ),
                                              onSelected: (
                                                String status,
                                              ) {
                                                FirestoreServices()
                                                    .changeStatus(
                                                        complaintdata.id!,
                                                        status,
                                                        Timestamp.now());
                                              },
                                              itemBuilder:
                                                  (BuildContext context) {
                                                return ([
                                                  "open",
                                                  'pending',
                                                  'closed'
                                                ] as List<String>)
                                                    .map((String status) {
                                                  return PopupMenuItem<String>(
                                                    value: status,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          status,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        Divider(),
                                                      ],
                                                    ),
                                                  );
                                                }).toList();
                                              },
                                              child: IgnorePointer(
                                                child: MaterialButton(
                                                  color: Color(0xffF9B6B6)
                                                      .withOpacity(0.69),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 0,
                                                      vertical: 0),
                                                  height: 25,
                                                  onPressed: () {},
                                                  child: Center(
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          complaintdata
                                                                  .status ??
                                                              'Select a status',
                                                          style: TextStyle(
                                                            fontSize: 11,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                      MaterialButton(
                                          color: Color(0xffCFFDD2)
                                              .withOpacity(0.69),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 0, vertical: 0),
                                          height: 25,
                                          onPressed: () {
                                            judgeSubmitConfirmBottomSheet(
                                                context, complaintdata);
                                          },
                                          child: Center(
                                              child: Row(
                                            children: [
                                              Icon(
                                                Icons.edit,
                                                size: 13,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                'Edit',
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ],
                                          ))),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Theme(
                        data: Theme.of(context)
                            .copyWith(dividerColor: Colors.transparent),
                        child: Container(
                          decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 0.5),
                                  blurRadius: 0.5,
                                ),
                              ],
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: ExpansionTile(
                            maintainState: true,
                            onExpansionChanged: (value) {
                            
                            },
                            tilePadding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 5),
                            title: const Text(
                              "Service History",
                              style: TextStyle(
                                  color: Color(0xff00281F),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                            childrenPadding:
                                const EdgeInsets.all(24).copyWith(top: 0),
                            children: [
                              FutureBuilder<List<ComplaintModel>>(
                                  future: FirestoreServices()
                                      .serviceHistory(complaintdata),
                                  builder: (BuildContext context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return CircularProgressIndicator();
                                    }
                                    if (snapshot.data!.isEmpty) {
                                      return Text(
                                        'No History found!',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: kfontPoppinsMedium),
                                      );
                                    }
                                    // print(snapshot.data?.length);
                                    return ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: snapshot.data?.length ?? 0,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 20),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height: 20,
                                                      width: 20,
                                                      decoration: BoxDecoration(
                                                          color: kbyoncolor3,
                                                          shape:
                                                              BoxShape.circle),
                                                      child: Center(
                                                        child: Text(
                                                          DateFormat('dd')
                                                              .format(snapshot
                                                                  .data![index]
                                                                  .registerDate!
                                                                  .toDate()),
                                                          style: TextStyle(
                                                              fontSize: 10,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 8,
                                                    ),
                                                    Text(
                                                      complaint!.registerDate !=
                                                              null
                                                          ? DateFormat(
                                                                  'yyyy-MM-dd')
                                                              .format(snapshot
                                                                  .data![index]
                                                                  .registerDate!
                                                                  .toDate())
                                                          : 'Not Available',
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color:
                                                              Color(0xff8E8E93),
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        '',
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            color: Color(
                                                                0xff57726C),
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 8,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Technician',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff0D5257),
                                                          fontSize: 13),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Container(
                                                      height: 14,
                                                      width: 1,
                                                      decoration: BoxDecoration(
                                                          color: Color(
                                                              0xff0D5257)),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Icon(
                                                      Icons.person,
                                                      size: 13,
                                                      color: Colors.grey,
                                                    ),
                                                    Text(
                                                      snapshot.data![index]
                                                              .technicianName ??
                                                          'not available',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff0D5257),
                                                          fontSize: 13),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 3),
                                                  child: Text(
                                                    snapshot.data![index]
                                                            .complaints ??
                                                        'not available',
                                                    maxLines: 5,
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color:
                                                            Color(0xff00281F),
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 0,
                                                                vertical: 0),
                                                        height: 25,
                                                        width: 80,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            color: Color(
                                                                    0xffF9B6B6)
                                                                .withOpacity(
                                                                    .64)),
                                                        child: Center(
                                                            child: Text(
                                                          snapshot.data![index]
                                                                  .status ??
                                                              "Not Available",
                                                          style: TextStyle(
                                                              fontSize: 11,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ))),
                                                    Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 0,
                                                                vertical: 0),
                                                        height: 25,
                                                        width: 80,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            color: Color(
                                                                0xffCFFDD2)),
                                                        child: Center(
                                                            child: Text(
                                                          "₹ ${snapshot.data![index].servicecharges ?? 0}",
                                                          style: TextStyle(
                                                              fontSize: 11,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ))),
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 0),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                        height: 1.5,
                                                        width: double.infinity,
                                                        decoration: BoxDecoration(
                                                            color: Color(
                                                                    0xffD9D9D9)
                                                                .withOpacity(
                                                                    0.4)),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        });
                                  }),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  );
                } else {
                  return Text('data');
                }
              }),
        ),
      ),
    );
  }
}
