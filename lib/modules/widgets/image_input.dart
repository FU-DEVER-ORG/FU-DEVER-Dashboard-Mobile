import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({
    Key? key,
    required this.onPickImage,
  }) : super(key: key);

  final void Function(File image) onPickImage;

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _selectedImage;

  void _openCamera() async {
    final pickedImage = await CameraHelper.openCamera();
    if (pickedImage != null) {
      setState(() {
        _selectedImage = pickedImage;
      });
      widget.onPickImage(pickedImage);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = IconButton(
      onPressed: _openCamera,
      icon: const Icon(
        Icons.camera_alt,
        color: Colors.blue,
        size: 24.0,
      ),
    );

    return Stack(
      children: <Widget>[
        ClipOval(
          child: SizedBox(
            height: 120,
            width: 120,
            child: _selectedImage != null
                ? Image.file(
                    _selectedImage!,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    'assets/images/demo-image.png',
                    fit: BoxFit.cover,
                  ),
          ),
        ),
        Positioned(
          top: 0.0,
          right: 0.0,
          child: Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: content,
          ),
        ),
      ],
    );
  }
}

class CameraHelper {
  static Future<File?> openCamera() async {
    final imagePicker = ImagePicker();
    try {
      final pickedImage = await imagePicker.pickImage(
        source: ImageSource.camera,
        maxWidth: 600,
      );
      if (pickedImage == null) return null;
      return File(pickedImage.path);
    } catch (e) {
      print('Error opening camera: $e');
      return null;
    }
  }
}
