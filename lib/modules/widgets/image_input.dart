import 'dart:io';

import 'package:cloudinary_url_gen/cloudinary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fudever_dashboard/api/api_repository.dart';
import 'package:fudever_dashboard/api/cloudinary_api.dart';
import 'package:fudever_dashboard/api/users_api.dart';
import 'package:image_picker/image_picker.dart';

import '../../provider/image_provider.dart';
import '../screens/profile/profile_screen.dart';

class ImageInput extends ConsumerStatefulWidget {
  const ImageInput({
    Key? key,
    required this.onPickImage,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;
  final void Function(File image) onPickImage;

  @override
  ConsumerState<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends ConsumerState<ImageInput> {
  File? _selectedImage;
  Future<void> _openCamera() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      if (mounted) {
        setState(() {
          _selectedImage = File(pickedImage.path);
        });
      }
      widget.onPickImage(_selectedImage!);
      if (_selectedImage != null) {
        final _imageUrl = await CloudinaryApi().uploadImage(_selectedImage!);
        if (_imageUrl != null) {
          final response =
              await UserController.editUsers(options: {'avatar': _imageUrl});
          if (response['status'] == 'success') {
            // Check if the widget is still mounted before navigating
            if (mounted) {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(
                    data: response['data']['user']['avatar'],
                  ),
                ),
              );
            }
          } else {
            // Handle error case
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final avatarUrl = ref.watch(userImageProvider);

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
            child: avatarUrl != null
                ? Image.file(
                    avatarUrl,
                    fit: BoxFit.cover,
                  )
                : Image.network(
                    widget.imageUrl,
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
      // Handle error if needed
      return null;
    }
  }
}
