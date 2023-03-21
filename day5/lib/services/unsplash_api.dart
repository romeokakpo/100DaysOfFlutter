import 'dart:convert';

import 'package:day5/models/photos.dart';
import "package:http/http.dart" as http;

import 'env.dart';

class UnsplashAPI {
  static Future<Photos> fetchPhotos(keyword) async {
    try {
      final response = await http.get(Uri.parse(
          "https://api.unsplash.com/search/photos?client_id=$accessToken&query=$keyword&page=1"));
      return Photos.fromJson(jsonDecode(response.body)["results"]);
    } catch (e) {
      throw Exception(e);
    }
  }
}
