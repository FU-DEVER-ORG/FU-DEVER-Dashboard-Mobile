import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fudever_dashboard/api/users_api.dart';
import '../../provider/token_provider.dart';
import 'controller/image_controller.dart';

// Define a ChangeNotifierProvider for ImageController
final imageControllerProvider =
    ChangeNotifierProvider((ref) => ImageController());

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
  @override
  Widget build(BuildContext context) {
    final imageController = ref.watch(imageControllerProvider);
    final token = ref.watch(tokenProvider);

    if (token != null) {
      UserController.getUsers(token);
    }

    return Column(
      children: [
        Stack(
          children: <Widget>[
            ClipOval(
              child: SizedBox(
                height: 120,
                width: 120,
                child: imageController.selectedImage != null
                    ? Image.file(
                        imageController.selectedImage!,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        'assets/images/logo-only.png',
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
                child: IconButton(
                  icon: const Icon(
                    Icons.camera_alt,
                    color: Colors.blue,
                    size: 24.0,
                  ),
                  onPressed: () =>
                      ref.read(imageControllerProvider).pickImageFromGallery(),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          'Name',
          style: const TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Email',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w200,
          ),
        ),
      ],
    );
  }
}
