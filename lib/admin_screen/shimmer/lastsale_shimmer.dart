import 'package:byon_care/constents.dart';
import 'package:byon_care/models/product_model_class.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class LastSaleShimmer extends StatefulWidget {
 const LastSaleShimmer({
    Key? key,
  }) : super(key: key);

  @override
  State<LastSaleShimmer> createState() => _ProductListTileState();
}

class _ProductListTileState extends State<LastSaleShimmer> {
  double selectedColor = 0.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: MaterialButton(
        height: 130,
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 80,
              child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: 70,
                    width: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey),
                  )),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          height: 8,
                          width: 90,
                          color: Colors.grey,
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              height: 4,
                              width: 40,
                              color: Colors.grey,
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              height: 4,
                              width: 40,
                              color: Colors.grey,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              height: 5,
                              width: 90,
                              color: Colors.grey,
                            )),
                        Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              height: 5,
                              width: 70,
                              color: Colors.grey,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                        height: 9,
                        child: Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              height: 8,
                              width: double.infinity,
                              color: Colors.grey,
                            )))
                  ]),
            )
          ],
        ),
        minWidth: double.infinity,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        highlightElevation: 0,
        onPressed: () {},
        elevation: .8,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
    );
  }
}
