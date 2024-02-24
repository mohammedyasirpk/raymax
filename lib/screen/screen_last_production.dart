import 'package:byon_care/admin_screen/widgets/user_container.dart';
import 'package:byon_care/constents.dart';
import 'package:byon_care/models/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../admin_screen/shimmer/lastsale_shimmer.dart';
import '../customerr_screen/widgets/listtile_product.dart';
import '../models/product_model_class.dart';
import '../screen/myproductViewScreen.dart';


class ScreenLastSaleProduction extends StatefulWidget {
  const ScreenLastSaleProduction({Key? key, this.userData}) : super(key: key);
  
  final UserModel? userData;

  @override
  State<ScreenLastSaleProduction> createState() => _ScreenLastSaleProductionState();
}

class _ScreenLastSaleProductionState extends State<ScreenLastSaleProduction> {

  late Stream<QuerySnapshot<Map<String, dynamic>>> productStreamAdmin;
 
 @override
  void initState() {
    productStreamAdmin = FirebaseFirestore.instance
        .collection("items").orderBy("productionDate",descending: true)
    
      
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
              'All Production',
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
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyProductViewScreen(productData: item,userData: widget.userData),));
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
