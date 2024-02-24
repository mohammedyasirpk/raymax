// // ignore_for_file: non_constant_identifier_names

// import 'package:byon_care/forgot_password_success_page.dart';
// import 'package:byon_care/models/usermodel.dart';
// import 'package:byon_care/notification/notification.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:top_snackbar_flutter/custom_snack_bar.dart';
// import 'package:top_snackbar_flutter/top_snack_bar.dart';

// class FirebaseAuthentication {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<bool?> signUp(String name, String email, String password,
//       BuildContext context, String phoneNo) async {
//     try {
//       UserCredential user = await _auth.createUserWithEmailAndPassword(
//           email: email.replaceAll(' ', ''),
//           password: password.replaceAll(' ', ''));
//       if (user.user?.uid != null) {
//         String Fcmtoken = await initNotification();
//         await _firestore.collection('users').doc(user.user!.uid).set(
//           {
//             "name": name,
//             "phoneNo": phoneNo,
//             "email": email,
//             "notification": Fcmtoken,
//             'registeredDate': FieldValue.serverTimestamp(),
//           },
//         );
//         return true;
//       }
//     } on FirebaseAuthException catch (e) {
//       if (e.code == "email-already-in-use") {
//         showTopSnackBar(
//           Overlay.of(context),
//           const CustomSnackBar.error(
//             message: "The account with this email already exists.",
//           ),
//         );
//       }
//       if (e.code == 'weak-password') {
//         showTopSnackBar(
//           Overlay.of(context),
//           const CustomSnackBar.error(
//             message: "Password is too weak.",
//           ),
//         );
//       }
//     } catch (e) {
//       // For anything else
//       showTopSnackBar(
//         Overlay.of(context),
//         const CustomSnackBar.error(
//           message: "Something went wrong,please try again",
//         ),
//       );
//     }
//     return false;
//   }

//   Future<void> login(
//       String email, String password, BuildContext context) async {
//     try {
//       await _auth.signInWithEmailAndPassword(
//           email: email.replaceAll(' ', ''),
//           password: password.replaceAll(' ', ''));
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         showTopSnackBar(
//           Overlay.of(context),
//           const CustomSnackBar.error(
//             message: "No user found for that email.",
//           ),
//         );
//       }
//       if (e.code == 'wrong-password') {
//         showTopSnackBar(
//           Overlay.of(context),
//           const CustomSnackBar.error(
//             message: "Entered password is wrong",
//           ),
//         );
//       }
//       if (e.code == 'invalid-credential') {
//         showTopSnackBar(
//           Overlay.of(context),
//           const CustomSnackBar.error(
//             message: "Incorrect login details",
//           ),
//         );
//       }
//       if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
//         showTopSnackBar(
//           Overlay.of(context),
//           const CustomSnackBar.error(
//             message: "Incorrect login details",
//           ),
//         );
//       }
//     } catch (e) {
//       if (context.mounted) {
//         showTopSnackBar(
//           Overlay.of(context),
//           const CustomSnackBar.error(
//             message: "Something went wrong,please try again",
//           ),
//         );
//       }
//     }
//   }

//   Future<void> logout(context) async {
//     await FirebaseAuth.instance.signOut();
//   }

//   Future<void> changePassowrd(String password, context) async {
//     User user = FirebaseAuth.instance.currentUser!;
//     try {
//       await user.updatePassword(password);
//       showTopSnackBar(
//         Overlay.of(context),
//         const CustomSnackBar.success(
//           message: "Password changed successfully",
//           backgroundColor: Colors.orange,
//         ),
//       );
//       Navigator.pop(context);
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         showTopSnackBar(
//           Overlay.of(context),
//           const CustomSnackBar.error(
//             message: "Password is too weak.",
//           ),
//         );
//       }
//     } catch (e) {
//       showTopSnackBar(
//         Overlay.of(context),
//         const CustomSnackBar.error(
//           message: "Something went wrong,please try again",
//         ),
//       );
//     }
//   }

//   Future<bool> userReAuthentication(
//       String email, String password, context) async {
//     try {
//       await _auth.currentUser?.reauthenticateWithCredential(
//         EmailAuthProvider.credential(
//           email: email,
//           password: password,
//         ),
//       );
//       Navigator.pop(context);
//       return true;
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'wrong-password') {
//         showTopSnackBar(
//           Overlay.of(context),
//           const CustomSnackBar.error(
//             message: "Entered password is wrong",
//           ),
//         );
//       }
//       if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
//         showTopSnackBar(
//           Overlay.of(context),
//           const CustomSnackBar.error(
//             message: "Incorrect login details",
//           ),
//         );
//       }

//       if (e.code == 'invalid-credential') {
//         showTopSnackBar(
//           Overlay.of(context),
//           const CustomSnackBar.error(
//             message: "Incorrect login details",
//           ),
//         );
//       }
//     } catch (e) {
//       showTopSnackBar(
//         Overlay.of(context),
//         const CustomSnackBar.error(
//           message: "Something went wrong,please try again",
//         ),
//       );
//     }
//     return false;
//   }

//   Future<void> deleteUserAccount() async {
//     try {
//       await FirebaseAuth.instance.currentUser!.delete();
//     } on FirebaseAuthException catch (e) {
//       print(e);
//     } catch (e) {
//       print(e);
//     }
//   }

//   Future<void> resetPassword(String email, BuildContext context) async {
//     try {
//       await _auth.sendPasswordResetEmail(email: email);
//       Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//               builder: (context) => const ForgotPasswordSuccessPage()));
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         showTopSnackBar(
//           Overlay.of(context),
//           const CustomSnackBar.error(
//             message: "No user found for that email.",
//           ),
//         );
//       }
//     } catch (e) {
//       // print(e);
//     }
//   }
// }