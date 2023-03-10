class User {
  String avatarUrl;
  String name;
  String username;
  String description;
  int followers, following;
  User(this.avatarUrl, this.name, this.username, this.description,
      this.followers, this.following);

  factory User.fromJSON(Map<String, dynamic> json) {
    return User(json['avatar_url'], json['name'], json['login'],
        json['bio'] ?? "", json['followers'], json['following']);
  }
}
