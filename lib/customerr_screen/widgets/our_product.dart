import 'package:byon_care/admin_screen/helper/capitalized.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/product_model_class.dart';
import '../helper/warrenty_year.dart';

class OurProductTile extends StatelessWidget {
  const OurProductTile(
      {Key? key, this.onPress, this.onLongPress, this.productData})
      : super(key: key);

  final ProductModel? productData;

  final VoidCallback? onLongPress;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 200,
      child: MaterialButton(
        onPressed: onPress,
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.topRight,
                fit: StackFit.expand,
                children: [
                  productData?.imageUrl == null
                      ? Image.asset(
                          "images/5357829_prev.jpg",
                        )
                      : CachedNetworkImage(imageUrl: productData!.imageUrl!),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child:  getWarrantyYear(warrenty: productData?.warranty?? 0,additionalWarranty: productData?.additionalWarranty?? 0,widthDecidingValue: true)
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(capitalizeFirstLetter(productData?.productName ?? "no product available",),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Colors.black)),
                  const SizedBox(
                    height: 1,
                  ),
                  Text(
                    productData?.modelList == null
                        ? "not available"
                        : "${productData!.modelList!.join(",").toUpperCase()},",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.star_rate_rounded,
                        color: Colors.green,
                        size: 18,
                      ),
                      Icon(
                        Icons.star_rate_rounded,
                        color: Colors.green,
                        size: 18,
                      ),
                      Icon(
                        Icons.star_rate_rounded,
                        color: Colors.green,
                        size: 18,
                      ),
                      Icon(
                        Icons.star_rate_rounded,
                        color: Colors.green,
                        size: 18,
                      ),
                      Icon(
                        Icons.star_rate_rounded,
                        color: Colors.green,
                        size: 18,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ]),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Image.asset(
                    "images/Picsart_24-02-12_12-34-37-933.png",
                    width: 20,
                  ),
                ),
              ],
            )
          ],
        ),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        highlightElevation: 0,
        onLongPress: onLongPress,
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
