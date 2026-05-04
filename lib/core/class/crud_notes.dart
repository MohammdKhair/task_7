import 'package:supabase_flutter/supabase_flutter.dart';

class CrudNotes {
  final supaCRUD = Supabase.instance.client.from("notes");

  Future<dynamic> create(
    String title,
    String content,
    String? imagePath,
  ) async {
    await supaCRUD.insert({
      "title": title,
      "content": content,
      "image_path": imagePath,
    });
  }

  Future<List<Map<String, dynamic>>> read() async {
    final response = await supaCRUD.select();

    return List<Map<String, dynamic>>.from(response);
  }

  Stream realTimeRead() {
    return supaCRUD.stream(primaryKey: ["id"]);
  }

  Future<void> update(String id, String title, String content) async {
    await supaCRUD.update({"title": title, "content": content}).eq("id", id);
  }

  Future<void> delete(String id) async {
    await supaCRUD.delete().eq("id", id);
  }
}
