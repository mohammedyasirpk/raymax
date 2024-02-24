import 'package:byon_care/admin_screen/widgets/user_container.dart';
import 'package:byon_care/constents.dart';
import 'package:byon_care/models/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../customerr_screen/widgets/listtile_product.dart';
import '../models/product_model_class.dart';
import '../screen/myproductViewScreen.dart';
import 'shimmer/lastsale_shimmer.dart';

class AllSalesViewScreen extends StatefulWidget {
  AllSalesViewScreen({Key? key, this.dealerData}) : super(key: key);
  
  final UserModel? dealerData;

  @override
  State<AllSalesViewScreen> createState() => _AllSalesViewScreenState();
}

class _AllSalesViewScreenState extends State<AllSalesViewScreen> {

  late Stream<QuerySnapshot<Map<String, dynamic>>> productStreamAdmin;
 
 @override
  void initState() {
     productStreamAdmin = FirebaseFirestore.instance
      .collection("items").where("purchaseDate",isNull: false).orderBy("purchaseDate",descending: true).where("dealerId",isEqualTo:widget. dealerData?.uid)
      

      .snapshots();
    super.initState();
  }

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
                } else if (!snapshot.hasData || snapshot.data?.docs.isEmpty == true) {
                  return const Center(child: Text("No data available"));
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
                  itemCount: listOfproductModel.length,
                  itemBuilder: (context, index) {
                    final item = listOfproductModel[index];
                    return ProductListTile(
                         onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyProductViewScreen(productData: item,userData: widget.dealerData),));
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
