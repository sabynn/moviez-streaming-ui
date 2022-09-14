import 'dart:convert';

List<MoviezModel> moviezModelFromJson(String str) => List<MoviezModel>.from(json.decode(str).map((x) => MoviezModel.fromJson(x)));

String moviezModelToJson(List<MoviezModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MoviezModel {
  MoviezModel({
    required this.title,
    required this.genres,
    required this.rating,
    required this.image,
  });

  String title;
  List<String> genres;
  double rating;
  String image;

  factory MoviezModel.fromJson(Map<String, dynamic> json) => MoviezModel(
    title: json["title"],
    genres: List<String>.from(json["genres"].map((x) => x)),
    rating: json["rating"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "genres": List<dynamic>.from(genres.map((x) => x)),
    "rating": rating,
    "image": image,
  };
}
