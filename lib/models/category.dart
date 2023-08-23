// To parse this JSON data, do
//
//     final category = categoryFromMap(jsonString);

import 'dart:convert';

Category categoryFromMap(String str) => Category.fromMap(json.decode(str));

String categoryToMap(Category data) => json.encode(data.toMap());

class Category {
    Category({
        this.id = 0,
        this.name,
        this.restaurantId = 0,
    });

    int id;
    String name;
    int restaurantId;

    factory Category.fromMap(Map<String, dynamic> json) => Category(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        restaurantId: json["restaurantId"] == null ? null : json["restaurantId"],
    );

    Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "restaurantId": restaurantId == null ? null : restaurantId,
    };
}