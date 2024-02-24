// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:byon_care/constents.dart';
// import 'package:byon_care/models/complaints_model.dart';
// import 'package:byon_care/models/usermodel.dart';
// import 'package:byon_care/services/showmassege.dart';
// import 'package:byon_care/servicess/firestore_services.dart';
// import 'package:flutter/material.dart';

// class ServiceDetailsScreen extends StatefulWidget {
//   const ServiceDetailsScreen({Key? key, required this.complaints})
//       : super(key: key);

//   final List<ComplaintModel> complaints;

//   @override
//   State<ServiceDetailsScreen> createState() => _ServiceDetailsScreenState();
// }

// class _ServiceDetailsScreenState extends State<ServiceDetailsScreen> {
//   String? dropdownvalue;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           backgroundColor: Colors.white,
//           leading: BackButton(color: Colors.black),
//           elevation: 0,
//           title: Align(
//             alignment: Alignment.bottomLeft,
//             child: Text(
//               'Service Details',
//               style: TextStyle(
//                   color: Colors.black,
//                   fontFamily: kfontPoppinsSemiBold,
//                   fontSize: 24),
//             ),
//           )),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(5),
//                 color: Colors.white,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.2),
//                     spreadRadius: 2,
//                     blurRadius: 2,
//                     offset: Offset(1, 1),
//                   ),
//                 ],
//               ),
//               child: Text(
//                 widget.complaints[0].name ?? "",
//                 style: TextStyle(fontSize: 17, fontFamily: kfontPoppinsMedium),
//               ),
//             ),
//             SizedBox(
//               height: 15,
//             ),
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(5),
//                 color: Colors.white,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.2),
//                     spreadRadius: 2,
//                     blurRadius: 2,
//                     offset: Offset(1, 1),
//                   ),
//                 ],
//               ),
//               child: Text(
//                 widget.complaints[0].phoneNo ?? '',
//                 style: TextStyle(fontSize: 17, fontFamily: kfontPoppinsMedium),
//               ),
//             ),
//             SizedBox(
//               height: 15,
//             ),
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(5),
//                 color: Colors.white,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.2),
//                     spreadRadius: 2,
//                     blurRadius: 2,
//                     offset: Offset(1, 1),
//                   ),
//                 ],
//               ),
//               child: Text(
//                 widget.complaints[0].address ?? '',
//                 style: TextStyle(fontSize: 17, fontFamily: kfontPoppinsMedium),
//               ),
//             ),
//             SizedBox(
//               height: 15,
//             ),
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(5),
//                 color: Colors.white,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.2),
//                     spreadRadius: 2,
//                     blurRadius: 2,
//                     offset: Offset(1, 1),
//                   ),
//                 ],
//               ),
//               child: Text(
//                 widget.complaints[0].complaints ?? '',
//                 style: TextStyle(fontSize: 17, fontFamily: kfontPoppinsMedium),
//               ),
//             ),
//             SizedBox(
//               height: 15,
//             ),
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(5),
//                 color: Colors.white,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.2),
//                     spreadRadius: 2,
//                     blurRadius: 2,
//                     offset: Offset(1, 1),
//                   ),
//                 ],
//               ),
//               child: Text(
//                 widget.complaints[0].qrId ?? "",
//                 style: TextStyle(fontSize: 17, fontFamily: kfontPoppinsMedium),
//               ),
//             ),
//             SizedBox(
//               height: 15,
//             ),
//             SizedBox(
//               height: 50,
//               width: 400,
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.2),
//                       spreadRadius: 2,
//                       blurRadius: 2,
//                       offset: Offset(1, 1),
//                     ),
//                   ],
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//                 child: FutureBuilder<List<UserModel>>(
//                   future: FirestoreServices().availableServiceTechnician(),
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return Align(
//                         alignment: Alignment.center,
//                         child: SizedBox(
//                           height: 25,
//                           //width: 20,
//                           child: CircularProgressIndicator(
//                             color: kbyoncolor3,
//                           ),
//                         ),
//                       );
//                     } else if (snapshot.hasError) {
//                       return Text('No data');
//                     } else {
//                       return DropdownButtonHideUnderline(
//                         child: DropdownButton(
//                           padding:
//                               EdgeInsets.symmetric(horizontal: 15, vertical: 5),
//                           hint: dropdownvalue == null
//                               ? Text(
//                                   'Select Name',
//                                   style: TextStyle(
//                                     fontSize: 17,
//                                     fontFamily: kfontPoppinsMedium,
//                                   ),
//                                 )
//                               : Text(
//                                   dropdownvalue ?? '',
//                                   style: TextStyle(color: Colors.blue),
//                                 ),
//                           value: dropdownvalue,
//                           items: snapshot.data?.map((UserModel value) {
//                             return DropdownMenuItem<String>(
//                               value: value.name,
//                               child: Text(
//                                 value.name!,
//                                 style: TextStyle(
//                                   fontSize: 17,
//                                   fontFamily: kfontPoppinsMedium,
//                                 ),
//                               ),
//                             );
//                           }).toList(),
//                           underline: SizedBox(
//                             height: 5,
//                           ),
//                           onChanged: (String? newValue) {
//                             if (newValue != null) {
//                               setState(
//                                 () {
//                                   dropdownvalue = newValue;
//                                 },
//                               );
//                             }
//                           },
//                         ),
//                       );
//                     }
//                   },
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Align(
//               alignment: Alignment.center,
//               child: SizedBox(
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
//                     if (dropdownvalue == null || dropdownvalue!.isEmpty) {
//                       FirestoreServices().submitServiceDetails(
//                           uid: widget.complaints[0].uid ?? '');
//                       showmassege('Submitted successfully');
//                       Navigator.pop(context);
//                     }
//                   },
//                   child: Text(
//                     'Submit',
//                     style:
//                         TextStyle(fontFamily: kfontPoppinsMedium, fontSize: 16),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
