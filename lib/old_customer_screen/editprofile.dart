// ignore_for_file: avoid_print, prefer_const_constructors
import 'dart:io';
import 'package:byon_care/constents.dart';
import 'package:byon_care/dealer/screen_dealer%20copy.dart';
import 'package:byon_care/models/usermodel.dart';
import 'package:byon_care/services/showmassege.dart';
import 'package:byon_care/servicess/firestore_services.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile(
      {Key? key,
      required this.name,
      required this.email,
      required this.phoneNo,
      required this.image})
      : super(key: key);

  final String name;
  final String email;
  final String phoneNo;
  final String image;

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final ImagePicker _picker = ImagePicker();
  File? _photo;

  String? imageUrl;
  String? image;
  @override
  void initState() {
    image = widget.image;
    super.initState();
    _loadProfileImage();
  }

  void _loadProfileImage() {
    setState(() {
      _photo = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: widget.name);
    final emailController = TextEditingController(text: widget.email);
    final phonenoController = TextEditingController(text: widget.phoneNo);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Edit Profile',
          style: TextStyle(
            fontFamily: kfontPoppinsMedium,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black, size: 23),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: Stack(
                children: [
                  // ignore: unnecessary_null_comparison
                  if (image != null && image!.isNotEmpty)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        image!,
                        width: 100,
                        height: 100,
                        fit: BoxFit.fill,
                      ),
                    )
                  else
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(50),
                      ),
                      width: 100,
                      height: 100,
                      child: Icon(
                        Icons.person,
                        size: 60,
                        color: Colors.grey[800],
                      ),
                    ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: InkWell(
                      onTap: () {
                        showPicker(context);
                      },
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: kbyoncolor3,
                        child: Icon(
                          Icons.camera_alt_outlined,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0XFF8E8E93).withOpacity(.12),
                borderRadius: const BorderRadius.all(Radius.circular(22.0)),
              ),
              child: Center(
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 15),
                    prefixIcon: Icon(Icons.person),
                    hintText: 'Name',
                    helperStyle: TextStyle(
                      color: const Color(0XFF919192).withOpacity(.40),
                      fontSize: 17,
                      fontFamily: kfontPoppinsRegular,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0XFF8E8E93).withOpacity(.12),
                borderRadius: const BorderRadius.all(Radius.circular(22.0)),
              ),
              child: Center(
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 15),
                    prefixIcon: Icon(Icons.email_outlined),
                    hintText: 'Email',
                    helperStyle: TextStyle(
                      color: const Color(0XFF919192).withOpacity(.40),
                      fontSize: 17,
                      fontFamily: kfontPoppinsRegular,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0XFF8E8E93).withOpacity(.12),
                borderRadius: const BorderRadius.all(Radius.circular(22.0)),
              ),
              child: Center(
                child: TextField(
                  controller: phonenoController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 15),
                    prefixIcon: Icon(Icons.phone),
                    hintText: 'PhoneNo',
                    helperStyle: TextStyle(
                      color: const Color(0XFF919192).withOpacity(.40),
                      fontSize: 17,
                      fontFamily: kfontPoppinsRegular,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              width: 230,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                  backgroundColor: kbyoncolor3,
                ),
                onPressed: () {
                  UserModel updatedUser = UserModel(
                      name: nameController.text,
                      email: emailController.text,
                      phoneNo: phonenoController.text,
                      image: image);
                  // FirestoreServices()
                  //     .editProfile(userModel: updatedUser, uid: currentuserId);
                  // showmassege('Edited Successfully');
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Text(
                  'Edit Profile',
                  style:
                      TextStyle(fontFamily: kfontPoppinsMedium, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showPicker(context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(
                  Icons.photo_library,
                  color: Colors.black,
                ),
                title: Text(
                  'Gallery',
                  style: TextStyle(fontFamily: kfontPoppinsMedium),
                ),
                onTap: () {
                  imgFromGallery(context);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.photo_camera,
                  color: Colors.black,
                ),
                title: Text(
                  'Camera',
                  style: TextStyle(fontFamily: kfontPoppinsMedium),
                ),
                onTap: () {
                  imgFromCamera(context);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future imgFromGallery(context) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
        uploadFile(_photo!);
      } else {
        print('No image selected.');
      }
    });
  }

  Future imgFromCamera(context) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
        uploadFile(_photo!);
      } else {
        print('No image selected.');
      }
    });
  }

  Future uploadFile(File photo) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference storageReference =
          FirebaseStorage.instance.ref().child('profile_images/$fileName');
      UploadTask uploadTask = storageReference.putFile(photo);
      await uploadTask.whenComplete(() async {
        String url = await storageReference.getDownloadURL();
        setState(() {
          imageUrl = url;
          image = url;
        });

        print('File Uploaded. URL: $url');
      });
    } catch (e) {
      print('Error uploading file: $e');
    }
  }
}
