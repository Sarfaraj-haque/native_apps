import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageTaker extends StatefulWidget {
  const ImageTaker({super.key,required this.onPickImage});
  final void Function(File pickedImage) onPickImage;

  @override
  State<ImageTaker> createState() => _ImageTakerState();
}

class _ImageTakerState extends State<ImageTaker> {
  File? selectedImage;

  void _takePicture() async {
    final ImagePicker picker = ImagePicker();
    final imagePicked =
        await picker.pickImage(source: ImageSource.camera, maxWidth: 500);
    if (imagePicked == null) {
      return;
    }
    setState(() {
      selectedImage = File(imagePicked.path);
    });
    widget.onPickImage(selectedImage!);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
      onPressed: _takePicture,
      label: Text("Add Image"),
      icon: Icon(Icons.camera),
    );
    if (selectedImage != null) {
      content = GestureDetector(
        onTap: _takePicture,
        child: Image.file(
          selectedImage!,
          width: double.infinity,
          fit: BoxFit.cover,
          height: double.infinity,
        ),
      );
    }
    return Container(
      decoration:
          BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
      height: 250,
      width: double.infinity,
      alignment: Alignment.center,
      child: content,
    );
  }
}
