// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, empty_catches
// import 'package:byon_care/constents.dart';
// import 'package:byon_care/models/product_model_class.dart';
// import 'package:byon_care/services/showmassege.dart';
// import 'package:byon_care/servicess/firestore_services.dart';
// import 'package:byon_care/widgets/bloodtestresults.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// import 'package:intl/intl.dart';

// class Productiontab extends StatefulWidget {
//   const Productiontab({
//     Key? key,
//     this.productDetails,
//   }) : super(key: key);
//   final ProductModel? productDetails;

//   @override
//   State<Productiontab> createState() => _BloodsugartapState();
// }

// class _BloodsugartapState extends State<Productiontab> {
//   PageController pageController = PageController();
//   String? brandname;
//   String? producttype;
//   String? modelname;
//   String? colours;
//   int? warranty;
//   String? qrcode;
//   String? docId;
//   Timestamp? productionDate;
//   bool isloading = false;
//   @override
//   void initState() {
//     brandname = widget.productDetails?.brandName ?? 'Nixown';
//     producttype = widget.productDetails?.productType ?? 'Inverter';
//     modelname = widget.productDetails?.modalName ?? '1000 VA';
//     colours = widget.productDetails?.colours ?? 'Red';
//     warranty = widget.productDetails?.warranty ?? 12;
//     qrcode = widget.productDetails?.qrId ?? '';
//     docId = widget.productDetails?.docId;
//     productionDate = widget.productDetails?.productionDate;
//     super.initState();
//   }

//   int pagenumber = 0;

//   String? qrValue;

//   @override
//   void dispose() {
//     pageController.dispose();
//     super.dispose();
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
//           widget.productDetails == null ? 'Add Product' : 'Product Details',
//           style: TextStyle(
//               color: kbyoncolor6, fontSize: 25.0, fontFamily: kfontRubikMedium),
//         ),
//         centerTitle: true,
//       ),
//       body: Column(children: [
//         const SizedBox(
//           height: 25.0,
//         ),
//         Expanded(
//           child: ListView(children: [
//             SizedBox(
//               height: 550,
//               child: Card(
//                 elevation: 2,
//                 color: Colors.white,
//                 shape: const RoundedRectangleBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(10.0))),
//                 child: Container(
//                   color: Colors.white,
//                   margin: const EdgeInsets.all(5),
//                   height: 320.0,
//                   child: SingleChildScrollView(
//                     scrollDirection: Axis.vertical,
//                     physics: NeverScrollableScrollPhysics(),
//                     child: Column(
//                       children: [
//                         Row(
//                           children: const [
//                             SizedBox(
//                               width: 20.0,
//                             ),
//                             Text(
//                               'Product Name',
//                               style: TextStyle(
//                                   color: kbyoncolor6,
//                                   fontSize: 14,
//                                   fontFamily: kfontRubikMedium),
//                             ),
//                             Spacer(),
//                             Text(
//                               '3',
//                               style: TextStyle(
//                                   fontSize: 25,
//                                   color: kbyoncolor6,
//                                   fontFamily: kfontRobotoBold),
//                             ),
//                             SizedBox(
//                               width: 20.0,
//                             )
//                           ],
//                         ),
//                         Container(
//                           padding: EdgeInsets.symmetric(horizontal: 20.0),
//                           child: DropdownButton<String>(
//                             isExpanded: true,
//                             value: brandname,
//                             items: const [
//                               DropdownMenuItem(
//                                 child: Text(
//                                   'Nixown',
//                                   style: TextStyle(
//                                       color: Color(0XFF000000),
//                                       fontSize: 14,
//                                       fontFamily: kfontPoppinsMedium),
//                                 ),
//                                 value: "Nixown",
//                               ),
//                               DropdownMenuItem(
//                                 child: Text(
//                                   'WinMax',
//                                   style: TextStyle(
//                                       color: Color(0XFF000000),
//                                       fontSize: 14,
//                                       fontFamily: kfontPoppinsMedium),
//                                 ),
//                                 value: "WinMax",
//                               ),
//                               DropdownMenuItem(
//                                 child: Text(
//                                   'Wintex',
//                                   style: TextStyle(
//                                       color: Color(0XFF000000),
//                                       fontSize: 14,
//                                       fontFamily: kfontPoppinsMedium),
//                                 ),
//                                 value: "Wintex",
//                               ),
//                             ],
//                             onChanged: (value) {
//                               brandname = value!;
//                               setState(() {});
//                             },
//                             underline: Container(),
//                           ),
//                         ),
//                         const Doteline(),
//                         const SizedBox(
//                           height: 10.0,
//                         ),
//                         Row(
//                           children: const [
//                             SizedBox(
//                               width: 20.0,
//                             ),
//                             Text(
//                               'Modal Name',
//                               style: TextStyle(
//                                   color: kbyoncolor6,
//                                   fontSize: 14,
//                                   fontFamily: kfontRubikMedium),
//                             ),
//                             Spacer(),
//                             Text(
//                               '2',
//                               style: TextStyle(
//                                   fontSize: 25,
//                                   color: kbyoncolor6,
//                                   fontFamily: kfontRobotoBold),
//                             ),
//                             SizedBox(
//                               width: 20.0,
//                             )
//                           ],
//                         ),
//                         Container(
//                           padding: EdgeInsets.symmetric(horizontal: 20.0),
//                           child: DropdownButton<String>(
//                             isExpanded: true,
//                             value: producttype,
//                             items: const [
//                               DropdownMenuItem(
//                                 child: Text(
//                                   'Inverter',
//                                   style: TextStyle(
//                                       color: Color(0XFF000000),
//                                       fontSize: 14,
//                                       fontFamily: kfontPoppinsMedium),
//                                 ),
//                                 value: "Inverter",
//                               ),
//                               DropdownMenuItem(
//                                 child: Text(
//                                   'Battery',
//                                   style: TextStyle(
//                                       color: Color(0XFF000000),
//                                       fontSize: 14,
//                                       fontFamily: kfontPoppinsMedium),
//                                 ),
//                                 value: "Battery",
//                               ),
//                             ],
//                             onChanged: (value) {
//                               producttype = value!;
//                               setState(() {});
//                             },
//                             underline: Container(),
//                           ),
//                         ),
//                         const Doteline(),
//                         const SizedBox(
//                           height: 15,
//                         ),
//                         Row(
//                           children: const [
//                             SizedBox(
//                               width: 20.0,
//                             ),
//                             Text(
//                               'Warranty',
//                               style: TextStyle(
//                                   color: kbyoncolor6,
//                                   fontSize: 14,
//                                   fontFamily: kfontRubikMedium),
//                             ),
//                             Spacer(),
//                             Text(
//                               '',
//                               style: TextStyle(
//                                   fontSize: 25,
//                                   color: kbyoncolor6,
//                                   fontFamily: kfontRobotoBold),
//                             ),
//                             SizedBox(
//                               width: 20.0,
//                             )
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 10.0,
//                         ),
//                         Container(
//                           padding: EdgeInsets.symmetric(horizontal: 20.0),
//                           alignment: Alignment.centerLeft,
//                           child: Text(
//                             ' 12 Months',
//                             style: const TextStyle(
//                                 color: Color(0XFF000000),
//                                 fontSize: 14,
//                                 fontFamily: kfontPoppinsMedium),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 5,
//                         ),
//                         const Doteline(),
//                         const SizedBox(
//                           height: 15,
//                         ),
//                         Row(
//                           children: const [
//                             SizedBox(
//                               width: 20.0,
//                             ),
//                             Text(
//                               'Production date',
//                               style: TextStyle(
//                                   color: kbyoncolor6,
//                                   fontSize: 14,
//                                   fontFamily: kfontRubikMedium),
//                             ),
//                             Spacer(),
//                             Text(
//                               '',
//                               style: TextStyle(
//                                   fontSize: 25,
//                                   color: kbyoncolor6,
//                                   fontFamily: kfontRobotoBold),
//                             ),
//                             SizedBox(
//                               width: 20.0,
//                             )
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 10.0,
//                         ),
//                         Container(
//                           padding: EdgeInsets.symmetric(horizontal: 20.0),
//                           alignment: Alignment.centerLeft,
//                           child: Text(
//                             DateFormat("dd-MMM-yyyy").format(DateTime.now()),
//                             style: const TextStyle(
//                                 color: Color(0XFF000000),
//                                 fontSize: 14,
//                                 fontFamily: kfontPoppinsMedium),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 5.0,
//                         ),
//                         const Doteline(),
//                         SizedBox(
//                           height: 15,
//                         ),
//                         Row(
//                           children: [
//                             SizedBox(
//                               width: 20.0,
//                             ),
//                             Text(
//                               'QrId',
//                               style: TextStyle(
//                                   color: kbyoncolor6,
//                                   fontSize: 14,
//                                   fontFamily: kfontPoppinsMedium),
//                             ),
//                             Spacer(),
//                             Padding(
//                               padding: const EdgeInsets.only(right: 20),
//                               child: InkWell(
//                                 onTap: () async {
//                                   if (qrcode == null) {
//                                     qrcode =
//                                         await FlutterBarcodeScanner.scanBarcode(
//                                             '#ff6666',
//                                             'Cancel',
//                                             false,
//                                             ScanMode.DEFAULT);
//                                     //   log(qrcode.toString());
//                                     if (qrcode == "-1") {
//                                       qrcode = "";
//                                     }
//                                   } else {
//                                     setState(() {
//                                       isloading = true;
//                                     });
//                                     await Future.delayed(
//                                         const Duration(seconds: 1));
//                                     qrcode = null;
//                                     setState(() {
//                                       isloading = false;
//                                     });
//                                   }
//                                   setState(() {});
//                                 },
//                                 child: Image.asset(
//                                   'images/qrcodescan.png',
//                                   height: 20,
//                                   width: 20,
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                         SizedBox(
//                           height: 15,
//                         ),
//                         Row(
//                           children: [
//                             SizedBox(
//                               width: 20,
//                             ),
//                             Text(
//                               qrcode ?? '',
//                               style: TextStyle(
//                                   color: Color(0XFF000000),
//                                   fontSize: 14,
//                                   fontFamily: kfontPoppinsMedium),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 5,
//                         ),
//                         Doteline(),
//                         SizedBox(
//                           height: 10,
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 15,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: const [
//                 Text(
//                   'Nixon Power technology  Pvt Ltd, Manjeri',
//                   style: TextStyle(
//                       color: Color(0XFF000000),
//                       fontSize: 14,
//                       fontFamily: kfontPoppinsMedium),
//                 ),
//               ],
//             ),

//              Row(
//                   children: [
//                     Expanded(
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 0, vertical: 20),
//                         child: Row(
//                           children: [
//                             Expanded(
//                               child: MaterialButton(
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(10))),
//                                 color: Colors.blueGrey.shade400,
//                                 onPressed: () {
//                                   Navigator.pop(context, false);
//                                 },
//                                 child: const Text(
//                                   'Cancel',
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 60,
//                     ),
//                     Expanded(
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 0, vertical: 20),
//                         child: Row(
//                           children: [
//                             Expanded(
//                               child: MaterialButton(
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(10))),
//                                 color: Colors.red,
//                                 onPressed: () async {
//                                   if (_formKey.currentState?.validate() ==
//                                       true) {
//                                     FirestoreServices().AddOrEditservice(
//                                         complaintdata: widget.complaintData);
//                                     Navigator.pop(context, true);
//                                   } else {
//                                     showsnackbar(
//                                         'Mnadatory field must not be empty!',
//                                         context);
//                                   }
//                                 },
//                                 child: Text(
//                                   widget.complaintData.id != null
//                                       ? 'Edit'
//                                       : 'Add',
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 )
//             // const SizedBox(
//             //   height: 15,
//             // ),
//             // widget.productDetails == null
//             //     ? Row(
//             //         mainAxisAlignment: MainAxisAlignment.center,
//             //         children: [
//             //           MaterialButton(
//             //             onPressed: () async {
//             //               await submitDetails();
//             //             },
//             //             shape: const RoundedRectangleBorder(
//             //                 borderRadius:
//             //                     BorderRadius.all(Radius.circular(30.0))),
//             //             minWidth: 235,
//             //             height: 44,
//             //             color: kbyoncolor3,
//             //             child: isloading == true
//             //                 ? Column(
//             //                     mainAxisAlignment: MainAxisAlignment.center,
//             //                     children: const [
//             //                       SizedBox(
//             //                           height: 20.0,
//             //                           width: 20.0,
//             //                           child: CircularProgressIndicator(
//             //                             valueColor:
//             //                                 AlwaysStoppedAnimation<Color>(
//             //                                     Colors.white),
//             //                             strokeWidth: 3.0,
//             //                           )),
//             //                     ],
//             //                   )
//             //                 : Text(
//             //                     qrcode == null ? "Scan " : 'Submit details',
//             //                     style: const TextStyle(
//             //                         color: Color(0XFFFFFFFF),
//             //                         fontSize: 17,
//             //                         fontFamily: 'Avenir-Heavy'),
//             //                   ),
//             //           ),
//             //         ],
//             //       )
//             //     : SizedBox(
//             //         height: 44,
//             //         child: Padding(
//             //           padding: const EdgeInsets.only(left: 60, right: 60),
//             //           child: ElevatedButton(
//             //             style: ElevatedButton.styleFrom(
//             //               shape: const RoundedRectangleBorder(
//             //                 borderRadius:
//             //                     BorderRadius.all(Radius.circular(30.0)),
//             //               ),
//             //               backgroundColor: kbyoncolor3,
//             //             ),
//             //             onPressed: () async {
//             //               ProductModel productModel = ProductModel(
//             //                 brandName: brandname,
//             //                 colours: colours,
//             //                 modalName: modelname,
//             //                 productType: producttype,
//             //                 warranty: warranty,
//             //                 qrId: qrcode,
//             //                 docId: docId,
//             //               );

//             //               try {
//             //                 setState(() {
//             //                   isloading =
//             //                       true; // Set loading state to true when button is clicked
//             //                 });

//             //                 await FirestoreServices()
//             //                     .editProductDetails(productModel: productModel);
//             //                 Navigator.pop(context);
//             //               } catch (e) {
//             //                 // Handle error
//             //               } finally {
//             //                 setState(() {
//             //                   isloading = false;
//             //                 });
//             //               }
//             //             },
//             //             child: isloading
//             //                 ? SizedBox(
//             //                     height: 20,
//             //                     width: 20,
//             //                     child: CircularProgressIndicator(
//             //                       color: Colors.white,
//             //                     )) // Show circular progress indicator if loading
//             //                 : Text(
//             //                     'Edit',
//             //                     style: const TextStyle(
//             //                       color: Color(0XFFFFFFFF),
//             //                       fontSize: 17,
//             //                       fontFamily: 'Avenir-Heavy',
//             //                     ),
//             //                   ),
//             //           ),
//             //),
//             // )
//           ]),
//         ),
//       ]),
//     );
//   }

//   Future<void> submitDetails() async {
//     if (qrcode == null) {
//       qrcode = await FlutterBarcodeScanner.scanBarcode(
//           '#ff6666', 'Cancel', false, ScanMode.DEFAULT);
//     } else {
//       if (qrcode == '') {
//         showmassege('All fields are required');
//         return;
//       }

//       setState(() {
//         isloading = true;
//       });

//       await Future.delayed(const Duration(seconds: 1));
//       bool qrCodeExists = await FirestoreServices().checkQrCodeExist(qrcode!);

//       if (qrCodeExists) {
//         //log("QR code already exists!");

//         setState(() {
//           isloading = false;
//         });
//         if (qrcode == null) {
//           showmassege('message');
//         }
//       } else {
//         ProductModel productModel = ProductModel(
//           brandName: brandname,
//           productType: producttype,
//           modalName: modelname,
//           colours: colours,
//           warranty: warranty,
//           productionDate: Timestamp.now(),
//           qrId: qrcode,
//         );

//         await FirestoreServices()
//             .uploadProductDetails(productModel: productModel);

//         qrcode = null;
//         setState(() {
//           isloading = false;
//         });

//         showmassege('submitted successfully');
//       }
//     }
//     setState(() {});
//   }
// }
