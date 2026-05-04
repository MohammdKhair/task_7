import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class StorageNotes {
  final supaStorage = Supabase.instance.client.storage.from("notes");

  Future<String> uploadImage(File file) async {
    String uuid = Uuid().v4();
    String extension = file.path.split(".").last;
    String path = "public/$uuid.$extension";
    await supaStorage.upload(path, file);
    return path;
  }

  String getImage(String imagePath) {
    return supaStorage.getPublicUrl(imagePath);
  }

  Future<List<FileObject>> deleteImage(String imagePath) {
    return supaStorage.remove([imagePath]);
  }
}
