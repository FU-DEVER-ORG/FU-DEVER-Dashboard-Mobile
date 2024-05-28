import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fudever_dashboard/controller/profile_controller.dart';
import 'package:image_picker/image_picker.dart';

import '../../provider/image_provider.dart';
import '../../utils/confirm_image.dart';

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

  Future<void> _openGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
        ProfileController.setAvatar(_selectedImage!);
      });
      widget.onPickImage(_selectedImage!);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ConfirmImage(
            getConfirmImage: _selectedImage!,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final avatarUrl = ref.watch(userImageProvider);
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Chọn ảnh từ thư viện'),
                    onTap: () {
                      Navigator.of(context).pop();
                      _openGallery();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.image),
                    title: const Text('Xem ảnh'),
                    onTap: () {
                      Navigator.of(context).pop();
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Platform.isIOS
                              ? CupertinoAlertDialog(
                                  content: avatarUrl != null
                                      ? Image.file(avatarUrl)
                                      : Image.network(widget.imageUrl),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('Đóng'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                )
                              : AlertDialog(
                                  content: avatarUrl != null
                                      ? Image.file(avatarUrl)
                                      : Image.network(widget.imageUrl),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('Đóng'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                        },
                      );
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Center(
        child: ProfileController.getAvatar() == null
            ? CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(widget.imageUrl),
              )
            : CircleAvatar(
                radius: 60,
                backgroundImage: FileImage(ProfileController.getAvatar()!),
              ),
      ),
    );
  }
}
