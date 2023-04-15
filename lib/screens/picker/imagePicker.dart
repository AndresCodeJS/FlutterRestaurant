import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerC extends StatefulWidget {
  const ImagePickerC({super.key});

  @override
  State<ImagePickerC> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePickerC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ImagePicker"),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
                onPressed: () => {_openImagePicker()},
                child: const Text("Select an Image")),
            const SizedBox(height: 35),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: _image != null
                  ? Card(
                      margin: const EdgeInsets.all(10),
                      child: Image.file(_image!, fit: BoxFit.fill, height: 250,))
                  : const Text('Please select an image'),
            )
          ],
        ),
      ),
    );
  }

  File? _image;

  final _picker = ImagePicker();

  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  /* Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image as File;
    });
  } */
}
