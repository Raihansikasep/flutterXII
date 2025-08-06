import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:xii_rpl_3/models/latihan_jadwal_sholat_model.dart';

class SholatService {
  static const String albumUrl = 'https://raw.githubusercontent.com/lakuapik/jadwalsholatorg/master/adzan/semarang/2019/12.json#downloadJSON=true';

  static Future<List<JadwalSholat>> fetchAlbum() async {
    final response = await http.get(Uri.parse(albumUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((item) => JadwalSholat.fromJson(item)).toList();
    } else {
      throw Exception('Gagal load data album');
    }
  }
}
