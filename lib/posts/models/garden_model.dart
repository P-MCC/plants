import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  List<Datum> data;

  Welcome({
    required this.data,
  });


  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  int id;
  String commonName;
  List<String> scientificName;
  // List<String> otherName;
  String cycle;
  String watering;
  List<dynamic> sunlight;
  DefaultImage defaultImage;

  Datum({
    required this.id,
    required this.commonName,
    required this.scientificName,
    // required this.otherName,
    required this.cycle,
    required this.watering,
    required this.sunlight,
    required this.defaultImage,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    commonName: json["common_name"],
    scientificName: List<String>.from(json["scientific_name"].map((x) => x)),
    // otherName: List<String>.from(json["other_name"].map((x) => x)),
    cycle: json["cycle"],
    watering: json["watering"],
    sunlight: List<dynamic>.from(json["sunlight"].map((x) => x)),
    defaultImage: DefaultImage.fromJson(json["default_image"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "common_name": commonName,
    "scientific_name": List<dynamic>.from(scientificName.map((x) => x)),
    // "other_name": List<dynamic>.from(otherName.map((x) => x)),
    "cycle": cycle,
    "watering": watering,
    "sunlight": List<dynamic>.from(sunlight.map((x) => x)),
    "default_image": defaultImage.toJson(),
  };
}

class DefaultImage {
  String mediumUrl;

  DefaultImage({
    required this.mediumUrl,
  });

  factory DefaultImage.fromJson(Map<String, dynamic> json) => DefaultImage(
    mediumUrl: json["original_url"],
  );

  Map<String, dynamic> toJson() => {
    "medium_url": mediumUrl,
  };
}
