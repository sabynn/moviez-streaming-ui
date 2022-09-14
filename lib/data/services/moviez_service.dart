part of '_services.dart';


class MoviezService{
  static final List<dynamic> _dummyData = [
    {
      "title": "John Wick 4",
      "genres": ["Action", "Crime"],
      "rating": 5.0,
      "image": "https://cdn.discordapp.com/attachments/888781658566848532/1019218913755680810/image_3.png"
    },
    {
      "title": "Mulan Session",
      "genres": ["History", "War"],
      "rating": 3.0,
      "image": "https://cdn.discordapp.com/attachments/888781658566848532/1019622649393053806/image_7.png"
    },
    {
      "title": "Beauty & Beast",
      "genres": ["Sci-Fi", "Fiction"],
      "rating": 5.0,
      "image": "https://cdn.discordapp.com/attachments/888781658566848532/1019622649053323324/image_6.png"
    }
  ];

  static Future<List<MoviezModel>> searchData(String query) async {
    var list = <MoviezModel>[];

    for (var data in _dummyData) {
      MoviezModel result = MoviezModel.fromJson(data);
      if (result.title.toLowerCase().contains(query.toLowerCase())) {
        list.add(result);
      }
    }

    return list;
  }
}
