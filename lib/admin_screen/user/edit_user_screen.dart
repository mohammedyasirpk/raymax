import 'dart:io';

import 'package:byon_care/models/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../constents.dart';
import '../../repository/topsnackbar.dart';
import '../../service_manager/dropdowntextfield.dart';
import '../../servicess/firebase_services.dart';
import '../../servicess/firestore_services.dart';

class EditUserScreen extends StatefulWidget {
  const EditUserScreen({Key? key, this.userData}) : super(key: key);

  final UserModel? userData;

  @override
  State<EditUserScreen> createState() => _EditUserScreenState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

final FirestoreServices firestoreServices = FirestoreServices();

class _EditUserScreenState extends State<EditUserScreen> {
  late TextEditingController userNameController;
  late TextEditingController userPhoneNumberController;

  final ImagePicker _picker = ImagePicker();
  File? _photo;

  String? dropDownValue;
  // String? imageUrl;
  String? image;
  bool isimageLoading = false;

  final FirebaseServices firebaseServices = FirebaseServices();
  @override
  void initState() {
    image = widget.userData?.image;
    dropDownValue = widget.userData?.role;

    userNameController =
        TextEditingController(text: widget.userData?.name ?? "");
    userPhoneNumberController =
        TextEditingController(text: widget.userData?.phoneNo ?? "");

    super.initState();
  }

  @override
  void dispose() {
    userNameController.dispose();
    userPhoneNumberController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kbyoncolor3,
          elevation: 0,
          title: const Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              'Edit User',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: kfontPoppinsSemiBold,
                  fontSize: 22),
            ),
          )),
      body: Column(children: [
        Expanded(
          child: ListView(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              const Text(
                                "Profile Pic",
                                style: TextStyle(
                                    fontFamily: kfontPoppinsRegular,
                                    fontSize: 16),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  showPicker(context);
                                },
                                child: Stack(
                                  children: [
                                    // ignore: unnecessary_null_comparison

                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: kbyoncolor3, width: 2),
                                        image: isimageLoading == false
                                            ? (image != null &&
                                                    image!.isNotEmpty &&
                                                    widget.userData != null)
                                                ? DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(image!))
                                                : const DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                        "images/5357829_prev.jpg"))
                                            : null,
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: isimageLoading == true
                                          ? const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            )
                                          : null,
                                      width: 100,
                                      height: 100,
                                    ),
                                    const Positioned(
                                      right: 0,
                                      bottom: 0,
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
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              )
                            ],
                          ),
                        ],
                      ),
                      const Text(
                        "User Info",
                        style: TextStyle(
                            fontFamily: kfontPoppinsRegular, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: userNameController,
                        validator: (value) =>
                            value!.isEmpty ? 'User Name cannot be blank' : null,
                        decoration: textFieldDecoration(
                            hint: 'User Name', label: 'User Name'),
                        onChanged: (value) {},
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        controller: userPhoneNumberController,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp("[0-9\]")),
                        ],
                        keyboardType: TextInputType.number,
                        validator: (value) => value!.isEmpty
                            ? 'Phone Number cannot be blank'
                            : null,
                        decoration: textFieldDecoration(
                          hint: 'Phone Number',
                          label: 'Phone Number',
                        ),
                        onChanged: (value) {},
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      widget.userData?.uid ==
                              FirebaseAuth.instance.currentUser!.uid
                          ? const SizedBox()
                          : DropdownButtonFormField<String>(
                            value: dropDownValue,
                              decoration: textFieldDecoration(
                                label: 'Role',
                                hint: 'Role',
                              ),
                              items: const [ DropdownMenuItem(
                                  value: 'dealer',
                                  child: Text('dealer'),
                                ),
                                DropdownMenuItem(
                                  value: 'technician',
                                  child: Text('technician'),
                                ),
                                DropdownMenuItem(
                                  value: 'service manager',
                                  child: Text('service manager'),
                                ),
                                DropdownMenuItem(
                                  value: 'admin',
                                  child: Text('admin'),
                                ),
                                DropdownMenuItem(
                                  value: "production",
                                  child: Text("production"),
                                ),],
                              
                              
                              onChanged: (value) {
                                if (value is String) {
                                  setState(() {
                                    dropDownValue = value;
                                    print(dropDownValue);
                                  });
                                }
                              },
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: MaterialButton(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          color: Colors.blueGrey.shade400,
                          onPressed: () {
                            Navigator.pop(context, false);
                          },
                          child: const Text(
                            'Cancel',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 60,
              ),
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: MaterialButton(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          color: Colors.red,
                          onPressed: () async {
                            if (userNameController.text.isEmpty) {
                              showsnackbar("Please Enter User Name", context,
                                  SnackbarCondition.warning);
                              return;
                            }
                            if (userPhoneNumberController.text.isEmpty) {
                              showsnackbar("Please Enter User Phone", context,
                                  SnackbarCondition.warning);
                              return;
                            }
                            if (((userPhoneNumberController.text)
                                    .replaceAll("+91", "")
                                    .length) !=
                                10) {
                              showsnackbar("Please Enter Valid Phone Number",
                                  context, SnackbarCondition.warning);
                              return;
                            }

                            if (_formKey.currentState?.validate() == true) {
                              final usermodel = UserModel(
                                  uid: widget.userData?.uid,
                                  name: userNameController.text,
                                  phoneNo: userPhoneNumberController.text,
                                  image: image,
                                  role: dropDownValue);

                              firebaseServices.editUser(
                                  userData: usermodel, context: context);

                              showsnackbar("Edited Successfully", context,
                                  SnackbarCondition.success);
                              Navigator.pop(context);
                            } else {
                              showsnackbar("All fields Are Required", context,
                                  SnackbarCondition.warning);
                            }
                          },
                          child: const Text(
                            "Edit",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
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
                leading: const Icon(
                  Icons.photo_library,
                  color: Colors.black,
                ),
                title: const Text(
                  'Gallery',
                  style: TextStyle(fontFamily: kfontPoppinsMedium),
                ),
                onTap: () {
                  imgFromGallery(context);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.photo_camera,
                  color: Colors.black,
                ),
                title: const Text(
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
        _photo = File(
          pickedFile.path,
        );
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
      setState(() {
        isimageLoading = true;
      });
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference storageReference =
          FirebaseStorage.instance.ref().child('product_images/$fileName');
      UploadTask uploadTask = storageReference.putFile(photo);
      await uploadTask.whenComplete(() async {
        String url = await storageReference.getDownloadURL();
        setState(() {
          image = url;
          isimageLoading = false;
        });

        print('File Uploaded. URL: $url');
      });
    } catch (e) {
      print('Error uploading file: $e');
    }
  }
}
