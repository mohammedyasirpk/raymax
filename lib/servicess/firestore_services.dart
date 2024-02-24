// ignore_for_file: avoid_print, unused_local_variable, prefer_const_constructors, await_only_futures, use_rethrow_when_possible, non_constant_identifier_names
import 'dart:async';
import 'package:byon_care/models/complaints_model.dart';
import 'package:byon_care/models/enquiry_model.dart';
import 'package:byon_care/models/product_model_class.dart';
import 'package:byon_care/models/usermodel.dart';
import 'package:byon_care/popup/service_popup.dart';
import 'package:byon_care/services/showmassege.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirestoreServices {
  final _fireStore = FirebaseFirestore.instance;

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future uploadProductDetails({
    required ProductModel productModel,
  }) async {
    bool? isSoled = false;
    await _fireStore.collection('items').add({
      "description": productModel.description,
      "productName": productModel.productName,
      "modalName": productModel.modalName,
      // "colours": productModel.colours,
      "warranty": productModel.warranty,
      "productionDate": productModel.productionDate,
      "qrCode": productModel.qrId,
      "isSold": false
    });
  }

  // Future checkQrcodeProduct

  Future uploadproductionfordealer(
    ProductModel productData,
  
    String modelName,
      String? editingProductid,
  ) async {
    await _fireStore
        .collection('items')
        .doc(
          editingProductid,
        )
        .set({
      "description": productData.description,
      "imageUrl": productData.imageUrl,
      "productName": productData.productName,
      "modelName": modelName,
      "qrCode": productData.qrId,
      "warranty": productData.warranty,
      "additionalwarranty": productData.additionalWarranty,
      "productionDate": FieldValue.serverTimestamp(),
      "email": FirebaseAuth.instance.currentUser?.email
    });
  }

  Future<List<ProductModel>>? getourProductsforproduction() async {
    List<ProductModel> ourProductlist = [];
    QuerySnapshot<Map<String, dynamic>> OurProducts =
        await FirebaseFirestore.instance.collection("ourProduct").get();
    for (var element in OurProducts.docs) {
      ourProductlist.add(ProductModel.fromMap(element.data(), element.id));
    }
    return ourProductlist;
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getUploadItem(
      String qrcode, context) async {
    var data = await _fireStore
        .collection('items')
        .where("qrCode", isEqualTo: qrcode)
        .get();
    int calculateWarranty(Timestamp currentDate, Timestamp purchaseDate) {
      DateTime currentDateTime = currentDate.toDate();
      DateTime purchaseDateTime = purchaseDate.toDate();
      Duration monthsDifference =
          (currentDateTime).difference(purchaseDateTime);
      return (monthsDifference.inDays / 30).round();
    }

    String calculateWarrantyStatus(
        Timestamp currentDate, Timestamp purchaseDate) {
      int remainingMonths = calculateWarranty(currentDate, purchaseDate);

      if (remainingMonths > 0) {
        return "$remainingMonths Months left";
      } else {
        return "Expired";
      }
    }

    String warrantyStatus =
        calculateWarrantyStatus(Timestamp.now(), data.docs[0]['purchaseDate']);

    if (warrantyStatus == "Expired") {
      servicePopup(context);
    }
    return data;
  }

  Future uploadUserDetails(
      {required UserModel userModel, required String uid}) async {
    await _fireStore.collection('users').doc(uid).set({
      "name": userModel.name,
      "phoneNo": userModel.phoneNo,
      "email": userModel.email,
      "image": userModel.image
    });
  }

  Future<bool> checkQrCodeExist(String qrCode) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('items')
          .where('qrCode', isEqualTo: qrCode)
          .get();
      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      print("Error checking QR code existence: $e");
      return false;
    }
  }

  Stream<List<ProductModel>> getRecentItems() {
    try {
      return _fireStore
          .collection('items')
          .orderBy('productionDate', descending: true)
          .limit(3)
          .snapshots()
          .map((QuerySnapshot<Map<String, dynamic>> snapshot) {
        return snapshot.docs
            .map((QueryDocumentSnapshot<Map<String, dynamic>> document) {
          return ProductModel.fromMap(document.data(), document.id);
        }).toList();
      });
    } catch (e) {
      print('Error getting recent items: $e');
      return Stream.value([]);
    }
  }

  Stream<List<ProductModel>> getViewAll() {
    try {
      Stream<QuerySnapshot<Map<String, dynamic>>> snapshots = _fireStore
          .collection('items')
          .orderBy('productionDate', descending: true)
          .limit(10)
          .snapshots();

      return snapshots.map((querySnapshot) {
        List<ProductModel> allItems = [];
        for (var document in querySnapshot.docs) {
          allItems.add(ProductModel.fromMap(document.data(), document.id));
        }
        return allItems;
      });
    } catch (e) {
      print('Error getting recent items: $e');
      return Stream.value([]);
    }
  }

  Future<void> editProductDetails({required ProductModel productModel}) async {
    try {
      await _fireStore.collection('items').doc(productModel.docId).update({
        "productName": productModel.productName,
        "modalName": productModel.modalName,
        // "colours": productModel.colours,
        "warranty": productModel.warranty,
        "qrCode": productModel.qrId
      });
      print('Product details updated successfully');
    } catch (e) {
      print('Error updating product details: $e');
    }
  }

  Future submitComplaint(
      {required ComplaintModel complaintModel,
      required userEmail,
      required name,
      required phoneNo,
      required status}) async {
    try {
      await _fireStore.collection('complaints').doc().set({
        "productId": complaintModel.productData?.docId,
        "name": complaintModel.name,
        "phoneNo": complaintModel.phoneNo,
        "address": complaintModel.address,
        "qrCode": complaintModel.qrId,
        "complaints": complaintModel.complaints,
        "status": complaintModel.status ?? "open",
        "registerDate":
            complaintModel.registerDate ?? FieldValue.serverTimestamp(),
        "productName": complaintModel.productData?.productName,
        "modalName": complaintModel.productData?.modalName,
        "warranty": complaintModel.productData?.warranty,
        "modelName": complaintModel.productData?.modalName,
      });
      print("Complaint submitted successfully!");
    } catch (e) {
      print("Error submitting complaint: $e");
    }
  }

  Future submitEnquiry(
      {required EnquiryModel enquiryModel, required String userEmail}) async {
    try {
      await _fireStore
          .collection('enquiry')
          .doc()
          .set({"message": enquiryModel.message, "userEmail": userEmail});
      print("Complaint submitted successfully!");
    } catch (e) {
      print("Error submitting complaint: $e");
    }
  }

  Stream<QuerySnapshot> compareUserEmail() {
    String? userEmail = FirebaseAuth.instance.currentUser?.email;

    if (userEmail != null) {
      return _fireStore
          .collection('items')
          .where('email', isEqualTo: userEmail)
          .snapshots();
    }
    return Stream.empty();
  }

  Future signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  Future editProfile(
      {required UserModel userModel, required String uid}) async {
    await _fireStore.collection('users').doc(uid).update({
      "name": userModel.name,
      "email": userModel.email,
      "phoneNo": userModel.phoneNo,
      "image": userModel.image
    });
  }

  Future changePassword(String confirmPassword) async {
    final user = FirebaseAuth.instance.currentUser;
    try {
      await user?.updatePassword(confirmPassword);
    } catch (error) {
      print("Error updating password: $error");
    }
  }

  Future reauthentication(String email, String password) async {
    var currentUser = FirebaseAuth.instance.currentUser;

    try {
      await currentUser?.reauthenticateWithCredential(
        EmailAuthProvider.credential(
          email: email,
          password: password,
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

  Future AddOrEditservice({
    required ComplaintModel? complaintdata,
  }) async {
    await _fireStore.collection('complaints').doc(complaintdata?.id).set({
      "productId": complaintdata?.productData?.docId,
      "name": complaintdata?.name,
      "phoneNo": complaintdata?.phoneNo,
      "address": complaintdata?.address,
      "qrCode": complaintdata?.qrId,
      "complaints": complaintdata?.complaints,
      "status": complaintdata?.status ?? "open",
      "registerDate":
          complaintdata?.registerDate ?? FieldValue.serverTimestamp(),
      "productName": complaintdata?.productData?.productName,
      "modalName": complaintdata?.productData?.modalName,
      "warranty": complaintdata?.productData?.warranty,
      "additionalwarranty": complaintdata?.productData?.additionalWarranty
    }, SetOptions(merge: true));
  }

  Future submitServiceDetails({required String uid}) async {
    await _fireStore.collection('complaints').doc().set({
      'uid': uid,
    });
  }

  Future changeTechnicianfromcomplaint(
      String complaintId, UserModel technician) async {
    await FirebaseFirestore.instance
        .collection('complaints')
        .doc(complaintId)
        .update({
      "technicianName": technician.name,
      "technicianId": technician.uid
    });
  }

  Future<List<UserModel>> changeStatus(
      String complaintId, String status, Timestamp closedDate) async {
    if (status == 'closed') {
      await FirebaseFirestore.instance
          .collection('complaints')
          .doc(complaintId)
          .update({"status": status, "closedDate": closedDate});
    } else {
      await FirebaseFirestore.instance
          .collection('complaints')
          .doc(complaintId)
          .update({"closedDate": FieldValue.delete(), "status": status});
    }

    return [];
  }

  Future editServiceDetails(ComplaintModel complaintData) async {
    await FirebaseFirestore.instance
        .collection('complaints')
        .doc(complaintData.id)
        .update({
      "productId": complaintData.productData?.docId,
      "complaints": complaintData.complaints,
      "component": complaintData.component,
      "servicecharges": complaintData.servicecharges,
      "status": complaintData.status
    });
  }

  Future<List<UserModel>> availableServiceTechnician() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('role', isEqualTo: 'technician')
        .get();

    List<UserModel> technicianNames = [];

    for (var document in querySnapshot.docs) {
      if (document.data() != null && document.data() is Map<String, dynamic>) {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;

        if (data.containsKey(
          'name',
        )) {
          String name = data['name'];
          String uid = document.id;
          technicianNames.add(UserModel(
              name: name, uid: uid, notification: data['notification']));
        }
      }
    }
    return technicianNames;
  }

  Future<List<ComplaintModel>> serviceHistory(
      ComplaintModel complaintData) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection('complaints')
        .where("qrCode", isEqualTo: complaintData.qrId)
        .where(FieldPath.documentId, isNotEqualTo: complaintData.id)
        .get();

    List<ComplaintModel> complaintList = [];

    for (QueryDocumentSnapshot<Map<String, dynamic>> document
        in querySnapshot.docs) {
      complaintList.add(ComplaintModel.fromMap(
          document.data(), document.id, document.data()["productId"]));
    }
    return complaintList;
  }

  Future<ProductModel?> getproductbyqrcode(String productId) async {
    var itemsData = await _fireStore
        .collection('items')
        .where('qrCode', isEqualTo: productId)
        .get();
    if (itemsData.docs.isNotEmpty) {
      return ProductModel.fromMap(
          itemsData.docs[0].data(), itemsData.docs[0].id);
    }
    return null;
  }

  Future editcomplaintproductdetails(
      ProductModel productData, String complalaintId) async {
    await _fireStore.collection('complaints').doc(complalaintId).set({
      "dealerName": productData.dealerName,
      "dealerId": productData.dealerId,
      "qrCode": productData.qrId,

      //"colours": productData.colours,
      "productName": productData.productName,
      "modelName": productData.modalName,
      "warranty": productData.warranty,
      "additionalwarranty": productData.additionalWarranty,
      "productionDate": productData.productionDate,
      "purchaseDate": productData.purchaseDateTime
    }, SetOptions(merge: true));
  }

  Future startWarranty(UserModel? userModel, ProductModel productData) async {
    await _fireStore.collection('items').doc(productData.docId).update({
      "dealerName": userModel?.name,
      "dealerId": userModel?.uid,
      "purchaseDate": Timestamp.now()
    });
  }

  Future addOurProduct({required ProductModel productModel}) async {
    try {
      await _fireStore.collection("ourProduct").doc(productModel.docId).set({
        "productName": productModel.productName,
        "warranty": productModel.warranty,
        "additionalwarranty": productModel.additionalWarranty,
        "modelList":
            FieldValue.arrayUnion(productModel.modelList as List<String>),
        "description": productModel.description,
        "imageUrl": productModel.imageUrl
      });
    } catch (e) {
      return;
    }
  }
}
