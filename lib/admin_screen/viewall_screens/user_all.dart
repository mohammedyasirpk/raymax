import 'dart:developer';

import 'package:byon_care/constants/string_constant.dart';
import 'package:byon_care/models/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../constents.dart';
import '../../screen/userview_screens.dart/screen_admin_userview.dart.dart';
import '../shimmer/user_shimmer.dart';
import '../user/edit_user_screen.dart';
import '../widgets/user_container.dart';

class ScreenUserViewAll extends StatefulWidget {
  const ScreenUserViewAll({
    Key? key,
  }) : super(key: key);

  @override
  State<ScreenUserViewAll> createState() => _ScreenUserViewAllState();
}

class _ScreenUserViewAllState extends State<ScreenUserViewAll> {
  late ScrollController _scrollCtrl;

  bool _isLoading = false;
  List<UserModel> userList = [];
  DocumentSnapshot? lastDoc;
  String? selectedRole;
  bool isLast = false;

  @override
  void initState() {
    super.initState();
    _scrollCtrl = ScrollController();
    _scrollCtrl.addListener(_scrollListener);
    _isLoading = true;
    getProductsList(selectedRole);
  }

  @override
  void dispose() {
    _scrollCtrl.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    final isAlmostEnded = _scrollCtrl.position.pixels >
        (0.80 * _scrollCtrl.position.maxScrollExtent);
    if (isAlmostEnded && !_isLoading) {
      getProductsList(selectedRole);
    }
  }

  Future<void> getProductsList(String? role) async {
    if (role != selectedRole) {
      lastDoc = null;
      userList.clear();
      isLast = false;
    }

    if (isLast) {
      return;
    }

    selectedRole = role;
    late QuerySnapshot<Map<String, dynamic>> firebaseData;

    setState(() => _isLoading = true);

    try {
      firebaseData = await (lastDoc == null
          ? FirebaseFirestore.instance
              .collection("users")
              .where("role", isEqualTo: selectedRole)
              .orderBy('registeredDate', descending: true)
              .limit(10)
              .get()
          : FirebaseFirestore.instance
              .collection("users")
              .where("role", isEqualTo: selectedRole)
              .orderBy('registeredDate', descending: true)
              .startAfterDocument(lastDoc!)
              .limit(10)
              .get());

      if (firebaseData.docs.isNotEmpty) {
        lastDoc = firebaseData.docs.last;
      } else {
        isLast = true;
      }

      if (firebaseData.docs.length < 10) {
        isLast = true;
      }

      for (var element in firebaseData.docs) {
        UserModel user = UserModel.fromMap(element.data(), element.id);
        userList.add(user);
      }
    } catch (error) {
      // Handle error gracefully, such as showing a snackbar or retry option
      log('Error fetching data: $error');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kbyoncolor3,
        title: const Text(
          'Users',
          style: TextStyle(
            color: Colors.white,
            fontFamily: kfontPoppinsSemiBold,
            fontSize: 22,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            SizedBox(
              height: 35,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 11),
                scrollDirection: Axis.horizontal,
                children: [
                  buildRoleFilter(null, 'All Users'),
                  buildRoleFilter(kdealer, 'Dealers'),
                  buildRoleFilter(ktechnician, 'Technician'),
                  buildRoleFilter(kproduction, 'Production'),
                  buildRoleFilter(kserviceManager, 'Service Manager'),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: _isLoading
                  ? buildLoadingList()
                  : userList.isNotEmpty
                      ? buildUserList()
                      : buildNoServicesAvailable(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRoleFilter(String? role, String label) {
    return InkWell(
      onTap: () {
        getProductsList(role);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: selectedRole == role ? kbyoncolor3 : Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontFamily: kfontPoppinsMedium,
              fontSize: 14,
              color: selectedRole == role ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLoadingList() {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) => UserShimmerContainer(),
      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10),
      itemCount: 10,
    );
  }

  Widget buildUserList() {
    return ListView.separated(
      controller: _scrollCtrl,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        UserModel user = userList[index];
        return UserContainer(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserDetailsViewScreen(userData: user),
            ),
          ),
          userData: user,
          onLongPress: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditUserScreen(userData: user),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10),
      itemCount: userList.length,
    );
  }

  Widget buildNoServicesAvailable() {
    return const Center(
      child: Text(
        'No Services available',
        style: TextStyle(fontSize: 15, fontFamily: kfontPoppinsMedium),
      ),
    );
  }
}
