import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String  name;
  String? phoneNo;
  String? notification;
  String? employeeId;
  String? role;
  String? email;
  String? image;
  String? uid;
  String? status;
  Timestamp? registerDate;

  UserModel(
      {required this.name,
      this.notification,
      this.registerDate,
      this.phoneNo,
      this.employeeId,
      this.role,
      this.email,
      this.image,
      this.status,
      this.uid});

  factory UserModel.fromMap(Map<String, dynamic> map, String id) {
    return UserModel(
      uid: id,
      
      email: map["email"],
      image: map["image"],
      role: map["role"],
      name: map['name'],
      phoneNo: map['phoneNo'],
      registerDate: map["registeredDate"],
      notification: map["notification"]
    );
  }
}
