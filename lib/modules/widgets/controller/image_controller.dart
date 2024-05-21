import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../api/cloudinary_api.dart';

class ImageController extends ChangeNotifier {
  File? _selectedImage;
  String? _imageUrl;
  File? get selectedImage => _selectedImage;

  Future<void> pickImageFromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      _selectedImage = File(pickedImage.path);
      _imageUrl = await CloudinaryApi().uploadImage(_selectedImage!);
      notifyListeners();
    }
  }

  Future<void> pickImageFromCamera() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      _selectedImage = File(pickedImage.path);
      notifyListeners();
    }
  }
}
