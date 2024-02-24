// // ignore_for_file: prefer_const_constructors, unnecessary_new, unused_element, avoid_unnecessary_containers

// import 'dart:io';
// import 'package:byon_care/constents.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';

// void showPicker(context) {
//   showModalBottomSheet(
//     shape: const RoundedRectangleBorder(
//       borderRadius: BorderRadius.only(
//         topLeft: Radius.circular(16.0),
//         topRight: Radius.circular(16.0),
//       ),
//     ),
//     context: context,
//     builder: (BuildContext bc) {
//       return SafeArea(
//         child: Container(
//           child: new Wrap(
//             children: <Widget>[
//               // SizedBox(
//               //   height: 20,
//               // ),
//               // Title(
//               //     color: Colors.black,
//               //     child: Center(
//               //       child: Text(
//               //         'Take Profile Photo',
//               //         style: TextStyle(
//               //             fontFamily: kfontPoppinsMedium, fontSize: 20),
//               //       ),
//               //     )),
//               new ListTile(
//                 leading: new Icon(
//                   Icons.photo_library,
//                   color: Colors.black,
//                 ),
//                 title: new Text(
//                   'Gallery',
//                   style: TextStyle(fontFamily: kfontPoppinsMedium),
//                 ),
//                 onTap: () {
//                   imgFromGallery(context);
//                   Navigator.of(context).pop();
//                 },
//               ),
//               new ListTile(
//                 leading: new Icon(
//                   Icons.photo_camera,
//                   color: Colors.black,
//                 ),
//                 title: new Text(
//                   'Camera',
//                   style: TextStyle(fontFamily: kfontPoppinsMedium),
//                 ),
//                 onTap: () {
//                   imgFromCamera(context);
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }

// Future imgFromGallery(context) async {
//   final ImagePicker _picker = ImagePicker();
//   File? _photo;

//   final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

//   if (pickedFile != null) {
//     _photo = File(pickedFile.path);
//     uploadFile(_photo);
//   } else {
//     // ignore: avoid_print
//     print('No image selected.');
//   }
// }

// Future imgFromCamera(context) async {
//   final ImagePicker _picker = ImagePicker();
//   File? _photo;

//   final pickedFile = await _picker.pickImage(source: ImageSource.camera);

//   if (pickedFile != null) {
//     _photo = File(pickedFile.path);
//     uploadFile(_photo);
//   } else {
//     // ignore: avoid_print
//     print('No image selected.');
//   }
// }

// Future uploadFile(File photo) async {
//   try {
//     String fileName = DateTime.now().millisecondsSinceEpoch.toString();
//     Reference storageReference =
//         FirebaseStorage.instance.ref().child('profile_images/$fileName');
//     UploadTask uploadTask = storageReference.putFile(photo);
//     await uploadTask.whenComplete(() async {
//       String url = await storageReference.getDownloadURL();
//       // ignore: avoid_print
//       print('File Uploaded. URL: $url');
//     });
//   } catch (e) {
//     // ignore: avoid_print
//     print('Error uploading file: $e');
//   }
// }
