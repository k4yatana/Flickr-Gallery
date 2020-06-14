import 'dart:convert';
import 'dart:io';

import 'package:flickr_gallery/catalog/domain/photo.dart';
import 'package:path_provider/path_provider.dart';

class FavouriteRepository {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/favourites.json');
  }

  Future<void> writePhotos(List<Photo> photos) async {
    final file = await _localFile;
    final json = jsonEncode(photos);
    await file.writeAsString(json, mode: FileMode.write);
  }

  Future<List<Photo>> readPhotos() async {
    final file = await _localFile;
    if (file.existsSync()) {
      final jsonString = await file.readAsString();
      final jsonMap = jsonDecode(jsonString);
      return jsonMap.map<Photo>((json) => Photo.fromJson(json)).toList();
    }
    return [];
  }
}
