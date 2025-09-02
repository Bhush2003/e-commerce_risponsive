import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


File? image;
void showPicker({required BuildContext context}) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return SafeArea(
        child: Wrap(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Photo Library'),
              onTap: () {
                getImage(ImageSource.gallery);
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_camera),
              title: const Text('Camera'),
              onTap: () {
                getImage(ImageSource.camera);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    },
  );
}

Future getImage(ImageSource img) async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: img);
  if(pickedFile == null) return;
  final imageTemp = File(pickedFile.path);
  image = imageTemp;
}
