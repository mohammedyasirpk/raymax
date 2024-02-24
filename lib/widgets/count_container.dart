// // ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors, must_be_immutable
// import 'package:byon_care/constents.dart';
// import 'package:flutter/material.dart';

// class CountContainer extends StatelessWidget {
//   CountContainer({Key? key, required this.index}) : super(key: key);

//   String index;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 20,
//       width: 20,
//       decoration: BoxDecoration(
//         color: kbyoncolor3,
//         //  color: Colors.grey[300],
//         borderRadius: BorderRadius.only(
//             bottomLeft: Radius.circular(10), bottomRight: Radius.circular(30)),
//         border: Border(
//           bottom: BorderSide(
//             width: 2,
//             color: kbyoncolor3,
//             style: BorderStyle.solid,
//           ),
//         ),
//       ),
//       child: Center(
//           child: Text(
//         index,
//         style: TextStyle(
//             color: Colors.white, fontFamily: kfontPoppinsMedium, fontSize: 12),
//       )),
//     );
//   }
// }
