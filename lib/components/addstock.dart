import 'dart:io';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inventory_managemen_fuais/components/appbar.dart';
import 'package:inventory_managemen_fuais/components/textformfield.dart';
import 'package:inventory_managemen_fuais/constant.dart';

class AddStock extends StatefulWidget {
  const AddStock({super.key});

  @override
  State<AddStock> createState() => _AddStockState();
}

class _AddStockState extends State<AddStock> {
  File? image;
  final imagePicker = ImagePicker();
  String optionRadio = '';
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String name = '';
  String weight = '';
  String id = '';
  String imageUrl = '';
  String imageName = '';
  CollectionReference productInformation =
      FirebaseFirestore.instance.collection('productInformation');
  late Reference ref;
  @override
  Widget build(BuildContext context) {
    ref = FirebaseStorage.instance.ref('images/$imageName');
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: textColor,
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              await ref.putFile(image!);
              imageUrl = await ref.getDownloadURL();
              productInformation.add({
                'name': name,
                'weight': weight,
                'id': id,
                'imageUrl': imageUrl,
                'userId': FirebaseAuth.instance.currentUser!.uid
              });
              Navigator.of(context).pushNamed('enterinventory');
            }
          },
          child: const Icon(
            Icons.add,
            color: whiteColor,
          )),
      backgroundColor: backgroundColor,
      appBar: const CustomAppBar(text: 'Add Stock'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          child: ListView(children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      image == null
                          ? const CircleAvatar(
                              backgroundColor: whiteColor,
                              radius: 45,
                              child: Icon(Icons.document_scanner_outlined,
                                  size: 35, color: greyColor),
                            )
                          : CircleAvatar(
                              radius: 45, backgroundImage: FileImage(image!)),
                      Positioned(
                          left: 60,
                          top: 60,
                          child: InkWell(
                            onTap: () async {
                              var imagePicked = await imagePicker.pickImage(
                                  imageQuality: 85,
                                  source: ImageSource.gallery);
                              if (imagePicked != null) {
                                setState(() {
                                  image = File(imagePicked.path);
                                });
                                var rand = Random().nextInt(100000);
                                imageName =
                                    '$rand${basename(imagePicked.path)}';
                              }
                            },
                            child: const Icon(
                              Icons.photo_camera,
                              size: 25,
                              color: textColor,
                            ),
                          ))
                    ],
                  ),
                ],
              ),
            ),
            CustomTextFormField(
              onSave: (val) {
                name = val!;
              },
              labelText: 'Name',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(children: [
                Radio(
                    activeColor: textColor,
                    value: 'weight',
                    groupValue: optionRadio,
                    onChanged: (val) {
                      setState(() {
                        optionRadio = val!;
                      });
                    }),
                const Text(
                  '  Weight    ',
                  style: TextStyle(color: textColor, fontSize: 18),
                ),
                Radio(
                    activeColor: textColor,
                    value: 'wooden pallet',
                    groupValue: optionRadio,
                    onChanged: (val) {
                      setState(() {
                        optionRadio = val!;
                      });
                    }),
                const Text(
                  '  wooden pallet',
                  style: TextStyle(color: textColor, fontSize: 18),
                )
              ]),
            ),
            CustomTextFormField(
              onSave: (val) {
                weight = val!;
              },
              labelText: 'Weight',
            ),
            CustomTextFormField(
              onSave: (val) {},
              labelText: 'Temperature',
            ),
            CustomTextFormField(
              onSave: (val) {},
              labelText: 'Material type',
            ),
            CustomTextFormField(
              onSave: (val) {},
              labelText: 'Barcode Scanner(optional)',
            ),
            CustomTextFormField(
              onSave: (val) {},
              labelText: 'Brand',
            ),
            CustomTextFormField(
              onSave: (val) {
                id = val!;
              },
              labelText: 'UPC',
              hintText: 'universal product code',
            )
          ]),
        ),
      ),
    );
  }
}
