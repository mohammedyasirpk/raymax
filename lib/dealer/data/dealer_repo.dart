// ignore_for_file: avoid_print
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../models/product_model_class.dart';

class DealerRep{

  DealerRep._internal();
  static DealerRep instance = DealerRep._internal();
  factory DealerRep() {
    return instance;
  }

  final currentuserId = FirebaseAuth.instance.currentUser!.uid;
  
   Future<List<ProductModel>> getRecentItems() async {
    List<ProductModel> recentItems = [];
    try {
      QuerySnapshot<Map<String, dynamic>> productItems = await FirebaseFirestore.instance
          .collection('items').where("dealer", isEqualTo: currentuserId)
          .limit(3)
          .get();

      for (QueryDocumentSnapshot<Map<String,dynamic>> document in productItems.docs) {

     

        recentItems.add(ProductModel.fromMap(document.data(), document.id));
      }
    } catch (e) {
      print('Error getting recent items: $e');
    }

    return recentItems;
  }



    Future<void> startWarrenty(
      {required ProductModel productModel}) async {
    try {
      await FirebaseFirestore.instance.collection('items').doc(productModel.docId).update({
        "purchaseDate":Timestamp.now(),
        "customer": productModel.customername,
        "email": productModel.email,
        "dealer": FirebaseAuth.instance.currentUser!.uid 
      });
      print('Product details updated successfully');
    } catch (e) {
      print('Error updating product details: $e');
    }
  }



  Future<List<ProductModel>> getDealerViewAll() async {
    List<ProductModel> allItems = [];
    try {
      QuerySnapshot<Map<String, dynamic>> productAllItems = await FirebaseFirestore.instance
          .collection('items')
       
          .limit(10)
          .get();

      for (var document in productAllItems.docs) {
        String productType = document.data()['productType'] ?? '';
        String modalName = document.data()['modalName'] ?? '';
        Timestamp productionDateTimestamp = document.data()['productionDate'];
        Timestamp productionDate = productionDateTimestamp;
      
        String qrid = document.data()["qrCode"] ?? '';

        allItems.add(ProductModel(
           productName : productType,
            modalName: modalName,
            productionDate: productionDate,
           
            qrId: qrid));
      }
    } catch (e) {
      print('Error getting recent items: $e');
    }

    return allItems;
  }
}