import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/usermodel.dart';

class UserRepo {
  UserRepo._internal();
  static UserRepo instance = UserRepo._internal();
  factory UserRepo() {
    return instance;
  }

  Future<List<UserModel>> getAllUsers() async {
    List<UserModel> usersList = [];

    final users = await FirebaseFirestore.instance.collection("users").get();

    for (var user in users.docs) {
      var userData = user.data();
      var model = UserModel(
        employeeId: user.id,
        phoneNo: userData["phoneno"],
        email: userData["email"],
        name: userData["name"],
        role: userData["role"],
      );
      usersList.add(model);
    }
    return usersList;
  }

  Future<List<UserModel>> getAllDealers() async {
    List<UserModel> usersList = [];
    final users = await FirebaseFirestore.instance
        .collection("users")
        .where("role", isEqualTo: "dealer")
        .get();

    for (var user in users.docs) {
      var userData = user.data();
      var model = UserModel(
        employeeId: user.id,
        phoneNo: userData["phoneno"] ,
        email: userData["email"] ,
        name: userData["name"] ,
        role: userData["role"] ,
      );
      usersList.add(model);
    }
    return usersList;
  }

  Future<List<UserModel>> getAllServies() async {
    List<UserModel> usersList = [];
    final users = await FirebaseFirestore.instance
        .collection("users")
        .where("role", isEqualTo: "service")
        .get();

    for (var user in users.docs) {
      var userData = user.data();
      var model = UserModel(
        employeeId: user.id,
        phoneNo: userData["phoneno"] ?? "N/A",
        email: userData["email"] ?? "N/A",
        name: userData["name"] ?? "N/A",
        role: userData["role"] ?? "User",
      );
      usersList.add(model);
    }
    return usersList;
  }

  Future<List<UserModel>> getProduction() async {
    List<UserModel> usersList = [];
    final users = await FirebaseFirestore.instance
        .collection("users")
        .where("role", isEqualTo: "production")
        .get();

    for (var user in users.docs) {
      var userData = user.data();
      var model = UserModel(
        employeeId: user.id,
        phoneNo: userData["phoneno"] ?? "N/A",
        email: userData["email"] ?? "N/A",
        name: userData["name"] ?? "N/A",
        role: userData["role"] ?? "User",
      );
      usersList.add(model);
    }
    return usersList;
  }

  Future<List<UserModel>> getAllAdmin() async {
    List<UserModel> usersList = [];
    final users = await FirebaseFirestore.instance
        .collection("users")
        .where("role", isEqualTo: "admin")
        .get();

    for (var user in users.docs) {
      var userData = user.data();
      var model = UserModel(
        employeeId: user.id,
        phoneNo: userData["phoneno"] ?? "N/A",
        email: userData["email"] ?? "N/A",
        name: userData["name"] ?? "N/A",
        role: userData["role"] ?? "User",
      );
      usersList.add(model);
    }
    return usersList;
  }

  Future<void> updateRole({required String role, required String docid}) async {
    try {
      final user = FirebaseFirestore.instance.collection("users").doc(docid);
      user.update({"role": role});
    } on FirebaseException catch (e) {
      print("error while updating role $e");
    }
  }

  // Future<List<UserModel>> searchItems(String searchedItem) async {
  //   List<UserModel> userList = [];
  //   List<UserModel> filteredList = [];

  //   userList = await getAllUsers();

  //   for (var item in userList) {
  //     if (item.name == searchedItem) {
  //       filteredList.add(item);
  //     }
  //   }
  //   return filteredList;

    
  // }
}
