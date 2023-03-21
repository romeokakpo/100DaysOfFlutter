class Photo {
  Photo(this.username, this.small, this.full, this.description, this.likes,
      this.profile);
  String username;
  String small;
  String full;
  String description;
  int likes;
  String profile;

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
        json["user"]['name'],
        json['urls']['small'],
        json['urls']['full'],
        json['description'] ?? "",
        json['likes'],
        json["user"]["profile_image"]["small"]);
  }
}

class Photos {
  Photos({required this.photos});
  final List<Photo> photos;

  factory Photos.fromJson(List<dynamic> json) {
    List<Photo> list;
    list = json.map((e) {
      return Photo.fromJson(e);
    }).toList();

    return Photos(photos: list);
  }
}
