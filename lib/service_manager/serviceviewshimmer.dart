// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerServiceViewFirstContainer extends StatelessWidget {
  ShimmerServiceViewFirstContainer({Key? key}) : super(key: key);

  final decoration = BoxDecoration(
    color: Colors.grey,
    borderRadius: BorderRadius.circular(2),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 100,
      minWidth: double.infinity,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      highlightElevation: 0,
      onPressed: () {},
      elevation: .8,
      color: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey),
                        child: const Center(),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 9),
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                  width: 90,
                                  height: 10,
                                  decoration: decoration),
                            ),
                          ),
                          TextButton(
                              onPressed: () async {},
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                    child: Container(
                                        width: 50,
                                        height: 10,
                                        decoration: decoration),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
                PopupMenuButton(
                  padding: const EdgeInsets.all(0),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(13.0),
                    ),
                  ),
                  onSelected: (technician) {},
                  itemBuilder: (BuildContext context) {
                    return List.empty();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Row(
                      children: [
                        Container(
                          width: 80,
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Image.asset(
                'images/qrcodescan.png',
                height: 40,
                width: 40,
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
    );
  }
}
