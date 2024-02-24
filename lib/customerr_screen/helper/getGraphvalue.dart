import 'package:byon_care/models/graph_value_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

GraphValueModel? getGraphValue(
    {required Timestamp? purchaseDate,
    required int warranty,
    int additionalWarranty = 0}) {
  if (purchaseDate == null) {
    return null;
  }
  DateTime now = DateTime.now();
  DateTime date = DateTime(now.year, now.month, now.day);

  DateTime purchaseDateToDate = purchaseDate.toDate();

  Duration duration = date.difference(purchaseDateToDate);

  double months = duration.inDays / 30;

  double warrantyValue = (months / (warranty / 100)) / 100;
  //////////
  DateTime additionalWarrantyStartAt =
      purchaseDateToDate.add(Duration(days: duration.inDays));
  Duration additionalWarrantyDuration =
      date.difference(additionalWarrantyStartAt);
  double additionalWarrantyMonth = additionalWarrantyDuration.inDays / 30;

  double additionalWarrantyValue =
      (additionalWarrantyMonth / ((additionalWarranty) / 100)) / 100;
  if (additionalWarranty == 0) {
    additionalWarrantyValue = 0;
  }
   if (warranty == 0) {
    warrantyValue
     = 0;
  }

  Color warrantyColor;

  if (warrantyValue < 0.5) {
    warrantyColor = Colors.green;
  } else if (warrantyValue < 1) {
    warrantyColor = Colors.yellow;
  } else {
    warrantyColor = Colors.red;
  }

  Color additionalWarrantyColor;

  if (additionalWarrantyValue < 0.5) {
    additionalWarrantyColor = Colors.green;
  } else if (warrantyValue < 1) {
    additionalWarrantyColor = Colors.yellow;
  } else {
    additionalWarrantyColor = Colors.red;
  }

  return GraphValueModel(
      additionalWarranty: additionalWarrantyValue,
      warrantyValue: warrantyValue,
      warrantyColor: warrantyColor,
      additionalWarrantyColor: additionalWarrantyColor);
}
