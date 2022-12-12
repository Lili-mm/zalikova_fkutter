// To parse this JSON data, do
//
//     final currency = currencyFromJson(jsonString);

import 'dart:convert';

List<Currency> currencyFromJson(String str) => List<Currency>.from(json.decode(str).map((x) => Currency.fromJson(x)));

String currencyToJson(List<Currency> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Currency {
  Currency({
    required this.r030,
    required this.txt,
    required this.rate,
    required this.cc,
    required this.exchangedate,
  });

  int r030;
  String txt;
  double rate;
  String cc;
  Exchangedate? exchangedate;

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
    r030: json["r030"],
    txt: json["txt"],
    rate: json["rate"].toDouble(),
    cc: json["cc"],
    exchangedate: exchangedateValues.map[json["exchangedate"]],
  );

  Map<String, dynamic> toJson() => {
    "r030": r030,
    "txt": txt,
    "rate": rate,
    "cc": cc,
    "exchangedate": exchangedateValues.reverse[exchangedate],
  };
}

enum Exchangedate { THE_28112022 }

final exchangedateValues = EnumValues({
  "28.11.2022": Exchangedate.THE_28112022
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
