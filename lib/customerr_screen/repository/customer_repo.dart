import 'package:byon_care/admin_screen/widgets/user_container.dart';
import 'package:byon_care/models/product_model_class.dart';
import 'package:byon_care/models/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CustomerRepo {
  Future<void> addProductForCustomer({
    required ProductModel productData,
     UserModel? userData
  }) async { final currentUseri = FirebaseAuth.instance.currentUser;
    await FirebaseFirestore
        .instance
        .collection("items").doc(productData.docId).update({"customerEmail": currentUseri?.email,"customerId":currentUseri?.uid,"customerName":userData?.name});

   

  }
  
   

 
}
