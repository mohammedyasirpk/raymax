// // ignore_for_file: prefer_const_constructors
// import 'package:byon_care/constents.dart';
// import 'package:byon_care/servicess/firestore_services.dart';
// import 'package:byon_care/widgets/bloodtestresults.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class Servicetap extends StatefulWidget {
//   const Servicetap({Key? key, required this.qrcode}) : super(key: key);
//   final String qrcode;

//   @override
//   State<Servicetap> createState() => _ServicetapState();
// }

// class _ServicetapState extends State<Servicetap> {
//   PageController pageController = PageController();

//   @override
//   void dispose() {
//     pageController.dispose();
//     super.dispose();
//   }

//   int calculateWarranty(Timestamp currentDate, Timestamp purchaseDate) {
//     DateTime currentDateTime = currentDate.toDate();
//     DateTime purchaseDateTime = purchaseDate.toDate();
//     Duration monthsDifference = (currentDateTime).difference(purchaseDateTime);
//     return (monthsDifference.inDays / 30).round();
//   }

//   String calculateWarrantyStatus(
//       Timestamp currentDate, Timestamp purchaseDate) {
//     int remainingMonths = calculateWarranty(currentDate, purchaseDate);

//     if (remainingMonths > 0) {
//       return "$remainingMonths Months left";
//     } else {
//       return "Expired";
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: IconThemeData(
//           color: Colors.black,
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: Text(
//           'Product Details',
//           style: TextStyle(
//               color: kbyoncolor6, fontSize: 25.0, fontFamily: kfontRubikMedium),
//         ),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           const SizedBox(
//             height: 25.0,
//           ),
//           Expanded(
//             child: FutureBuilder(
//                 future:
//                     FirestoreServices().getUploadItem(widget.qrcode, context),
//                 builder:
//                     (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return Center(
//                       child: CircularProgressIndicator(
//                         color: kbyoncolor3,
//                       ),
//                     );
//                   }

//                   if (!snapshot.hasData || snapshot.data.docs.isEmpty) {
//                     return Center(
//                       child: Text(
//                         'No data found for the provided QR code.',
//                         style: TextStyle(
//                           color: kbyoncolor6,
//                           fontSize: 14.0,
//                           fontFamily: kfontPoppinsMedium,
//                         ),
//                       ),
//                     );
//                   }
//                   var document = snapshot.data.docs;

//                   String warrantyStatus = calculateWarrantyStatus(
//                       Timestamp.now(), document[0]['purchaseDate']);
//                   return ListView(
//                     children: [
//                       SizedBox(
//                         height: 720,
//                         child: Card(
//                           elevation: 2,
//                           color: Colors.white,
//                           shape: const RoundedRectangleBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(10.0))),
//                           child: Container(
//                             color: Colors.white,
//                             margin: const EdgeInsets.all(5),
//                             height: 320.0,
//                             child: Column(
//                               children: [
//                                 Row(
//                                   children: const [
//                                     SizedBox(
//                                       width: 20.0,
//                                     ),
//                                     Text(
//                                       'Brand Name',
//                                       style: TextStyle(
//                                           color: kbyoncolor6,
//                                           fontSize: 14,
//                                           fontFamily: kfontRubikMedium),
//                                     ),
//                                     Spacer(),
//                                     Text(
//                                       '',
//                                       style: TextStyle(
//                                           fontSize: 25,
//                                           color: kbyoncolor6,
//                                           fontFamily: kfontRobotoBold),
//                                     ),
//                                     SizedBox(
//                                       width: 20.0,
//                                     )
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 Container(
//                                   padding:
//                                       EdgeInsets.symmetric(horizontal: 20.0),
//                                   child: Align(
//                                     alignment: Alignment.bottomLeft,
//                                     child: Text(
//                                       document[0]['brandName'],
//                                       style: TextStyle(
//                                           color: Color(0XFF000000),
//                                           fontSize: 14,
//                                           fontFamily: kfontPoppinsMedium),
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 15.0,
//                                 ),
//                                 const Doteline(),
//                                 const SizedBox(
//                                   height: 15,
//                                 ),
//                                 Row(
//                                   children: const [
//                                     SizedBox(
//                                       width: 20.0,
//                                     ),
//                                     Text(
//                                       'Product type',
//                                       style: TextStyle(
//                                           color: kbyoncolor6,
//                                           fontSize: 14,
//                                           fontFamily: kfontRubikMedium),
//                                     ),
//                                     Spacer(),
//                                     Text(
//                                       '',
//                                       style: TextStyle(
//                                           fontSize: 25,
//                                           color: kbyoncolor6,
//                                           fontFamily: kfontRobotoBold),
//                                     ),
//                                     SizedBox(
//                                       width: 20.0,
//                                     )
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 Container(
//                                   padding:
//                                       EdgeInsets.symmetric(horizontal: 20.0),
//                                   child: Align(
//                                     alignment: Alignment.bottomLeft,
//                                     child: Text(
//                                       document[0]['productType'],
//                                       style: TextStyle(
//                                           color: Color(0XFF000000),
//                                           fontSize: 14,
//                                           fontFamily: kfontPoppinsMedium),
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 15.0,
//                                 ),
//                                 const Doteline(),
//                                 const SizedBox(
//                                   height: 15,
//                                 ),
//                                 Row(
//                                   children: const [
//                                     SizedBox(
//                                       width: 20.0,
//                                     ),
//                                     Text(
//                                       'Modal Name',
//                                       style: TextStyle(
//                                           color: kbyoncolor6,
//                                           fontSize: 14,
//                                           fontFamily: kfontRubikMedium),
//                                     ),
//                                     Spacer(),
//                                     Text(
//                                       '',
//                                       style: TextStyle(
//                                           fontSize: 25,
//                                           color: kbyoncolor6,
//                                           fontFamily: kfontRobotoBold),
//                                     ),
//                                     SizedBox(
//                                       width: 20.0,
//                                     )
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 Container(
//                                   padding:
//                                       EdgeInsets.symmetric(horizontal: 20.0),
//                                   child: Align(
//                                     alignment: Alignment.bottomLeft,
//                                     child: Text(
//                                       document[0]['modalName'],
//                                       style: TextStyle(
//                                           color: Color(0XFF000000),
//                                           fontSize: 14,
//                                           fontFamily: kfontPoppinsMedium),
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 15.0,
//                                 ),
//                                 const Doteline(),
//                                 const SizedBox(
//                                   height: 15,
//                                 ),
//                                 Row(
//                                   children: const [
//                                     SizedBox(
//                                       width: 20.0,
//                                     ),
//                                     Text(
//                                       'Colours',
//                                       style: TextStyle(
//                                           color: kbyoncolor6,
//                                           fontSize: 14,
//                                           fontFamily: kfontRubikMedium),
//                                     ),
//                                     Spacer(),
//                                     Text(
//                                       '',
//                                       style: TextStyle(
//                                           fontSize: 25,
//                                           color: kbyoncolor6,
//                                           fontFamily: kfontRobotoBold),
//                                     ),
//                                     SizedBox(
//                                       width: 20.0,
//                                     )
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 Container(
//                                   padding:
//                                       EdgeInsets.symmetric(horizontal: 20.0),
//                                   child: Align(
//                                     alignment: Alignment.bottomLeft,
//                                     child: Text(
//                                       document[0]['colours'],
//                                       style: TextStyle(
//                                           color: Color(0XFF000000),
//                                           fontSize: 14,
//                                           fontFamily: kfontPoppinsMedium),
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 15.0,
//                                 ),
//                                 const Doteline(),
//                                 const SizedBox(
//                                   height: 15,
//                                 ),
//                                 Row(
//                                   children: const [
//                                     SizedBox(
//                                       width: 20.0,
//                                     ),
//                                     Text(
//                                       'Warranty',
//                                       style: TextStyle(
//                                           color: kbyoncolor6,
//                                           fontSize: 14,
//                                           fontFamily: kfontRubikMedium),
//                                     ),
//                                     Spacer(),
//                                     Text(
//                                       '',
//                                       style: TextStyle(
//                                           fontSize: 25,
//                                           color: kbyoncolor6,
//                                           fontFamily: kfontRobotoBold),
//                                     ),
//                                     SizedBox(
//                                       width: 20.0,
//                                     )
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 Container(
//                                   padding:
//                                       EdgeInsets.symmetric(horizontal: 20.0),
//                                   child: Align(
//                                     alignment: Alignment.bottomLeft,
//                                     child: Text(
//                                       document[0]['warranty'],
//                                       style: TextStyle(
//                                           color: Color(0XFF000000),
//                                           fontSize: 14,
//                                           fontFamily: kfontPoppinsMedium),
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 15.0,
//                                 ),
//                                 const Doteline(),
//                                 const SizedBox(
//                                   height: 15,
//                                 ),
//                                 Row(
//                                   children: const [
//                                     SizedBox(
//                                       width: 20.0,
//                                     ),
//                                     Text(
//                                       'Production Date',
//                                       style: TextStyle(
//                                           color: kbyoncolor6,
//                                           fontSize: 14,
//                                           fontFamily: kfontRubikMedium),
//                                     ),
//                                     Spacer(),
//                                     Text(
//                                       '',
//                                       style: TextStyle(
//                                           fontSize: 25,
//                                           color: kbyoncolor6,
//                                           fontFamily: kfontRobotoBold),
//                                     ),
//                                     SizedBox(
//                                       width: 20.0,
//                                     )
//                                   ],
//                                 ),
//                                 const SizedBox(
//                                   height: 10.0,
//                                 ),
//                                 Container(
//                                   padding:
//                                       EdgeInsets.symmetric(horizontal: 20.0),
//                                   alignment: Alignment.centerLeft,
//                                   child: Text(
//                                     DateFormat('dd-MM-yyy').format(
//                                       document[0]['productionDate'].toDate(),
//                                     ),
//                                     style: const TextStyle(
//                                         color: Color(0XFF000000),
//                                         fontSize: 14,
//                                         fontFamily: kfontPoppinsMedium),
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 15.0,
//                                 ),
//                                 const Doteline(),
//                                 const SizedBox(
//                                   height: 15,
//                                 ),
//                                 Row(
//                                   children: const [
//                                     SizedBox(
//                                       width: 20.0,
//                                     ),
//                                     Text(
//                                       'Purchase Date',
//                                       style: TextStyle(
//                                           color: kbyoncolor6,
//                                           fontSize: 14,
//                                           fontFamily: kfontRubikMedium),
//                                     ),
//                                     Spacer(),
//                                     Text(
//                                       '',
//                                       style: TextStyle(
//                                           fontSize: 25,
//                                           color: kbyoncolor6,
//                                           fontFamily: kfontRobotoBold),
//                                     ),
//                                     SizedBox(
//                                       width: 20.0,
//                                     )
//                                   ],
//                                 ),
//                                 const SizedBox(
//                                   height: 10.0,
//                                 ),
//                                 Container(
//                                   padding:
//                                       EdgeInsets.symmetric(horizontal: 20.0),
//                                   alignment: Alignment.centerLeft,
//                                   child: Text(
//                                     DateFormat('dd-MM-yyy').format(
//                                       document[0]['purchaseDate'].toDate(),
//                                     ),
//                                     style: const TextStyle(
//                                         color: Color(0XFF000000),
//                                         fontSize: 14,
//                                         fontFamily: kfontPoppinsMedium),
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 15.0,
//                                 ),
//                                 const Doteline(),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 Row(
//                                   children: const [
//                                     SizedBox(
//                                       width: 20.0,
//                                     ),
//                                     Text(
//                                       'Warranty Status',
//                                       style: TextStyle(
//                                           color: kbyoncolor6,
//                                           fontSize: 14,
//                                           fontFamily: kfontRubikMedium),
//                                     ),
//                                     Spacer(),
//                                     Text(
//                                       '',
//                                       style: TextStyle(
//                                           fontSize: 25,
//                                           color: kbyoncolor6,
//                                           fontFamily: kfontRobotoBold),
//                                     ),
//                                     SizedBox(
//                                       width: 20.0,
//                                     )
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 Container(
//                                   padding:
//                                       EdgeInsets.symmetric(horizontal: 20.0),
//                                   child: Align(
//                                     alignment: Alignment.bottomLeft,
//                                     child: Text(
//                                       warrantyStatus,
//                                       style: TextStyle(
//                                           color: Color(0XFF000000),
//                                           fontSize: 14,
//                                           fontFamily: kfontPoppinsMedium),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 15,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: const [
//                           Text(
//                             'Nixon Power technology  Pvt Ltd, Manjeri',
//                             style: TextStyle(
//                                 color: Color(0XFF000000),
//                                 fontSize: 14,
//                                 fontFamily: kfontPoppinsMedium),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 15,
//                       ),
//                       const SizedBox(
//                         height: 10.0,
//                       )
//                     ],
//                   );
//                 }),
//           ),
//         ],
//       ),
//     );
//   }
// }
