// ignore_for_file: avoid_print, unused_element, unused_local_variable, prefer_const_constructors, duplicate_ignore, body_might_complete_normally_nullable
import 'package:byon_care/models/usermodel.dart';
import 'package:byon_care/auth_screen/login.dart';
import 'package:byon_care/screen/role_screen.dart';
import 'package:byon_care/services/showmassege.dart';
import 'package:byon_care/servicess/firestore_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../repository/topsnackbar.dart';

class FirebaseServices {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<String?> signIn({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RoleScreen(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        showmassege('User not found');
      } else if (e.code == "invalid-credential") {
        showmassege('invalid-credential');
      } else if (e.code == "account-exists-with-different-credential") {
        showmassege('Account exists with different credential');
      } else if (e.code == "invalid-email") {
        showmassege('Invalid email');
      } else if (e.code == "operation-not-allowed") {
        showmassege('Operation not allowed');
      } else if (e.code == "invalid-verification-code") {
        showmassege('Invalid verification code');
      } else if (e.code == "invalid-verification-id") {
        showmassege('Invalid verification ID');
      }

      return e.message;
    }
  }

  Future signUp(
      {required String email,
      required String password,
      required String name,
      required String phone,
      required BuildContext context}) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user?.uid != null) {
        await FirestoreServices().uploadUserDetails(
            userModel: UserModel(name: name, phoneNo: phone, email: email),
            uid: userCredential.user!.uid);

        Navigator.push(
          context,
          MaterialPageRoute(
            // ignore: prefer_const_constructors
            builder: (context) => RoleScreen(),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        showmassege('The email is already');
      }
      if (e.code == "invalid-email") {
        showmassege('Chech your email');
      }
      if (e.code == "weak-password") {
        showmassege('Weak Password');
      }
      return e.message;
    }
  }

  Future signOut(context) async {
    await auth.signOut().then((value) => Navigator.of(context)
        .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Login()),
            (route) => false));
  }


     Future<void> updateRole({required String? role, required String? docid,required BuildContext context ,}) async {
  
     if(docid == FirebaseAuth.instance.currentUser!.uid){
      showsnackbar("You Can't Change Your Own Role",context,SnackbarCondition.warning);
      return ;
     }



    try {
      final user = FirebaseFirestore.instance.collection("users").doc(docid);
      user.update({"role": role});
    } on FirebaseException catch (e) {
      print("error while updating role $e");
    }
  }


  Future <void> editUser({required UserModel userData,required BuildContext context})async{

    
    
   final user = FirebaseFirestore.instance.collection("users").doc(userData.uid).update({
    "name": userData.name,
    "phoneNo":userData.phoneNo,
    "image":userData.image,
    "role":userData.role
   });



  }



}
