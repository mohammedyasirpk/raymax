import 'dart:io';

import 'package:byon_care/models/product_model_class.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../constents.dart';
import '../../repository/topsnackbar.dart';
import '../../service_manager/dropdowntextfield.dart';
import '../../servicess/firestore_services.dart';


class EditProductionProduct extends StatefulWidget {
  const EditProductionProduct({Key? key, this.productData}) : super(key: key);

  final ProductModel? productData;

  @override
  State<EditProductionProduct> createState() => _EditProductionProductState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

final FirestoreServices firestoreServices = FirestoreServices();

class _EditProductionProductState extends State<EditProductionProduct> {
  List<String> modelList = [];
  late TextEditingController productTypeTextController;
  late TextEditingController productNameTextController;
  late TextEditingController warrentyTextController;
  late TextEditingController additionalWarrentyTextController;
  late TextEditingController descriptionController;

  final ImagePicker _picker = ImagePicker();
  File? _photo;

  // String? imageUrl;
  String? image;
  bool isimageLoading = false;
  @override
  void initState() {
    image = widget.productData?.imageUrl;

    modelList = widget.productData?.modelList ?? [];
    productTypeTextController = TextEditingController();
    productNameTextController =
        TextEditingController(text: widget.productData?.productName ?? "");
    warrentyTextController =
        TextEditingController(text: '${widget.productData?.warranty ?? ""}');
    additionalWarrentyTextController = TextEditingController(
        text: '${widget.productData?.additionalWarranty ?? ""}');
    descriptionController =
        TextEditingController(text: widget.productData?.description ?? "");
    super.initState();
  }

  @override
  void dispose() {
    productTypeTextController.dispose();
    productNameTextController.dispose();

    warrentyTextController.dispose();
    additionalWarrentyTextController.dispose();

    descriptionController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kbyoncolor3,
          elevation: 0,
          title: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              widget.productData == null ? 'Add Product' : 'Edit Product',
              style: const TextStyle(
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
                                "Product Photo",
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
                                                    image!.isNotEmpty)
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
                        "Product Info",
                        style: TextStyle(
                            fontFamily: kfontPoppinsRegular, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: productNameTextController,
                        validator: (value) => value!.isEmpty
                            ? 'Product Name cannot be blank'
                            : null,
                        decoration: textFieldDecoration(
                            hint: 'Product Name', label: 'Products Name'),
                        onChanged: (value) {},
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        controller: warrentyTextController,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp("[0-9\]")),
                        ],
                        keyboardType: TextInputType.number,
                        validator: (value) =>
                            value!.isEmpty ? 'Warranty cannot be blank' : null,
                        decoration: textFieldDecoration(
                          hint: 'Warranty',
                          label: 'Warranty',
                        ),
                        onChanged: (value) {},
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp("[0-9\]")),
                        ],
                        controller: additionalWarrentyTextController,
                        validator: (value) => value!.isEmpty
                            ? 'Additional Warranty be blank'
                            : null,
                        decoration: textFieldDecoration(
                            hint: 'Additional warranty',
                            label: 'Additional warranty'),
                        onChanged: (value) {},
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        maxLines: 3,
                        controller: descriptionController,
                        validator: (value) => value!.isEmpty
                            ? 'Description cannot be blank'
                            : null,
                        decoration: textFieldDecoration(
                          hint: 'Description',
                          label: 'Description',
                        ),
                        onChanged: (value) {},
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Product Type",
                        style: TextStyle(
                            fontFamily: kfontPoppinsRegular, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Wrap(
                          spacing: 10,
                          children: modelList
                              .map(
                                (e) => Chip(
                                  onDeleted: () {
                                    modelList.remove(e);
                                    setState(() {});
                                  },
                                  label: Text(e),
                                  backgroundColor:
                                      Theme.of(context).canvasColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(
                                          color: const Color(0xffD9D9D9)
                                              .withOpacity(.44))),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      TextFormField(
                        controller: productTypeTextController,
                        decoration: textFieldDecoration(
                            suffix: GestureDetector(
                                onTap: () {
                                  if (productTypeTextController.text
                                      .trim()
                                      .replaceAll(" ", "")
                                      .isNotEmpty) {
                                    modelList.add(productTypeTextController.text
                                        .trim()
                                        .toLowerCase());
                                 
                                  }

                                  productTypeTextController.clear();
                                  setState(() {});
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 2),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: kbyoncolor3)),
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.add,
                                        size: 14,
                                      ),
                                      Text(
                                        "Add",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: kbyoncolor3),
                                      ),
                                    ],
                                  ),
                                )),
                            hint: 'Product Type',
                            label: 'Product Type'),
                        onChanged: (value) {},
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
                            if (image == null) {
                              showsnackbar("Please Select Product Image",
                                  context, SnackbarCondition.warning);
                              return;
                            }

                            if (modelList.isEmpty) {
                              showsnackbar("Add minimum one Product Type",
                                  context, SnackbarCondition.warning);
                              return;
                            }

                            if (_formKey.currentState?.validate() == true) {
                              final produtmodel = ProductModel(
                                  docId: widget.productData?.docId,
                                  imageUrl: image,
                                  description: descriptionController.text,
                                  modelList: modelList,
                                  warranty:
                                      int.tryParse(warrentyTextController.text),
                                  additionalWarranty: int.tryParse(
                                      additionalWarrentyTextController.text),
                                  productName: productNameTextController.text
                                      .toLowerCase());
                              // firestoreServices.addOurProduct(
                              //     productModel: produtmodel);

                              showsnackbar(
                                  widget.productData == null
                                      ? "Product Added Successfully"
                                      : "Product Edited Successfully",
                                  context,
                                  SnackbarCondition.success);
                              Navigator.pop(context, false);
                            } else {
                              showsnackbar("All fields Are Required", context,
                                  SnackbarCondition.warning);
                            }
                          },
                          child: Text(
                            widget.productData == null ? "Add" : "Edit",
                            style: const TextStyle(
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
