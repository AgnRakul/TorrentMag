import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../Model/torrent_mag.dart';

class ApiService {
  static final ApiService instance = ApiService._internal();
  factory ApiService() => instance;
  ApiService._internal();

  final baseUrl = dotenv.env['API_URL'];

  Future<List<TorrentMag>> torrentMag(String name) async {
    final response = await http.get(Uri.parse("$baseUrl?query=$name"));
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      // print(result);
      final List torrentData = result['results'];
      return torrentData.map((e) => TorrentMag.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load dATA');
    }
  }
}
