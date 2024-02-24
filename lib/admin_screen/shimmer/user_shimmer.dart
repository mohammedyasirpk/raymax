

import 'package:byon_care/constents.dart';
import 'package:byon_care/models/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../../servicess/firebase_services.dart';

class UserShimmerContainer extends StatefulWidget {
   UserShimmerContainer({
    Key? key,
  
  }) : super(key: key);


  @override
  State<UserShimmerContainer> createState() => _ProductListTileState();
}


class _ProductListTileState extends State<UserShimmerContainer> {
  double selectedColor = 0.0;

 



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      child: MaterialButton( 
    
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            
            PopupMenuButton(
              itemBuilder: (context) {
                return [
                   
                    
                    
                    


                ];
                
              },
              child: Shimmer.fromColors(
                       baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,

                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(12))),
                  child:Container(width: 20,color: Colors.grey,)
                ),
              ),
            ),
            Row(
              children: [
                const SizedBox(width: 10,),

             
                SizedBox(
                    width: 80,
                    height: 80,
                    child: Shimmer.fromColors(
                             baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey,
                         
                         
                              
                             ),
                      ),
                    )
                    
                    // : CircleAvatar(child: Image.network(widget.userData!.image!)),
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
                          child: Container(height: 10,width: 90,color: Colors.grey,)),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                          
                            const SizedBox(
                              width: 5,
                            ),
                                  Shimmer.fromColors(
                                           baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                                    child: Container(height: 8,width: 70,color: Colors.grey,)),
                            
                          ],
                        ),
                        SizedBox(height: 6,),
                        Row(
                          children: [
                           
                            const SizedBox(
                              width: 5,
                            ),
                             Shimmer.fromColors(
                                     baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                              child: Container(height: 8,width: 70,color: Colors.grey,)),
                          ],
                        ),
                   
                      ]),
                )
              ],
              
            ),
            const SizedBox(height: 10,)
          ],
        ),
        minWidth: double.infinity,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        highlightElevation: 0,
        onPressed: () {},
        elevation: .8,
        color: Colors.white,
        padding: const EdgeInsets.only(left: 0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
    );
  }
}
