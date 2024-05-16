import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../provider/image_provider.dart';

class ImageInput extends ConsumerStatefulWidget {
  const ImageInput({
    Key? key,
    required this.onPickImage,
  }) : super(key: key);

  final void Function(File image) onPickImage;

  @override
  ConsumerState<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends ConsumerState<ImageInput> {
  File? _selectedImage;

  void _openCamera() async {
    final pickedImage = await CameraHelper.openCamera();
    if (pickedImage != null) {
      setState(() {
        _selectedImage = pickedImage;
      });
      widget.onPickImage(_selectedImage!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final File? userAvatar = ref.watch(userImageProvider);

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
            child: userAvatar != null
                ? Image.file(
                    userAvatar,
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
      // print('Error opening camera: $e');
      return null;
    }
  }
}
