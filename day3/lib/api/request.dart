import 'dart:convert';

import 'package:day3/objects/track.dart';
import 'package:http/http.dart' as http;
import 'api_key.dart';

Future<Group> fetchSong(String code, String country) async {
  final response = await http.get(Uri.parse(
      'https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=$logKey&chart_name=top&page=1&page_size=20&country=$code&f_has_lyrics=1'));

  if (response.statusCode == 200) {
    return Group.fromJson(
        json.decode(response.body)["message"]["body"]["track_list"],
        code,
        country);
  } else {
    throw Exception('Failed to load album');
  }
}

Future<String> fetchLyrics(int id) async {
  final response = await http.get(Uri.parse(
      'https://api.musixmatch.com/ws/1.1/track.lyrics.get?apikey=$logKey&track_id=$id'));

  if (response.statusCode == 200) {
    return json.decode(response.body)["message"]["body"]["lyrics"]
        ["lyrics_body"];
  } else {
    throw Exception('Failed to load album');
  }
}
