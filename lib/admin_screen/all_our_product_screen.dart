import 'package:byon_care/constants/string_constant.dart';
import 'package:byon_care/models/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../customerr_screen/widgets/our_product.dart';
import '../models/product_model_class.dart';
import 'add_our_product.dart';
import 'package:byon_care/constents.dart';

import 'ourproduct/our_product_details.dart';
import 'shimmer/our_product_shimmer.dart';

class AdminAllOurProducts extends StatefulWidget {
  const AdminAllOurProducts({Key? key, required this.userdata})
      : super(key: key);

  final UserModel userdata;

  @override
  _AdminAllOurProductsState createState() => _AdminAllOurProductsState();
}

class _AdminAllOurProductsState extends State<AdminAllOurProducts> {
  late ScrollController _scrollController;
  late List<ProductModel> _listOfproductModel;
  late bool _isLoading;
  late QueryDocumentSnapshot<Map<String, dynamic>>? _lastDocument;
  final int _perPage = 12;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _listOfproductModel = [];
    _isLoading = false;
    _lastDocument = null;
    _getProducts();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getProducts();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _getProducts() async {
    if (!_isLoading) {
      setState(() {
        _isLoading = true;
      });

      QuerySnapshot<Map<String, dynamic>> querySnapshot;
      if (_lastDocument != null) {
        querySnapshot = await FirebaseFirestore.instance
            .collection("ourProduct")
            .startAfterDocument(_lastDocument!)
            .limit(_perPage)
            .get();
      } else {
        querySnapshot = await FirebaseFirestore.instance
            .collection("ourProduct")
            .limit(_perPage)
            .get();
      }

      if (querySnapshot.docs.isNotEmpty) {
        _lastDocument = querySnapshot.docs.last;
        for (var item in querySnapshot.docs) {
          final product = item.data();

          final ProductModel model = ProductModel.fromMap(product, item.id);

          _listOfproductModel.add(model);
        }
      }

      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: widget.userdata.role == kadmin ?FloatingActionButton(
        backgroundColor: kbyoncolor3,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddOurProductAdmin(),
              ));
        },
      ):const SizedBox(),
      appBar: AppBar(
        backgroundColor: kbyoncolor3,
        elevation: 0,
        title: const Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            'All Our Products',
            style: TextStyle(
              color: Colors.white,
              fontFamily: kfontPoppinsSemiBold,
              fontSize: 22,
            ),
          ),
        ),
      ),
      body: _listOfproductModel.isEmpty && _isLoading
          ? GridView.builder(
            
              controller: _scrollController,
              itemCount: 10,
              padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(bottom: 10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return OurProductShimmer();
              },
            )
          : Padding(
              padding: const EdgeInsets.only(top: 10).copyWith(bottom: 5),
              child: GridView.builder(
                controller: _scrollController,
                itemCount: _listOfproductModel.length,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return OurProductTile(
                    onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OurProductDetailScreen(
                              userData: widget. userdata,
                                productData: _listOfproductModel[index]),
                          ));
                    },
                    productData: _listOfproductModel[index],
                    onLongPress: () {
                    if(widget.userdata.role == kadmin){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddOurProductAdmin(
                                productData: _listOfproductModel[index]),
                          ));
                    }
                    }
                  );
                },
              ),
            ),
    );
  }
}
