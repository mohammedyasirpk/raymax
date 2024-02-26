// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// import 'package:byon_care/constents.dart';
// import 'package:byon_care/old_customer_screen/editprofile.dart';
// import 'package:byon_care/old_customer_screen/changepassword_screen.dart';
// import 'package:byon_care/auth_screen/login.dart';
// import 'package:byon_care/models/usermodel.dart';
// import 'package:byon_care/servicess/firestore_services.dart';
// import 'package:flutter/material.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({Key? key, required this.userModel}) : super(key: key);

//   final UserModel userModel;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           title: Text(
//             'Profile',
//             style: TextStyle(
//               fontFamily: kfontPoppinsMedium,
//               fontSize: 20,
//               color: Colors.black,
//             ),
//           ),
//           centerTitle: true,
//           iconTheme: IconThemeData(color: Colors.black, size: 23),
//         ),
//         body:
//             SingleChildScrollView(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 20,
//               ),
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(50),
//                 child: userModel.image != null &&
//                         Uri.parse(userModel.image!).isAbsolute
//                     ? Image.network(
//                         userModel.image!,
//                         width: 100,
//                         height: 100,
//                         fit: BoxFit.fill,
//                       )
//                     : Container(
//                         width: 100,
//                         height: 100,
//                         color: Colors.grey[200],
//                         child: Icon(
//                           Icons.person,
//                           size: 60,
//                           color: Colors.black,
//                         ),
//                       ),
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//               Text(
//                 userModel.name ?? '',
//                 style: TextStyle(fontFamily: kfontPoppinsMedium, fontSize: 16),
//               ),
//               Text(
//                 userModel.email ?? '',
//                 style: TextStyle(fontFamily: kfontPoppinsLight, fontSize: 15),
//               ),
//               Text(
//                 userModel.phoneNo ?? '',
//                 style: TextStyle(
//                     fontFamily: kfontPoppinsLight,
//                     fontSize: 15,
//                     color: Colors.black),
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//               SizedBox(
//                 width: 230,
//                 height: 50,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     shape: const RoundedRectangleBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(30.0)),
//                     ),
//                     backgroundColor: kbyoncolor3,
//                   ),
//                   onPressed: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => EditProfile(
//                             name: userModel.name ?? '',
//                             email: userModel.email ?? '',
//                             phoneNo: userModel.phoneNo ?? '',
//                             image: userModel.image ?? '',
//                           ),
//                         ));
//                   },
//                   child: Text(
//                     'Edit Profile',
//                     style:
//                         TextStyle(fontFamily: kfontPoppinsMedium, fontSize: 16),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 15, right: 15),
//                 child: Align(
//                   alignment: Alignment.bottomLeft,
//                   child: InkWell(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => ChangePasswordScreen(),
//                           ));
//                     },
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         color: Colors.white,
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.2),
//                             spreadRadius: 2,
//                             blurRadius: 2,
//                             offset: Offset(1, 1),
//                           ),
//                         ],
//                       ),
//                       height: 70,
//                       width: double.infinity,
//                       child: ListView(
//                         shrinkWrap: true,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(top: 20, left: 20),
//                             child: Row(
//                               children: [
//                                 Icon(
//                                   Icons.lock,
//                                   size: 20,
//                                 ),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                                 Text(
//                                   'Change Password',
//                                   style: TextStyle(
//                                       fontSize: 17,
//                                       fontFamily: kfontPoppinsMedium),
//                                 )
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 15, right: 15),
//                 child: Align(
//                   alignment: Alignment.bottomLeft,
//                   child: InkWell(
//                     onTap: () {
//                       FirestoreServices().signOut(context);
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => Login(),
//                           ));
//                     },
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         color: Colors.white,
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.2),
//                             spreadRadius: 2,
//                             blurRadius: 2,
//                             offset: Offset(1, 1),
//                           ),
//                         ],
//                       ),
//                       height: 70,
//                       width: double.infinity,
//                       child: ListView(
//                         shrinkWrap: true,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(top: 20, left: 20),
//                             child: Row(
//                               children: [
//                                 Icon(
//                                   Icons.logout,
//                                   size: 20,
//                                 ),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                                 Text(
//                                   'LogOut',
//                                   style: TextStyle(
//                                       fontSize: 17,
//                                       fontFamily: kfontPoppinsMedium),
//                                 )
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }
// }
