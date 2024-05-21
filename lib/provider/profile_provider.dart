import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;
import '../models/profile.dart';

class ImageProvider extends StateNotifier<File?> {
  ImageProvider() : super(null);

  Future<void> changeProfileInfo(Profile profile) async {
    try {
      final response = await http.get(Uri.parse(profile.avatar));

      if (response.statusCode == 200) {
        final appDirectory = await syspaths.getApplicationDocumentsDirectory();
        final filename = path.basename(profile.avatar);
        final localPath = path.join(appDirectory.path, filename);

        final file = File(localPath);
        await file.writeAsBytes(response.bodyBytes);

        state = file;
      } else {
        throw Exception('Failed to download image');
      }
    } catch (e) {
      print('Error downloading image: $e');
    }
  }
}

final profileProvider = StateProvider<Profile?>((ref) => null);
