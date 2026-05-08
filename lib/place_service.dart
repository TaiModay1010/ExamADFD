import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'place_model.dart';

class PlaceService {
  // Android Emulator
  static const String _androidBaseUrl = 'http://10.0.2.2:8080/api/places';
  // iOS Simulator or physical device (change to your machine IP for real device)
  static const String _defaultBaseUrl = 'http://localhost:8080/api/places';

  final String baseUrl;

  PlaceService({String? baseUrl}) : baseUrl = baseUrl ?? _resolveBaseUrl();

  Future<List<Place>> getAllPlace() async {
    final response = await http.get(Uri.parse('$baseUrl/getAllPlace'));

    if (response.statusCode != 200) {
      throw Exception('Failed to load places: ${response.statusCode}');
    }

    final List<dynamic> decoded = jsonDecode(response.body) as List<dynamic>;
    return decoded
        .map((item) => Place.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  static String get defaultIosUrl => _defaultBaseUrl;

  static String _resolveBaseUrl() {
    if (kIsWeb) {
      return _defaultBaseUrl;
    }
    if (defaultTargetPlatform == TargetPlatform.android) {
      return _androidBaseUrl;
    }
    return _defaultBaseUrl;
  }
}
