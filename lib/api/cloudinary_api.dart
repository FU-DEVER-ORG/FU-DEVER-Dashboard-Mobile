import 'dart:convert';
import 'dart:io';

import 'package:fudever_dashboard/api/api_repository.dart';
import 'package:http/http.dart' as http;

class CloudinaryApi extends ApiRepository {
  Future<dynamic> uploadImage(File selectedImage) async {
    try {
      String? _imageUrl;
      final Uri url = await image(); // Call the inherited image method
      final request = http.MultipartRequest('POST', url)
        ..fields['upload_preset'] = 'napacoin'
        ..files
            .add(await http.MultipartFile.fromPath('file', selectedImage.path));

      final response = await request.send();

      if (response.statusCode == 200) {
        final responseData = await response.stream.toBytes();
        final responseString = String.fromCharCodes(responseData);
        final jsonMap = jsonDecode(responseString);
        _imageUrl = jsonMap['url'];
        
        return _imageUrl;
      } else {
        print('Upload failed with status: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Upload failed with error: $e');
      return null;
    }
  }
}
