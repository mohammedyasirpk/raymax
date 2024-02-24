import 'package:byon_care/constents.dart';
import 'package:byon_care/models/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../customerr_screen/widgets/listtile_product.dart';
import '../../models/product_model_class.dart';
import '../../screen/myproductViewScreen.dart';
import '../shimmer/lastsale_shimmer.dart';

class AdminViewAllLastSale extends StatelessWidget {
  AdminViewAllLastSale({Key? key, required this.userdata}) : super(key: key);

  final UserModel userdata;



  final productStreamAdmin = FirebaseFirestore.instance
      .collection("items")
      .where("email", isEqualTo: FirebaseAuth.instance.currentUser!.email)

      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
          backgroundColor: kbyoncolor3,
          elevation: 0,
          title: const Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              'All Sales',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: kfontPoppinsSemiBold,
                  fontSize: 22),
            ),
          )),
      body: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: productStreamAdmin,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return  ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                   
                   return LastSaleShimmer();
                  },
                );
                } else if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                } else if (!snapshot.hasData) {
                  return const Text("No data available");
                }
                final List<ProductModel> listOfproductModel = [];
                List<QueryDocumentSnapshot<Map<String, dynamic>>>
                    listOfProducts = snapshot.data!.docs;
                for (var item in listOfProducts) {
                  final product = item.data();

                  final ProductModel model =
                      ProductModel.fromMap(product, item.id);

                  listOfproductModel.add(model);
                }

                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    final item = listOfproductModel[index];
                    return ProductListTile(
                         onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyProductViewScreen(productData: item,userData: userdata,),));
                          },
                      productData: item,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
