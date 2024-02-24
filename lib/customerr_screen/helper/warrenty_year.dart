import 'package:flutter/material.dart';

Widget getWarrantyYear(
    {required int warrenty,
    required int additionalWarranty,
    required bool widthDecidingValue}) {
  final totalWarranty = warrenty + additionalWarranty;

  if (totalWarranty == 96) {
    return Image.asset(
      "images/Warranty8years .png",
      width: widthDecidingValue ? 40 : 60,
    );
  } else if (totalWarranty == 12) {
    return Image.asset(
      "images/Warranty1year.png",
      width: widthDecidingValue ? 40 : 60,
    );
  } else if (totalWarranty == 12 * 2) {
    return Image.asset(
      "images/Warranty2year.png",
      width: widthDecidingValue ? 40 : 60,
    );
  } else if (totalWarranty == 12 * 3) {
    return Image.asset(
      "images/Warranty3year.png",
      width: widthDecidingValue ? 40 : 60,
    );
  } else if (totalWarranty == 48) {
    return Image.asset(
      "images/Warranty4year.png",
      width: widthDecidingValue ? 40 : 60,
    );
  } else if (totalWarranty == 12 * 6) {
    return Image.asset(
      "images/Warranty6year.png",
      width: widthDecidingValue ? 40 : 60,
    );
  } else if (totalWarranty == 12 * 7) {
    return Image.asset(
      "images/Warranty7year.png",
      width: widthDecidingValue ? 40 : 60,
    );
  } else if (totalWarranty == 12 * 8) {
    return Image.asset(
      "images/Warranty8years .png",
      width: widthDecidingValue ? 40 : 60,
    );
  } else if (totalWarranty == 108) {
    return Image.asset(
      "images/Warranty9years .png",
      width: widthDecidingValue ? 40 : 60,
    );
  } else if (totalWarranty == 120) {
    return Image.asset(
      "images/Warranty10years .png",
      width: widthDecidingValue ? 40 : 60,
    );
  } else if (totalWarranty == 180) {
    return Image.asset(
      "images/Warranty15years .png",
      width: widthDecidingValue ? 40 : 60,
    );
  } else if (totalWarranty == 240) {
    return Image.asset(
      "images/Warranty20years .png",
      width: widthDecidingValue ? 40 : 60,
    );
  } else if (totalWarranty == 288) {
    return Image.asset(
      "images/Warranty24years .png",
      width: widthDecidingValue ? 40 : 60,
    );
  } else if (totalWarranty == 25 * 12) {
    return Image.asset(
      "images/Warranty25years .png",
      width: widthDecidingValue ? 40 : 60,
    );
  } else if (totalWarranty == 60) {
    return Image.asset(
      "images/5 year warranty.png",
      width: widthDecidingValue ? 40 : 60,
    );
  } else {
    return Image.asset(
      "images/Picsart_24-02-12_12-34-37-933.png",
      width: 40,
    );
  }
}
