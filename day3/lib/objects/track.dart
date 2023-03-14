class Track {
  int id;
  String name;
  Track(this.id, this.name);

  factory Track.fromJson(Map<String, dynamic> json) {
    return Track(json["track_id"], json["track_name"]);
  }
}

class Group {
  String code;
  String country;
  List<Track> songs;

  Group(this.code, this.country, this.songs);

  factory Group.fromJson(List<dynamic> json, String code, String country) {
    var songs = json.map((e) => Track.fromJson(e['track'])).toList();
    return Group(code, country, songs);
  }
}
