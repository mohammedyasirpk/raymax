// // ignore_for_file: prefer_const_constructors, unused_local_variable, sdk_version_since
// import 'package:byon_care/constents.dart';
// import 'package:byon_care/servicess/firestore_services.dart';
// import 'package:byon_care/widgets/bloodtestresults.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// import 'package:intl/intl.dart';

// class Dealertap extends StatefulWidget {
//   const Dealertap({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<Dealertap> createState() => _ServicetapState();
// }

// class _ServicetapState extends State<Dealertap> {
//   PageController pageController = PageController();
//   String brandname = "Nixown";
//   String producttype = "Inverter";
//   String modelname = "1000 VA";
//   String colours = "Black";
//   String? qrcode;
//   bool isloading = false;
//   String warranty = "1 Year";
//   int pagenumber = 0;
//   String? productionDate;

//   @override
//   void dispose() {
//     pageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     DateTime purchaseDatee = DateTime(1990, 5, 15);
//     DateTime currentDate = DateTime.now();
//     Duration difference = currentDate.difference(purchaseDatee);

//     return Column(
//       children: [
//         const SizedBox(
//           height: 25.0,
//         ),
//         qrcode == null
//             ? Expanded(
//                 child: ListView(
//                   children: [
//                     Card(
//                       elevation: 2,
//                       color: Colors.white,
//                       shape: const RoundedRectangleBorder(
//                           borderRadius:
//                               BorderRadius.all(Radius.circular(10.0))),
//                       child: Container(
//                         color: Colors.white,
//                         margin: const EdgeInsets.all(5),
//                         height: 350.0,
//                         width: double.infinity,
//                         child: Column(
//                           children: [
//                             const SizedBox(
//                               height: 10.0,
//                             ),
//                             Row(
//                               children: [
//                                 const SizedBox(
//                                   width: 20.0,
//                                 ),
//                                 const Text(
//                                   'Scan QR Code',
//                                   style: TextStyle(
//                                       color: kbyoncolor6,
//                                       fontSize: 25.0,
//                                       fontFamily: kfontRubikMedium),
//                                 ),
//                                 const Spacer(),
//                                 Image.asset(
//                                   'images/blood_sugar_hart.png',
//                                   height: 30,
//                                   width: 30,
//                                 ),
//                                 const SizedBox(
//                                   width: 20.0,
//                                 )
//                               ],
//                             ),
//                             const Spacer(),
//                             Image.asset(
//                               "images/qrcodescan.png",
//                               height: 180.0,
//                             ),
//                             const Spacer(),
//                             const SizedBox(
//                               width: 40.0,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: const [
//                         Text(
//                           'Nixon Power technology  Pvt Ltd, Manjeri',
//                           style: TextStyle(
//                               color: Color(0XFF000000),
//                               fontSize: 14,
//                               fontFamily: kfontPoppinsMedium),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         MaterialButton(
//                           onPressed: () async {
//                             qrcode = await FlutterBarcodeScanner.scanBarcode(
//                                 '#ff6666', 'Cancel', false, ScanMode.DEFAULT);
//                            // log(qrcode.toString());
//                             setState(() {});
//                             await Future.delayed(const Duration(seconds: 2));
//                             if (qrcode != null) {
//                             }
//                           },
//                           shape: const RoundedRectangleBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(30.0))),
//                           minWidth: 235,
//                           height: 44,
//                           color: kbyoncolor3,
//                           child: const Text(
//                             "Scan ",
//                             style: TextStyle(
//                                 color: Color(0XFFFFFFFF),
//                                 fontSize: 17,
//                                 fontFamily: 'Avenir-Heavy'),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               )
//             : Expanded(
//                 child: FutureBuilder(
//                     future: FirestoreServices().getUploadItem(qrcode!,context),
//                     builder: (BuildContext context,
//                         AsyncSnapshot<dynamic> snapshot) {
//                       if (snapshot.connectionState == ConnectionState.waiting) {
//                         return Center(
//                           child: CircularProgressIndicator(),
//                         );
//                       }

//                       if (snapshot.hasError) {
//                         return Text('No product details');
//                       }
//                       var document = snapshot.data.docs;

//                       if (document == null || document.isEmpty) {
//                         return Text('No data');
//                       }

//                       return ListView(
//                         children: [
//                           SizedBox(
//                             height: 750,
//                             child: Card(
//                               elevation: 2,
//                               color: Colors.white,
//                               shape: const RoundedRectangleBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(10.0))),
//                               child: Container(
//                                 color: Colors.white,
//                                 margin: const EdgeInsets.all(5),
//                                 height: 320.0,
//                                 child: Column(
//                                   children: [
//                                     const SizedBox(
//                                       height: 10.0,
//                                     ),
//                                     Row(
//                                       children: [
//                                         const SizedBox(
//                                           width: 20.0,
//                                         ),
//                                         const Text(
//                                           'Product Details',
//                                           style: TextStyle(
//                                               color: kbyoncolor6,
//                                               fontSize: 25.0,
//                                               fontFamily: kfontRubikMedium),
//                                         ),
//                                         const Spacer(),
//                                         Image.asset(
//                                           'images/blood_sugar_hart.png',
//                                           height: 30,
//                                           width: 30,
//                                         ),
//                                         const SizedBox(
//                                           width: 20.0,
//                                         )
//                                       ],
//                                     ),
//                                     const SizedBox(
//                                       height: 25.0,
//                                     ),
//                                     Row(
//                                       children: const [
//                                         SizedBox(
//                                           width: 20.0,
//                                         ),
//                                         Text(
//                                           'Brand Name',
//                                           style: TextStyle(
//                                               color: kbyoncolor6,
//                                               fontSize: 14,
//                                               fontFamily: kfontRubikMedium),
//                                         ),
//                                         Spacer(),
//                                         Text(
//                                           '',
//                                           style: TextStyle(
//                                               fontSize: 25,
//                                               color: kbyoncolor6,
//                                               fontFamily: kfontRobotoBold),
//                                         ),
//                                         SizedBox(
//                                           width: 20.0,
//                                         )
//                                       ],
//                                     ),
//                                     Container(
//                                       padding: EdgeInsets.symmetric(
//                                           horizontal: 20.0),
//                                       child: DropdownButton<String>(
//                                         isExpanded: true,
//                                         value: brandname,
//                                         items: [
//                                           DropdownMenuItem(
//                                             child: Text(
//                                               document[0]['brandName'],
//                                               style: TextStyle(
//                                                   color: Color(0XFF000000),
//                                                   fontSize: 14,
//                                                   fontFamily:
//                                                       kfontPoppinsMedium),
//                                             ),
//                                             value: "Nixown",
//                                           ),
//                                         ],
//                                         onChanged: null,
//                                         underline: Container(),
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       height: 5.0,
//                                     ),
//                                     const Doteline(),
//                                     const SizedBox(
//                                       height: 15,
//                                     ),
//                                     Row(
//                                       children: const [
//                                         SizedBox(
//                                           width: 20.0,
//                                         ),
//                                         Text(
//                                           'Product type',
//                                           style: TextStyle(
//                                               color: kbyoncolor6,
//                                               fontSize: 14,
//                                               fontFamily: kfontRubikMedium),
//                                         ),
//                                         Spacer(),
//                                         Text(
//                                           '',
//                                           style: TextStyle(
//                                               fontSize: 25,
//                                               color: kbyoncolor6,
//                                               fontFamily: kfontRobotoBold),
//                                         ),
//                                         SizedBox(
//                                           width: 20.0,
//                                         )
//                                       ],
//                                     ),
//                                     Container(
//                                       padding: EdgeInsets.symmetric(
//                                           horizontal: 20.0),
//                                       child: DropdownButton<String>(
//                                         isExpanded: true,
//                                         value: producttype,
//                                         items: [
//                                           DropdownMenuItem(
//                                             child: Text(
//                                               document[0]['productType'],
//                                               style: TextStyle(
//                                                   color: Color(0XFF000000),
//                                                   fontSize: 14,
//                                                   fontFamily:
//                                                       kfontPoppinsMedium),
//                                             ),
//                                             value: "Inverter",
//                                           ),
//                                         ],
//                                         onChanged: null,
//                                         underline: Container(),
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       height: 5.0,
//                                     ),
//                                     const Doteline(),
//                                     const SizedBox(
//                                       height: 15,
//                                     ),
//                                     Row(
//                                       children: const [
//                                         SizedBox(
//                                           width: 20.0,
//                                         ),
//                                         Text(
//                                           'Modal Name',
//                                           style: TextStyle(
//                                               color: kbyoncolor6,
//                                               fontSize: 14,
//                                               fontFamily: kfontRubikMedium),
//                                         ),
//                                         Spacer(),
//                                         Text(
//                                           '',
//                                           style: TextStyle(
//                                               fontSize: 25,
//                                               color: kbyoncolor6,
//                                               fontFamily: kfontRobotoBold),
//                                         ),
//                                         SizedBox(
//                                           width: 20.0,
//                                         )
//                                       ],
//                                     ),
//                                     Container(
//                                       padding: EdgeInsets.symmetric(
//                                           horizontal: 20.0),
//                                       child: DropdownButton<String>(
//                                         isExpanded: true,
//                                         value: modelname,
//                                         items: [
//                                           DropdownMenuItem(
//                                             child: Text(
//                                               document[0]['modalName'],
//                                               style: TextStyle(
//                                                   color: Color(0XFF000000),
//                                                   fontSize: 14,
//                                                   fontFamily:
//                                                       kfontPoppinsMedium),
//                                             ),
//                                             value: "1000 VA",
//                                           ),
//                                         ],
//                                         onChanged: null,
//                                         underline: Container(),
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       height: 5.0,
//                                     ),
//                                     const Doteline(),
//                                     const SizedBox(
//                                       height: 15,
//                                     ),
//                                     Row(
//                                       children: const [
//                                         SizedBox(
//                                           width: 20.0,
//                                         ),
//                                         Text(
//                                           'Colours',
//                                           style: TextStyle(
//                                               color: kbyoncolor6,
//                                               fontSize: 14,
//                                               fontFamily: kfontRubikMedium),
//                                         ),
//                                         Spacer(),
//                                         Text(
//                                           '',
//                                           style: TextStyle(
//                                               fontSize: 25,
//                                               color: kbyoncolor6,
//                                               fontFamily: kfontRobotoBold),
//                                         ),
//                                         SizedBox(
//                                           width: 20.0,
//                                         )
//                                       ],
//                                     ),
//                                     Container(
//                                       padding: EdgeInsets.symmetric(
//                                           horizontal: 20.0),
//                                       child: DropdownButton<String>(
//                                         isExpanded: true,
//                                         value: colours,
//                                         items: [
//                                           DropdownMenuItem(
//                                             child: Text(
//                                               document[0]['colours'],
//                                               style: TextStyle(
//                                                   color: Color(0XFF000000),
//                                                   fontSize: 14,
//                                                   fontFamily:
//                                                       kfontPoppinsMedium),
//                                             ),
//                                             value: "Black",
//                                           ),
//                                         ],
//                                         onChanged: null,
//                                         underline: Container(),
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       height: 5.0,
//                                     ),
//                                     const Doteline(),
//                                     const SizedBox(
//                                       height: 15,
//                                     ),
//                                     Row(
//                                       children: const [
//                                         SizedBox(
//                                           width: 20.0,
//                                         ),
//                                         Text(
//                                           'Warranty',
//                                           style: TextStyle(
//                                               color: kbyoncolor6,
//                                               fontSize: 14,
//                                               fontFamily: kfontRubikMedium),
//                                         ),
//                                         Spacer(),
//                                         Text(
//                                           '',
//                                           style: TextStyle(
//                                               fontSize: 25,
//                                               color: kbyoncolor6,
//                                               fontFamily: kfontRobotoBold),
//                                         ),
//                                         SizedBox(
//                                           width: 20.0,
//                                         )
//                                       ],
//                                     ),
//                                     Container(
//                                       padding: EdgeInsets.symmetric(
//                                           horizontal: 20.0),
//                                       child: DropdownButton<String>(
//                                         isExpanded: true,
//                                         value: warranty,
//                                         items: [
//                                           DropdownMenuItem(
//                                             child: Text(
//                                               document[0]['warranty'],
//                                               style: TextStyle(
//                                                   color: Color(0XFF000000),
//                                                   fontSize: 14,
//                                                   fontFamily:
//                                                       kfontPoppinsMedium),
//                                             ),
//                                             value: '1 Year',
//                                           ),
//                                         ],
//                                         onChanged: null,
//                                         underline: Container(),
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       height: 5.0,
//                                     ),
//                                     const Doteline(),
//                                     const SizedBox(
//                                       height: 15,
//                                     ),
//                                     Row(
//                                       children: const [
//                                         SizedBox(
//                                           width: 20.0,
//                                         ),
//                                         Text(
//                                           'Production Date',
//                                           style: TextStyle(
//                                               color: kbyoncolor6,
//                                               fontSize: 14,
//                                               fontFamily: kfontRubikMedium),
//                                         ),
//                                         Spacer(),
//                                         Text(
//                                           '',
//                                           style: TextStyle(
//                                               fontSize: 25,
//                                               color: kbyoncolor6,
//                                               fontFamily: kfontRobotoBold),
//                                         ),
//                                         SizedBox(
//                                           width: 20.0,
//                                         )
//                                       ],
//                                     ),
//                                     const SizedBox(
//                                       height: 10.0,
//                                     ),
//                                     Container(
//                                       padding: EdgeInsets.symmetric(
//                                           horizontal: 20.0),
//                                       alignment: Alignment.centerLeft,
//                                       child: Text(
//                                         DateFormat("dd-MMM-yyyy")
//                                             .format(DateTime.timestamp()),
//                                         style: const TextStyle(
//                                             color: Color(0XFF000000),
//                                             fontSize: 14,
//                                             fontFamily: kfontPoppinsMedium),
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       height: 5.0,
//                                     ),
//                                     const Doteline(),
//                                     const SizedBox(
//                                       height: 15,
//                                     ),
//                                     Row(
//                                       children: const [
//                                         SizedBox(
//                                           width: 20.0,
//                                         ),
//                                         Text(
//                                           'Purchase Date',
//                                           style: TextStyle(
//                                               color: kbyoncolor6,
//                                               fontSize: 14,
//                                               fontFamily: kfontRubikMedium),
//                                         ),
//                                         Spacer(),
//                                         Text(
//                                           '',
//                                           style: TextStyle(
//                                               fontSize: 25,
//                                               color: kbyoncolor6,
//                                               fontFamily: kfontRobotoBold),
//                                         ),
//                                         SizedBox(
//                                           width: 20.0,
//                                         )
//                                       ],
//                                     ),
//                                     const SizedBox(
//                                       height: 10.0,
//                                     ),
//                                     Container(
//                                       padding: EdgeInsets.symmetric(
//                                           horizontal: 20.0),
//                                       alignment: Alignment.centerLeft,
//                                       child: Text(
//                                         DateFormat("dd-MMM-yyyy")
//                                             .format(DateTime.now()),
//                                         style: const TextStyle(
//                                             color: Color(0XFF000000),
//                                             fontSize: 14,
//                                             fontFamily: kfontPoppinsMedium),
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       height: 5.0,
//                                     ),
//                                     const Doteline(),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 15,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: const [
//                               Text(
//                                 'Nixon Power technology  Pvt Ltd, Manjeri',
//                                 style: TextStyle(
//                                     color: Color(0XFF000000),
//                                     fontSize: 14,
//                                     fontFamily: kfontPoppinsMedium),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(
//                             height: 15,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               MaterialButton(
//                                 onPressed: () async {
//                                   setState(() {
//                                     isloading = true;
//                                   });
//                                   await Future.delayed(
//                                       const Duration(seconds: 1));
//                                   qrcode = null;
//                                   setState(() {
//                                     isloading = false;
//                                   });
//                                   showDialog(
//                                     context: context,
//                                     builder: (BuildContext context) {
//                                       return AlertDialog(
//                                         title: Center(
//                                             child: Text(
//                                           "Warranty Started",
//                                           style: TextStyle(
//                                               fontFamily: kfontRubikMedium),
//                                         )),
//                                         content: Text(
//                                           "Warranty has been initiated\n successfully.",
//                                           style: TextStyle(
//                                               fontFamily: kfontPoppinsLight),
//                                         ),
//                                         actions: [
//                                           Padding(
//                                             padding: const EdgeInsets.only(
//                                                 left: 10,
//                                                 right: 10,
//                                                 bottom: 20),
//                                             child: MaterialButton(
//                                               onPressed: () {
//                                                 Navigator.pop(context);
//                                               },
//                                               shape:
//                                                   const RoundedRectangleBorder(
//                                                       borderRadius:
//                                                           BorderRadius.all(
//                                                               Radius.circular(
//                                                                   22.0))),
//                                               color: kbyoncolor1,
//                                               height: 44,
//                                               minWidth: double.infinity,
//                                               child: const Text(
//                                                 'Okay',
//                                                 style: TextStyle(
//                                                     color: Color(0XFFFFFFFF),
//                                                     fontFamily: 'Avenir-Heavy'),
//                                               ),
//                                             ),
//                                           )
//                                         ],
//                                       );
//                                     },
//                                   );
//                                 },
//                                 shape: const RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.all(
//                                         Radius.circular(30.0))),
//                                 minWidth: 235,
//                                 height: 44,
//                                 color: kbyoncolor3,
//                                 child: isloading == true
//                                     ? Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: const [
//                                           SizedBox(
//                                               height: 20.0,
//                                               width: 20.0,
//                                               child: CircularProgressIndicator(
//                                                 valueColor:
//                                                     AlwaysStoppedAnimation<
//                                                         Color>(Colors.white),
//                                                 strokeWidth: 3.0,
//                                               )),
//                                         ],
//                                       )
//                                     : const Text(
//                                         'Start Warranty',
//                                         style: TextStyle(
//                                             color: Color(0XFFFFFFFF),
//                                             fontSize: 17,
//                                             fontFamily: 'Avenir-Heavy'),
//                                       ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(
//                             height: 10.0,
//                           )
//                         ],
//                       );
//                     }),
//               ),
//       ],
//     );
//   }
// }
