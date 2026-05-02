// To parse this JSON data, do
//
//     final modelAlbums = modelAlbumsFromJson(jsonString);

import 'dart:convert';

List<ModelAlbums> modelAlbumsFromJson(String str) => List<ModelAlbums>.from(json.decode(str).map((x) => ModelAlbums.fromJson(x)));

String modelAlbumsToJson(List<ModelAlbums> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelAlbums {
  int userId;
  int id;
  String title;

  ModelAlbums({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory ModelAlbums.fromJson(Map<String, dynamic> json) => ModelAlbums(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
  };
}
