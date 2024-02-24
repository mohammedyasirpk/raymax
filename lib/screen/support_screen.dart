// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// import 'package:byon_care/constents.dart';
// import 'package:byon_care/dealer/screen_dealer%20copy.dart';
// import 'package:byon_care/models/complaints_model.dart';
// import 'package:byon_care/services/showmassege.dart';
// import 'package:byon_care/servicess/firestore_services.dart';
// import 'package:byon_care/tabs/servicetab.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class SupportScreen extends StatelessWidget {
//   const SupportScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final complaintController = TextEditingController();
//     final addressController = TextEditingController();

//     bool? isloading = false;
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 65),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               InkWell(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) =>
//                             Servicetap(qrcode: qrcode.toString()),
//                       ));
//                 },
//                 child: Container(
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     border: Border.all(color: Colors.white),
//                     borderRadius: BorderRadius.circular(5),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.1),
//                         spreadRadius: 1,
//                         blurRadius: 2,
//                         offset: Offset(0, 0),
//                       )
//                     ],
//                   ),
//                   child: Column(
//                     children: [
//                       Text(
//                         'Qr Code',
//                         style: TextStyle(
//                             fontFamily: kfontPoppinsMedium, fontSize: 20),
//                       ),
//                       SizedBox(
//                         height: 5,
//                       ),
//                       Text(
//                         'Click here to Scan the qrcode',
//                         style: TextStyle(
//                             fontFamily: kfontPoppinsRegular,
//                             fontSize: 13,
//                             color: Colors.grey),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               Align(
//                 alignment: Alignment.bottomLeft,
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 20),
//                   child: Text(
//                     '  Complaints',
//                     style:
//                         TextStyle(fontFamily: kfontPoppinsMedium, fontSize: 16),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Container(
//                 height: 150,
//                 decoration: BoxDecoration(
//                   color: const Color(0XFF8E8E93).withOpacity(.12),
//                   borderRadius: const BorderRadius.all(Radius.circular(22.0)),
//                 ),
//                 child: Center(
//                   child: TextField(
//                     maxLines: 5,
//                     minLines: 5,
//                     keyboardType: TextInputType.multiline,
//                     controller: complaintController,
//                     decoration: InputDecoration(
//                       contentPadding:
//                           const EdgeInsets.only(left: 10, right: 10),
//                       hintText: '',
//                       helperStyle: TextStyle(
//                         color: const Color(0XFF919192).withOpacity(.40),
//                         fontSize: 17,
//                         fontFamily: kfontPoppinsRegular,
//                       ),
//                       border: InputBorder.none,
//                     ),
//                   ),
//                 ),
//               ),
//               Align(
//                 alignment: Alignment.bottomLeft,
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 20),
//                   child: Text(
//                     '  Address',
//                     style:
//                         TextStyle(fontFamily: kfontPoppinsMedium, fontSize: 16),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Container(
//                 height: 150,
//                 decoration: BoxDecoration(
//                   color: const Color(0XFF8E8E93).withOpacity(.12),
//                   borderRadius: const BorderRadius.all(Radius.circular(22.0)),
//                 ),
//                 child: Center(
//                   child: TextField(
//                     maxLines: 5,
//                     minLines: 5,
//                     keyboardType: TextInputType.multiline,
//                     controller: addressController,
//                     decoration: InputDecoration(
//                       contentPadding:
//                           const EdgeInsets.only(left: 10, right: 10),
//                       hintText: '',
//                       helperStyle: TextStyle(
//                         color: const Color(0XFF919192).withOpacity(.40),
//                         fontSize: 17,
//                         fontFamily: kfontPoppinsRegular,
//                       ),
//                       border: InputBorder.none,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               MaterialButton(
//                 onPressed: () async {
//                   if (complaintController.text.isNotEmpty) {
//                     ComplaintModel complaintModel = ComplaintModel(
//                       address: addressController.text,
//                       complaints: complaintController.text,
//                     );
//                     String? userEmail =
//                         FirebaseAuth.instance.currentUser?.email;
//                     await FirestoreServices().submitComplaint(
//                       userEmail: userEmail ?? '',
//                       complaintModel: complaintModel, name: null, phoneNo: null,
//                     );
//                     showmassege('Submitted Successfully');
//                     Navigator.pop(context);
//                   } else {
//                     showmassege('Please enter a message');
//                   }
//                 },
//                 shape: const RoundedRectangleBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(30.0))),
//                 minWidth: 235,
//                 height: 44,
//                 color: kbyoncolor3,
//                 child: isloading == true
//                     ? Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: const [
//                           SizedBox(
//                             height: 20.0,
//                             width: 20.0,
//                             child: CircularProgressIndicator(
//                               valueColor:
//                                   AlwaysStoppedAnimation<Color>(Colors.white),
//                               strokeWidth: 3.0,
//                             ),
//                           ),
//                         ],
//                       )
//                     : Text(
//                         'Submit',
//                         style: const TextStyle(
//                           color: Color(0XFFFFFFFF),
//                           fontSize: 17,
//                           fontFamily: 'Avenir-Heavy',
//                         ),
//                       ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
