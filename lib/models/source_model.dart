/*class SourceModel {
  String? status;
  String? code;
  String? message;
  List<Sources>? sources;

  SourceModel({this.status, this.code, this.message, this.sources});

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(
      status: json["status"],
      code: json["code"] ?? "",
      message: json["message"] ?? "",
      sources: List<Sources>.from(
          json["sources"].map((elements) => Sources.fromJson(elements))),
    );
  }
}

class Sources {
  String? id;
  String? name;
  String? description;
  String? url;
  String? category;

  Sources({this.id, this.name, this.description, this.url, this.category});

  factory Sources.fromJson(Map<String, dynamic> json) {
    return Sources(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      url: json["url"],
      category: json["category"],
    );
  }
}*/

class SourceModel {
  String? status;
  String? message;
  List<Sources>? sources;

  SourceModel({this.status, this.sources});

  SourceModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json["message"];
    if (json['sources'] != null) {
      sources = <Sources>[];
      json['sources'].forEach((v) {
        sources!.add(Sources.fromJson(v));
      });
    }
  }
}

class Sources {
  String? id;
  String? name;
  String? description;
  String? url;
  String? category;
  String? language;
  String? country;

  Sources({
    this.id,
    this.name,
    this.description,
    this.url,
    this.category,
    this.language,
    this.country,
  });

  Sources.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    url = json['url'];
    category = json['category'];
    language = json['language'];
    country = json['country'];
  }
}
