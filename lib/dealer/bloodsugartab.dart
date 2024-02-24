// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable
// import 'package:byon_care/constents.dart';
// import 'package:byon_care/dealer/data/dealer_repo.dart';
// import 'package:byon_care/models/product_model_class.dart';
// import 'package:byon_care/services/showmassege.dart';
// import 'package:byon_care/servicess/firestore_services.dart';
// import 'package:byon_care/widgets/bloodtestresults.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// import 'package:intl/intl.dart';

// class Bloodsugartap extends StatefulWidget {
//   const Bloodsugartap({
//     Key? key,
//     this.productDetails,
//     required this.alreadyChecked,
//   }) : super(key: key);
//   final ProductModel? productDetails;

//   final bool alreadyChecked;

//   @override
//   State<Bloodsugartap> createState() => _BloodsugartapState();
// }

// final emailcontroller = TextEditingController();
// final customerController = TextEditingController();

// class _BloodsugartapState extends State<Bloodsugartap> {
//   PageController pageController = PageController();

//   String? productName;
//   String? modelname;
//   int?additionalwarranty;
//  // String? colours;
//   int? warranty;
//   String? qrcode;
//   String? docId;
//   Timestamp? productionDate;
//   bool isloading = false;
//   @override
//   void initState() {

//     productName = widget.productDetails?.productName ?? 'Inverter';
//     modelname = widget.productDetails?.modalName ?? '1000 VA';
//     //colours = widget.productDetails?. ?? 'Red';
//     additionalwarranty=widget.productDetails?.additionalWarranty?? 12;
//     warranty = widget.productDetails?.warranty ?? 12;
//     qrcode = widget.productDetails?.qrId ?? '';
//     docId = widget.productDetails?.docId;
//     productionDate = widget.productDetails?.productionDate;
//     super.initState();
//     customerController.text = widget.productDetails?.customername ?? "";
//     emailcontroller.text = widget.productDetails?.email ?? "";
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
//           "Product Details",
//           style: TextStyle(
//               color: kbyoncolor6, fontSize: 25.0, fontFamily: kfontRubikMedium),
//         ),
//         centerTitle: true,
//       ),
//       body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
//         const SizedBox(
//           height: 25.0,
//         ),
//         Expanded(
//           child: ListView(children: [
//             SizedBox(
//               height: 760,
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
//                     child: Padding(
//                       padding: const EdgeInsets.only(bottom: 20),
//                       child: Column(
//                         children: [
//                           Row(
//                             children: [
//                               SizedBox(
//                                 width: 20.0,
//                               ),
//                               Text(
//                                 "Product Name",
//                                 style: TextStyle(
//                                     color: kbyoncolor6,
//                                     fontSize: 14,
//                                     fontFamily: kfontRubikMedium),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 15,
//                           ),
//                           Container(
//                             alignment: Alignment.bottomLeft,
//                             padding: EdgeInsets.symmetric(horizontal: 20.0),
//                             child: Text(
//                               widget.productDetails!.productName!,
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontFamily: kfontPoppinsMedium,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 15.0,
//                           ),
//                           const Doteline(),
//                           const SizedBox(
//                             height: 15,
//                           ),
//                           Row(
//                             children: const [
//                               SizedBox(
//                                 width: 20.0,
//                               ),
//                               Text(
//                                 'Product type',
//                                 style: TextStyle(
//                                     color: kbyoncolor6,
//                                     fontSize: 14,
//                                     fontFamily: kfontRubikMedium),
//                               ),
//                               Spacer(),
//                               SizedBox(
//                                 width: 20.0,
//                               )
//                             ],
//                           ),
//                           SizedBox(
//                             height: 15,
//                           ),
//                           Container(
//                             alignment: Alignment.bottomLeft,
//                             padding: EdgeInsets.symmetric(horizontal: 20.0),
//                             child: Text(
//                               widget.productDetails!.productName!,
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontFamily: kfontPoppinsMedium,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 15.0,
//                           ),
//                           const Doteline(),
//                           const SizedBox(
//                             height: 15,
//                           ),
//                           Row(
//                             children: const [
//                               SizedBox(
//                                 width: 20.0,
//                               ),
//                               Text(
//                                 'Modal Name',
//                                 style: TextStyle(
//                                     color: kbyoncolor6,
//                                     fontSize: 17,
//                                     fontFamily: kfontRubikMedium),
//                               ),
//                               Spacer(),
//                               SizedBox(
//                                 width: 20.0,
//                               )
//                             ],
//                           ),
//                           SizedBox(
//                             height: 15,
//                           ),
//                           Container(
//                               alignment: Alignment.bottomLeft,
//                               padding: EdgeInsets.symmetric(horizontal: 20.0),
//                               child: Text(
//                                 widget.productDetails!.modalName!,
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   fontFamily: kfontPoppinsMedium,
//                                 ),
//                               )),
//                           const SizedBox(
//                             height: 15.0,
//                           ),
//                           const Doteline(),
//                           const SizedBox(
//                             height: 15,
//                           ),
//                           Row(
//                             children: const [
//                               SizedBox(
//                                 width: 20.0,
//                               ),
//                               Text(
//                                 'Colours',
//                                 style: TextStyle(
//                                     color: kbyoncolor6,
//                                     fontSize: 14,
//                                     fontFamily: kfontRubikMedium),
//                               ),
//                               SizedBox(
//                                 height: 20.0,
//                               )
//                             ],
//                           ),
//                           SizedBox(
//                             height: 15,
//                           ),
//                           // Container(
//                           //     alignment: Alignment.bottomLeft,
//                           //     padding: EdgeInsets.symmetric(horizontal: 20.0),
//                           //     child: Text(
//                           //       widget.productDetails!.colours ??
//                           //           "No color available",
//                           //       style: TextStyle(
//                           //         fontSize: 14,
//                           //         fontFamily: kfontPoppinsMedium,
//                           //       ),
//                           //     )),
//                           const SizedBox(
//                             height: 15.0,
//                           ),
//                           const Doteline(),
//                           const SizedBox(
//                             height: 15,
//                           ),
//                           Row(
//                             children: const [
//                               SizedBox(
//                                 width: 20.0,
//                               ),
//                               Text(
//                                 'Warranty',
//                                 style: TextStyle(
//                                     color: kbyoncolor6,
//                                     fontSize: 14,
//                                     fontFamily: kfontRubikMedium),
//                               ),
//                               Spacer(),
//                               SizedBox(
//                                 width: 20.0,
//                               )
//                             ],
//                           ),
//                           SizedBox(
//                             height: 15,
//                           ),
//                           Container(
//                               alignment: Alignment.bottomLeft,
//                               padding: EdgeInsets.symmetric(horizontal: 20.0),
//                               child: Text(
//                                 "${widget.productDetails!.warranty ??
//                                     "no warrenty available"}",
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   fontFamily: kfontPoppinsMedium,
//                                 ),
//                               )),
//                           const SizedBox(
//                             height: 15.0,
//                           ),
//                           const Doteline(),
//                           const SizedBox(
//                             height: 15,
//                           ),
//                           Row(
//                             children: const [
//                               SizedBox(
//                                 width: 20.0,
//                               ),
//                               Text(
//                                 'Production date',
//                                 style: TextStyle(
//                                     color: kbyoncolor6,
//                                     fontSize: 14,
//                                     fontFamily: kfontRubikMedium),
//                               ),
//                               Spacer(),
//                               SizedBox(
//                                 width: 20.0,
//                               )
//                             ],
//                           ),
//                           SizedBox(
//                             height: 15,
//                           ),
//                           Container(
//                             padding: EdgeInsets.symmetric(horizontal: 20.0),
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               DateFormat('yyyy-MM-dd').format(widget
//                                   .productDetails!.productionDate!
//                                   .toDate()),
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontFamily: kfontPoppinsMedium,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 15.0,
//                           ),
//                           const Doteline(),
//                           const SizedBox(
//                             height: 10.0,
//                           ),
//                           Row(
//                             children: const [
//                               SizedBox(
//                                 width: 20.0,
//                               ),
//                               Text(
//                                 "Qrid",
//                                 style: TextStyle(
//                                     color: kbyoncolor6,
//                                     fontSize: 14,
//                                     fontFamily: kfontRubikMedium),
//                               ),
//                               Spacer(),
//                               SizedBox(
//                                 width: 20.0,
//                               )
//                             ],
//                           ),
//                           SizedBox(
//                             height: 15,
//                           ),
//                           Container(
//                             padding: EdgeInsets.symmetric(horizontal: 20.0),
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               widget.productDetails!.qrId ?? "",
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontFamily: kfontPoppinsMedium,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 15.0,
//                           ),
//                           Doteline(),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Row(
//                             children: const [
//                               SizedBox(
//                                 width: 20.0,
//                               ),
//                               Text(
//                                 "Customer Name",
//                                 style: TextStyle(
//                                     color: kbyoncolor6,
//                                     fontSize: 14,
//                                     fontFamily: kfontRubikMedium),
//                               ),
//                             ],
//                           ),
//                           Container(
//                               padding: EdgeInsets.symmetric(horizontal: 20.0),
//                               alignment: Alignment.centerLeft,
//                               child: TextField(
//                                   maxLines: 1,
//                                   controller: customerController,
//                                   decoration: InputDecoration())),
//                           const SizedBox(
//                             height: 15.0,
//                           ),
//                           Row(
//                             children: const [
//                               SizedBox(
//                                 width: 20.0,
//                               ),
//                               Text(
//                                 "Email",
//                                 style: TextStyle(
//                                     color: kbyoncolor6,
//                                     fontSize: 14,
//                                     fontFamily: kfontRubikMedium),
//                               ),
//                               SizedBox(
//                                 width: 20.0,
//                               )
//                             ],
//                           ),
//                           Container(
//                               padding: EdgeInsets.symmetric(horizontal: 20.0),
//                               alignment: Alignment.centerLeft,
//                               child: TextField(
//                                 controller: emailcontroller,
//                               )),
//                           const SizedBox(
//                             height: 15.0,
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                         ],
//                       ),
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
//                   'Raymax Power technology  Pvt Ltd, Manjeri',
//                   style: TextStyle(
//                       color: Color(0XFF000000),
//                       fontSize: 14,
//                       fontFamily: kfontPoppinsMedium),
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 15,
//             ),
//             widget.productDetails == null
//                 ? Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       MaterialButton(
//                         onPressed: () async {
//                           await submitDetails();
//                         },
//                         shape: const RoundedRectangleBorder(
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(30.0))),
//                         minWidth: 235,
//                         height: 44,
//                         color: kbyoncolor3,
//                         child: isloading == true
//                             ? Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: const [
//                                   SizedBox(
//                                       height: 20.0,
//                                       width: 20.0,
//                                       child: CircularProgressIndicator(
//                                         valueColor:
//                                             AlwaysStoppedAnimation<Color>(
//                                                 Colors.white),
//                                         strokeWidth: 3.0,
//                                       )),
//                                 ],
//                               )
//                             : Text(
//                                 qrcode == null ? "Scan " : 'Submit details',
//                                 style: const TextStyle(
//                                     color: Color(0XFFFFFFFF),
//                                     fontSize: 17,
//                                     fontFamily: 'Avenir-Heavy'),
//                               ),
//                       ),
//                     ],
//                   )
//                 : SizedBox(
//                     height: 44,
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 60, right: 60),
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           shape: const RoundedRectangleBorder(
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(30.0)),
//                           ),
//                           backgroundColor: kbyoncolor3,
//                         ),
//                         onPressed: () {
//                           if (customerController.text.isNotEmpty &&
//                               emailcontroller.text.isNotEmpty) {
//                             final productModel = ProductModel(
//                               docId: docId,
//                               customername: customerController.text,
//                               email: emailcontroller.text,
//                             );

//                             setState(() {
//                               isloading = true;
//                             });

//                             DealerRep.instance
//                                 .startWarrenty(productModel: productModel)
//                                 .then((_) {
//                               setState(() {
//                                 isloading = false;
//                               });

//                               showmassege(widget.alreadyChecked
//                                   ? 'Warranty Started'
//                                   : 'Editted SuccessFully');

//                               Navigator.of(context).pop();
//                             }).catchError((error) {
//                               setState(() {
//                                 isloading = false;
//                               });

//                               showmassege('An error occurred: $error');
//                             });
//                           } else {
//                             showmassege('Please Fill customer name and email');
//                           }
//                         },
//                         child: isloading
//                             ? SizedBox(
//                                 width: 20,
//                                 height: 20,
//                                 child: CircularProgressIndicator(
//                                   valueColor: AlwaysStoppedAnimation<Color>(
//                                       Colors.white),
//                                 ),
//                               )
//                             : Text(
//                                 widget.alreadyChecked
//                                     ? 'Start Warranty'
//                                     : "Edit",
//                                 style: const TextStyle(
//                                   color: Color(0XFFFFFFFF),
//                                   fontSize: 17,
//                                   fontFamily: 'Avenir-Heavy',
//                                 ),
//                               ),
//                       ),
//                     ),
//                   )
//           ]),
//         ),
//       ]),
//     );
//   }

//   Future<void> submitDetails() async {
//     if (qrcode == 'null') {
//       qrcode = await FlutterBarcodeScanner.scanBarcode(
//           '#ff6666', 'Cancel', false, ScanMode.DEFAULT);

//       // log(qrcode.toString());
//     } else {
//       setState(() {
//         isloading = true;
//       });

//       await Future.delayed(const Duration(seconds: 1));
//       bool qrCodeExists = await FirestoreServices().checkQrCodeExist(qrcode!);

//       if (qrCodeExists) {
//         // log("QR code already exists!");

//         setState(() {
//           isloading = false;
//           return showmassege('The QR code already exists');
//         });
//       } else {
//         ProductModel productModel = ProductModel(
        
//           productName: productName,
//           modalName: modelname,
//           additionalWarranty: additionalwarranty,
//          // colours: colours,
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
//       }
//     }
//     setState(() {});
//   }
// }
