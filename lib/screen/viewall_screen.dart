// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// import 'package:byon_care/constents.dart';
// import 'package:byon_care/models/product_model_class.dart';
// import 'package:byon_care/production/productiontab.dart';
// import 'package:byon_care/production/productiontabs.dart';
// import 'package:byon_care/servicess/firestore_services.dart';
// import 'package:flutter/material.dart';

// class ViewAll extends StatefulWidget {
//   const ViewAll({Key? key}) : super(key: key);

//   @override
//   State<ViewAll> createState() => _ViewAllState();
// }

// class _ViewAllState extends State<ViewAll> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: Text(
//           'All Products',
//           style: TextStyle(
//               fontSize: 22,
//               fontFamily: kfontPoppinsMedium,
//               color: Colors.black),
//         ),
//         centerTitle: true,
//       ),
//       body: StreamBuilder(
//         stream: FirestoreServices().getViewAll(),
//         builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Container(
//               alignment: Alignment.center,
//               child: CircularProgressIndicator(
//                 color: kbyoncolor3,
//               ),
//             );
//           } else if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           } else {
//             List<ProductModel> allItems =
//                 List<ProductModel>.from(snapshot.data ?? []);

//             if (allItems.isEmpty) {
//               return Center(
//                 child: Text('No items available.'),
//               );
//             }

//             return ListView.builder(
//               shrinkWrap: true,
//               physics: ScrollPhysics(),
//               scrollDirection: Axis.vertical,
//               itemBuilder: (BuildContext context, int index) {
//                 if (index < allItems.length) {
//                   ProductModel item = allItems[index];

//                   if (item.qrId == null) {
//                     return Center(
//                       child: Text('Data is not available for this item.'),
//                     );
//                   }

//                   return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Stack(
//                       children: [
//                         InkWell(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) =>
//                                     AddProductionDetails(productDetails: item),
//                               ),
//                             );
//                           },
//                           child: Container(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 10, vertical: 15),
//                             width: double.infinity,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(5),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.grey.withOpacity(0.2),
//                                   spreadRadius: 2,
//                                   blurRadius: 2,
//                                   offset: Offset(1, 1),
//                                 ),
//                               ],
//                             ),
//                             child: Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 10),
//                               child: Row(
//                                 children: [
//                                   Container(
//                                     height: 60,
//                                     width: 60,
//                                     decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       color: kbyoncolor3,
//                                     ),
//                                     child: Center(
//                                       child: Text(
//                                         (item.qrId != null &&
//                                                 item.qrId!.isNotEmpty)
//                                             ? (item.qrId![0]).toUpperCase()
//                                             : '',
//                                         style: TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 22,
//                                           fontFamily: kfontPoppinsMedium,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: 15,
//                                   ),
//                                   Expanded(
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           item.qrId ?? '',
//                                           style: TextStyle(
//                                             fontFamily: kfontPoppinsMedium,
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           height: 10,
//                                         ),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 Row(
//                                                   children: [
//                                                     Icon(
//                                                       Icons
//                                                           .branding_watermark_outlined,
//                                                       color: Colors.grey,
//                                                       size: 14,
//                                                     ),
//                                                     Text(
//                                                       ' Brand',
//                                                       style: TextStyle(
//                                                         fontFamily:
//                                                             kfontPoppinsLight,
//                                                         color: Colors.grey,
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                                 Text(
//                                                   item.brandName ?? '',
//                                                   style: TextStyle(
//                                                     fontSize: 13,
//                                                     fontFamily:
//                                                         kfontPoppinsMedium,
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             Padding(
//                                               padding: const EdgeInsets.only(
//                                                   right: 20),
//                                               child: Column(
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                 children: [
//                                                   Row(
//                                                     children: [
//                                                       Icon(
//                                                         Icons.poll_rounded,
//                                                         color: Colors.grey,
//                                                         size: 14,
//                                                       ),
//                                                       Text(
//                                                         ' Product',
//                                                         style: TextStyle(
//                                                           fontFamily:
//                                                               kfontPoppinsLight,
//                                                           color: Colors.grey,
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                   Text(
//                                                     item.productType ?? '',
//                                                     style: TextStyle(
//                                                       fontFamily:
//                                                           kfontPoppinsMedium,
//                                                     ),
//                                                   )
//                                                 ],
//                                               ),
//                                             )
//                                           ],
//                                         )
//                                       ],
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 } else {
//                   // Handle index out of bounds gracefully
//                   return SizedBox();
//                 }
//               },
//               itemCount: allItems.length,
//             );
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         backgroundColor: kbyoncolor3,
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => Productiontab(),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
