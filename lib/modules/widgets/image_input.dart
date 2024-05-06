import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({
    super.key,
    required this.onPickImage,
  });

  final void Function(File image) onPickImage;

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _selectedImage;
  void _takePicture() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.camera, maxWidth: 600);
    if (pickedImage == null) {
      return;
    }

    setState(() {
      _selectedImage = File(pickedImage.path);
    });

    widget.onPickImage(_selectedImage!);
    /*chỉ đơn giản là một cách truy cập vào onPickImage này mà không làm gì cả với nó,
    nghĩa là nó không gọi hoặc sử dụng nó trong bất kỳ cách nào.*/
  }

  @override
  Widget build(BuildContext context) {
    Widget content = IconButton(
      onPressed: _takePicture,
      icon: const Icon(
        Icons.camera_alt,
        color: Colors.blue,
        size: 24.0,
      ),
    );

    // if (_selectedImage != null) {
    //   content = ClipRRect(
    //     borderRadius: BorderRadius.circular(20),
    //     child: GestureDetector(
    //       onTap: _takePicture,
    //       child: Image.file(
    //         _selectedImage!,
    //         fit: BoxFit.cover,
    //         width: double.infinity,
    //         height: double.infinity,
    //       ),
    //     ),
    //   );
    // }
    return Stack(
      children: <Widget>[
        ClipOval(
          child: SizedBox(
            height: 120,
            width: 120,
            child: Image.asset(
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
