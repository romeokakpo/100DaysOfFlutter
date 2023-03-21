import 'package:day5/models/photos.dart';
import 'package:day5/services/unsplash_api.dart';
import 'package:flutter/material.dart';

class PhotosProvider with ChangeNotifier {
  bool loading = false;
  Photos photos = Photos(photos: []);

  void setLoading() {
    loading = !loading;
    notifyListeners();
  }

  void fetchPhotos(word) async {
    photos = await UnsplashAPI.fetchPhotos(word);
    loading = false;
    notifyListeners();
  }
}
