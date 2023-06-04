// To parse this JSON data, do
//
//     final welcometest = welcometestFromJson(jsonString);

import 'dart:convert';

SearchJason searchFromJson(String str) => SearchJason.fromJson(json.decode(str));

String searchToJson(SearchJason data) => json.encode(data.toJson());

class SearchJason {
  List<Datum> data;
  int to;
  int perPage;
  int currentPage;
  int from;
  int lastPage;
  int total;

  SearchJason({
    required this.data,
    required this.to,
    required this.perPage,
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.total,
  });

  factory SearchJason.fromJson(Map<String, dynamic> json) => SearchJason(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    to: json["to"],
    perPage: json["per_page"],
    currentPage: json["current_page"],
    from: json["from"],
    lastPage: json["last_page"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "to": to,
    "per_page": perPage,
    "current_page": currentPage,
    "from": from,
    "last_page": lastPage,
    "total": total,
  };
}

class Datum {
  int id;
  String commonName;

  Datum({
    required this.id,
    required this.commonName,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    commonName: json["common_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "common_name": commonName,
  };
}
