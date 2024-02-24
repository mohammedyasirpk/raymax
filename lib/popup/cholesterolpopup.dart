import 'package:byon_care/constents.dart';
import 'package:byon_care/widgets/bloodtestresults.dart';
import 'package:flutter/material.dart';

Future cholesterolpopup(context) {
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
                const SizedBox(
                  height: 10.0,
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
                        'Cholesterol',
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
                            '< 200',
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
                            'Borderline Risk',
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
                            '201 - 239',
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
                            'High Risk',
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
                            '239 +',
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
                        'Triglycerides',
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
                            '< 150',
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
                            'Borderline High',
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
                            '151 - 199',
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
                            'High Risk',
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
                        'HDL - Male',
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
                            '55 +',
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
                            'Borderline Risk',
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
                            '54 - 35',
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
                            'High Risk',
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
                            '< 34',
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
                  height: 15,
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
                        'HDL - Female',
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
                            '65 +',
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
                            'Borderline Risk',
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
                            '64 - 45',
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
                            'High Risk',
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
                            '< 44',
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
                  height: 10.0,
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
                        'LDL',
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
                            '< 100',
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
                            'Borderline Risk',
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
                            '101 - 150',
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
                            'High Risk',
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
                            '150 +',
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
