import 'package:byon_care/constents.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../../models/product_model_class.dart';

class OurProductShimmer extends StatelessWidget {
   OurProductShimmer(
      {Key? key,
    
      })
      : super(key: key);

  



  
  final decoration = BoxDecoration(
    color: Colors.grey,
    borderRadius: BorderRadius.circular(2),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 200,
      child: MaterialButton(
        onPressed: () {
        },
        
        
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                        Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                          child: Container(
                                width: double.infinity, height: 100, decoration:decoration ),
                        ),
                    
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
                
                  const SizedBox(
                    height: 1,
                  ),
                  Column(
                    children: [
                        Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                          child: Container(
                                width: 80, height: 10, decoration:decoration ),
                        ),
                                const SizedBox(
                    height: 15,
                  ),
                      Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                        child: Container(
                                    width: 80, height: 5, decoration:decoration ),
                      ),
                    ],
                  ),
                        
                  const SizedBox(
                    height: 5,
                  ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.star_rate_rounded,
                          color: Colors.grey,
                          size: 18,
                        ),
                        Icon(
                          Icons.star_rate_rounded,
                          color: Colors.grey,
                          size: 18,
                        ),
                        Icon(
                          Icons.star_rate_rounded,
                          color: Colors.grey,
                          size: 18,
                        ),
                        Icon(
                          Icons.star_rate_rounded,
                          color: Colors.grey,
                          size: 18,
                        ),
                        Icon(
                          Icons.star_rate_rounded,
                          color: Colors.grey,
                          size: 18,
                        ),
                     
                      
                      ],
                    ),
                  const SizedBox(
                    height: 10,
                  ),
                ]),
              
              ],
            )
          ],
        ),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        highlightElevation: 0,
     
       
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
