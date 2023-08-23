// To parse this JSON data, do
//
//     final cancelOrderReasons = cancelOrderReasonsFromMap(jsonString);

import 'dart:convert';

CancelOrderReasons cancelOrderReasonsFromMap(String str) =>
    CancelOrderReasons.fromMap(json.decode(str));

String cancelOrderReasonsToMap(CancelOrderReasons data) =>
    json.encode(data.toMap());

class CancelOrderReasons {
  CancelOrderReasons({
    this.id,
    this.code,
    this.name,
  });

  int id;
  String code;
  String name;

  factory CancelOrderReasons.fromMap(Map<String, dynamic> json) =>
      CancelOrderReasons(
        id: json["id"] == null ? null : json["id"],
        code: json["code"] == null ? null : json["code"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "code": code == null ? null : code,
        "name": name == null ? null : name,
      };
}
