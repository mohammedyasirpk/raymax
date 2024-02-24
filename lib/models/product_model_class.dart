// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class ProductModel {
  String? dealerName;
  String? dealerId;

  String? description;
  List<String>? modelList;
  int? additionalWarranty;
   String? productName;
  String? modalName;
  String? colours;
  int? warranty;
  Timestamp? productionDate;
  String? qrId;
  String? docId;
  String? customername;
  String? email;
  String? imageUrl;
  Timestamp? purchaseDateTime;

  ProductModel(
      {this.description,
      this.modelList,
      this.additionalWarranty,
      this.purchaseDateTime,
      this.productName,
      this.modalName,
      this.colours,
      this.warranty,
      this.productionDate,
      this.dealerId,
      this.customername,
      this.dealerName,
      this.email,
      this.qrId,
      this.imageUrl,
      this.docId});

  factory ProductModel.fromMap(Map<String, dynamic> map, String? id) {
    return ProductModel(
      modelList:
          ((map["modelList"] as List?) ?? []).map((e) => e as String).toList(),
      additionalWarranty: map["additionalwarranty"] as int?,
      imageUrl: map["imageUrl"],
      description: map["description"],
      purchaseDateTime: map["purchaseDate"],
      qrId: map['qrCode'],
      productName: map['productName'],
      modalName: map['modelName'],
      colours: map['colours'],
      warranty: map['warranty'] as int?,
      dealerName: map["dealerName"],
      productionDate: map['productionDate'],
      dealerId: map["dealerId"],
      customername: map['customerName'],
      
      email: map['email'],
      docId: id,
    );
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;

    return other.docId == docId && other.qrId == qrId;
  }

  @override
  int get hashCode {
    return docId.hashCode;
  }
}
