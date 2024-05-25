
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/cloudinary_api.dart';
import '../api/users_api.dart';
import '../modules/screens/home/home.dart';

class ConfirmImage extends ConsumerStatefulWidget {
  const ConfirmImage({
    super.key,
    required this.getConfirmImage,
  });

  final File getConfirmImage;

  @override
  ConsumerState<ConfirmImage> createState() => _ConfirmImageState();
}

class _ConfirmImageState extends ConsumerState<ConfirmImage> {
  Future<void> _updateImage() async {
    await EasyLoading.show();

    final _imageUrl = await CloudinaryApi().uploadImage(widget.getConfirmImage);
    if (_imageUrl != null) {
      final response =
          await UserController.editUsers(options: {'avatar': _imageUrl});
      if (response['status'] == 'success') {
        if (mounted) {
          Navigator.of(context).pop();
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => HomeScreen(
                data: response,
              ),
            ),
          );
        }
      } else {
        // Handle error case
      }
    }
    await EasyLoading.dismiss();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cập nhật ảnh đại diện'),
        actions: [
          IconButton(
            onPressed: _updateImage,
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: Center(
        child: Image.file(widget.getConfirmImage),
      ),
    );
  }
}
