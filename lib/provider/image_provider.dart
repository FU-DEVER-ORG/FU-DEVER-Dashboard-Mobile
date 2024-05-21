import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;

class ImageProvider extends StateNotifier<File?> {
  ImageProvider() : super(null);

  void changeImage(String name, File avatar) async {
    final appDirectory = await syspaths.getApplicationDocumentsDirectory();
    final filename = path.basename(avatar.path);
    final copiedImage = await avatar.copy('${appDirectory.path}/$filename');

    state = copiedImage;
  }
}

final userImageProvider =
    StateNotifierProvider<ImageProvider, File?>((ref) => ImageProvider());
