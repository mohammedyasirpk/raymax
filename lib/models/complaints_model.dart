import 'package:byon_care/models/product_model_class.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ComplaintModel {
  String? id;

  String? qrId;
  String? complaints;
  String? address;
  String? phoneNo;
  String? name;
  String? status;
  String? uid;
  Timestamp? registerDate;
  String? component;
  String? technicianId;
  String? technicianName;
  int? servicecharges;
  ProductModel? productData;
  Timestamp? closedDate;

  ComplaintModel(
      {this.id,
      this.qrId,
      this.complaints,
      this.address,
      this.name,
      this.phoneNo,
 
      this.status,
      this.uid,
      this.component,
      this.registerDate,
      this.technicianId,
      this.technicianName,

      this.servicecharges,
      this.productData,
      this.closedDate});

  factory ComplaintModel.fromMap(Map<String, dynamic> map, String id,String? productId) {
    return ComplaintModel(
        productData: ProductModel.fromMap(map, productId),
        
        qrId: map['qrCode'],
        complaints: map['complaints'],
        address: map['address'],
        name: map['name'],
        phoneNo: map['phoneNo'],
        status: map['status'],
        component: map['component'],
        registerDate: map['registerDate'],
        id: id,
        technicianId: map['technicianId'],
        technicianName: map['technicianName'],
        servicecharges: map['servicecharges'],
        closedDate: map['closedDate']);
  }
}
