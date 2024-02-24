// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// import 'package:byon_care/constents.dart';
// import 'package:byon_care/dealer/bloodsugartab.dart';
// import 'package:byon_care/dealer/data/dealer_repo.dart';
// import 'package:byon_care/models/product_model_class.dart';
// import 'package:flutter/material.dart';

// class DealerViewAll extends StatefulWidget {
//   const DealerViewAll({Key? key}) : super(key: key);

//   @override
//   State<DealerViewAll> createState() => _DealerViewAllState();
// }

// class _DealerViewAllState extends State<DealerViewAll> {
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
//       body: FutureBuilder(
//         future: DealerRep.instance.getDealerViewAll(),
//         builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Container(
//               alignment: Alignment.center,
//               child: CircularProgressIndicator(
//                 color: kbyoncolor3,
//               ),
//             );
//           } else if (!snapshot.hasData) {
//             return Text('No data is found: ${snapshot.error}');
//           } else {
//             List<ProductModel> allItems = snapshot.data ?? [];
//             return ListView.builder(
//               shrinkWrap: true,
//               physics: ScrollPhysics(),
//               scrollDirection: Axis.vertical,
//               itemBuilder: (BuildContext context, int index) {
//                 ProductModel item = allItems[index];
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Stack(children: [
//                     InkWell(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) =>
//                                   Bloodsugartap(productDetails: item,alreadyChecked: false),
//                             ));
//                       },
//                       child: Container(
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 10, vertical: 15),
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(5),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.2),
//                               spreadRadius: 2,
//                               blurRadius: 2,
//                               offset: Offset(1, 1),
//                             ),
//                           ],
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 10),
//                           child: Row(
//                             children: [
//                               Container(
//                                 height: 60,
//                                 width: 60,
//                                 decoration: BoxDecoration(
//                                     shape: BoxShape.circle, color: kbyoncolor3),
//                                 child: Center(
//                                     child: Text(
//                                   (item.qrId?[0] ?? '').toUpperCase(),
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 22,
//                                       fontFamily: kfontPoppinsMedium),
//                                 )),
//                               ),
//                               SizedBox(
//                                 width: 15,
//                               ),
//                               Expanded(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       item.qrId ?? '',
//                                       style: TextStyle(
//                                           fontFamily: kfontPoppinsMedium),
//                                     ),
//                                     SizedBox(
//                                       height: 10,
//                                     ),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Row(
//                                               children: [
//                                                 Icon(
//                                                   Icons
//                                                       .branding_watermark_outlined,
//                                                   color: Colors.grey,
//                                                   size: 14,
//                                                 ),
//                                                 Text(
//                                                   ' Brand',
//                                                   style: TextStyle(
//                                                       fontFamily:
//                                                           kfontPoppinsLight,
//                                                       color: Colors.grey),
//                                                 ),
//                                               ],
//                                             ),
//                                             Text(
//                                               item.productName ?? '',
//                                               style: TextStyle(
//                                                   fontSize: 13,
//                                                   fontFamily:
//                                                       kfontPoppinsMedium),
//                                             ),
//                                           ],
//                                         ),
//                                         Padding(
//                                           padding:
//                                               const EdgeInsets.only(right: 20),
//                                           child: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               Row(
//                                                 children: [
//                                                   Icon(
//                                                     Icons.poll_rounded,
//                                                     color: Colors.grey,
//                                                     size: 14,
//                                                   ),
//                                                   Text(' Product',
//                                                       style: TextStyle(
//                                                           fontFamily:
//                                                               kfontPoppinsLight,
//                                                           color: Colors.grey))
//                                                 ],
//                                               ),
//                                               Text(
//                                                 item.productName ?? '',
//                                                 style: TextStyle(
//                                                     fontFamily:
//                                                         kfontPoppinsMedium),
//                                               )
//                                             ],
//                                           ),
//                                         )
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     // CountContainer(
//                     //   index: (index + 1).toString(),
//                     // ),
//                   ]),
//                 );
//               },
//               itemCount: allItems.length,
//             );
//           }
//         },
//       ),
      
//     );
//   }
// }