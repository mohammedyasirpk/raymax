import 'package:byon_care/constents.dart';
import 'package:byon_care/widgets/bloodtestresults.dart';
import 'package:flutter/material.dart';

Future fastingsugarpopup(context) async {
  return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          // backgroundColor: Colors.transparent,
          insetPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          // titlePadding: EdgeInsets.all(0.0),

          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            padding: const EdgeInsets.only(top: 21, bottom: 21),
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 41,
                      ),
                      const Text(
                        'Fasting Blood Sugar',
                        style: TextStyle(
                            color: Color(0XFF000000),
                            fontSize: 20,
                            fontFamily: kfontPoppinsRegular),
                      ),
                      Container(
                        height: 24,
                        width: 41,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            border: Border.all(color: kbyoncolor10, width: 1)),
                        child: const Center(
                          child: Text(
                            'mg/dL',
                            style: TextStyle(
                                color: kbyoncolor10,
                                fontSize: 11,
                                fontFamily: 'Rubik'),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Text(
                            'Normal',
                            style: TextStyle(
                                color: kbyoncolor11,
                                fontSize: 13,
                                fontFamily: kfontPoppinsBold),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                color: kbyoncolor12,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            height: 5,
                            width: 80,
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          const Text(
                            '70 - 110',
                            style: TextStyle(
                                fontSize: 13,
                                color: kbyoncolor11,
                                fontFamily: kfontPoppinsBold),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            'Pre-Diabetic',
                            style: TextStyle(
                                color: kbyoncolor11,
                                fontSize: 13,
                                fontFamily: kfontPoppinsBold),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                color: kbyoncolor13,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            height: 5,
                            width: 80,
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          const Text(
                            '111 - 130',
                            style: TextStyle(
                                fontSize: 13,
                                color: kbyoncolor11,
                                fontFamily: kfontPoppinsBold),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            'Diabetic',
                            style: TextStyle(
                                color: kbyoncolor11,
                                fontSize: 13,
                                fontFamily: kfontPoppinsBold),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                color: kbyoncolor14,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            height: 5,
                            width: 80,
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          const Text(
                            '131 +',
                            style: TextStyle(
                                fontSize: 13,
                                color: kbyoncolor11,
                                fontFamily: kfontPoppinsBold),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Doteline(),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 41,
                      ),
                      const Text(
                        'Random Blood Sugar',
                        style: TextStyle(
                            color: Color(0XFF000000),
                            fontSize: 20,
                            fontFamily: kfontPoppinsRegular),
                      ),
                      Container(
                        height: 24,
                        width: 41,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            border: Border.all(color: kbyoncolor10, width: 1)),
                        child: const Center(
                          child: Text(
                            'mg/dL',
                            style: TextStyle(
                                color: kbyoncolor10,
                                fontSize: 11,
                                fontFamily: kfontPoppinsRegular),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Text(
                            'Normal',
                            style: TextStyle(
                                color: kbyoncolor11,
                                fontSize: 13,
                                fontFamily: kfontPoppinsBold),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                color: kbyoncolor12,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            height: 5,
                            width: 80,
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          const Text(
                            '< 140',
                            style: TextStyle(
                                fontSize: 13,
                                color: kbyoncolor11,
                                fontFamily: kfontPoppinsBold),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            'Pre-Diabetic',
                            style: TextStyle(
                                color: kbyoncolor11,
                                fontSize: 13,
                                fontFamily: kfontPoppinsBold),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                color: kbyoncolor13,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            height: 5,
                            width: 80,
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          const Text(
                            '141 - 199',
                            style: TextStyle(
                                fontSize: 13,
                                color: kbyoncolor11,
                                fontFamily: kfontPoppinsBold),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            'Diabetic',
                            style: TextStyle(
                                color: kbyoncolor11,
                                fontSize: 13,
                                fontFamily: kfontPoppinsBold),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                color: kbyoncolor14,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            height: 5,
                            width: 80,
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          const Text(
                            '200 +',
                            style: TextStyle(
                                fontSize: 13,
                                color: kbyoncolor11,
                                fontFamily: kfontPoppinsBold),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Doteline(),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 41,
                      ),
                      const Text(
                        'HBA1C',
                        style: TextStyle(
                            color: Color(0XFF000000),
                            fontSize: 20,
                            fontFamily: kfontPoppinsRegular),
                      ),
                      Container(
                        height: 24,
                        width: 41,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            border: Border.all(color: kbyoncolor10, width: 1)),
                        child: const Center(
                          child: Text(
                            '%',
                            style: TextStyle(
                                color: kbyoncolor10,
                                fontSize: 11,
                                fontFamily: kfontPoppinsRegular),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Text(
                            'Normal',
                            style: TextStyle(
                                color: kbyoncolor11,
                                fontSize: 13,
                                fontFamily: kfontPoppinsBold),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                color: kbyoncolor12,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            height: 5,
                            width: 80,
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          const Text(
                            '< 5.7',
                            style: TextStyle(
                                fontSize: 13,
                                color: kbyoncolor11,
                                fontFamily: kfontPoppinsBold),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            'Pre-Diabetic',
                            style: TextStyle(
                                color: kbyoncolor11,
                                fontSize: 13,
                                fontFamily: kfontPoppinsBold),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                color: kbyoncolor13,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            height: 5,
                            width: 80,
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          const Text(
                            '5.8 - 6.4',
                            style: TextStyle(
                                fontSize: 13,
                                color: kbyoncolor11,
                                fontFamily: kfontPoppinsBold),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            'Diabetic',
                            style: TextStyle(
                                color: kbyoncolor11,
                                fontSize: 13,
                                fontFamily: kfontPoppinsBold),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                color: kbyoncolor14,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            height: 5,
                            width: 80,
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          const Text(
                            '6.5 +',
                            style: TextStyle(
                                fontSize: 13,
                                color: kbyoncolor11,
                                fontFamily: kfontPoppinsBold),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 43, right: 43),
                  child: const Text(
                    "Please consult a medical practitioner for any final decisions and "
                    "medications.",
                    style:
                        TextStyle(fontFamily: kfontPoppinsMedium, fontSize: 10),
                  ),
                )
              ],
            ),
          ),
        );
      });
}
