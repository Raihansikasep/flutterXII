import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:xii_rpl_3/models/album_model.dart';

class AlbumService {
  static const String albumUrl = 'https://jsonplaceholder.typicode.com/albums/';

  static Future<List<AlbumModel>> fetchAlbum() async {
    final response = await http.get(Uri.parse(albumUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonpData = json.decode(response.body);
      return jsonpData.map((item) => AlbumModel.fromJson(item)).toList();
    } else {
      throw Exception('Gagal load data album');
    }
  }
}
