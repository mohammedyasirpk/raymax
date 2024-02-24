// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors
import 'package:byon_care/admin_screen/helper/capitalized.dart';
import 'package:byon_care/customerr_screen/helper/getGraphvalue.dart';
import 'package:byon_care/models/graph_value_model.dart';
import 'package:byon_care/models/product_model_class.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductListTile extends StatefulWidget {
  ProductListTile({
    Key? key,
    required this.productData, required this.onPressed,
  }) : super(key: key);

  final ProductModel? productData;
  final VoidCallback onPressed;

  @override
  State<ProductListTile> createState() => _ProductListTileState();
}

class _ProductListTileState extends State<ProductListTile> {
  double selectedColor = 0.0;

  GraphValueModel? graphdata;

  @override
  void initState() {
    graphdata = getGraphValue(
        purchaseDate: widget.productData?.purchaseDateTime,
        warranty: widget.productData?.warranty ?? 0,additionalWarranty: widget.productData?.additionalWarranty?? 0);
    super.initState();
  }

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
                child: widget.productData?.imageUrl == null
                    ? Image.asset(
                        "images/5357829_prev.jpg",
                      )
                    : CachedNetworkImage(
                        imageUrl: widget.productData!.imageUrl!)),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(capitalizeFirstLetter(widget.productData?.productName ?? " Not Available",),
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.black)),
                    const SizedBox(
                      height: 5,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: widget.productData?.modalName ?? "",
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const TextSpan(
                            text: "  ", // Add space here
                            style: TextStyle(
                              // Adjust space width here
                              letterSpacing: 2.0,
                            ),
                          ),
                          TextSpan(
                            text: widget.productData?.qrId ?? "",
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "WARRANTY EXPIRY",
                        ),
                        Text(
                          "${(widget.productData?.warranty ?? 0) + (widget.productData?.additionalWarranty ?? 0)} Months",
                          style: TextStyle(
                            color: Color(0xff777676),
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                   widget.productData?.purchaseDateTime == null ? SizedBox()  :   Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                            height: 9,
                            child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                              child: LinearProgressIndicator(
                                value: (graphdata?.warrantyValue ?? 0) + (graphdata?.additionalWarranty ?? 0),
                                backgroundColor: Colors.grey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10),
                                color: graphdata?.warrantyColor,
                              ),
                            )),
                      ],
                    )
                  ]),
            )
          ],
        ),
        minWidth: double.infinity,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        highlightElevation: 0,
        onPressed:widget. onPressed,
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
