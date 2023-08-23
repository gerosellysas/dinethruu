// To parse this JSON data, do
//
//     final foodsCategory = foodsCategoryFromMap(jsonString);

import 'dart:convert';

FoodsCategory foodsCategoryFromMap(String str) => FoodsCategory.fromMap(json.decode(str));

String foodsCategoryToMap(FoodsCategory data) => json.encode(data.toMap());

class FoodsCategory {
    FoodsCategory({
        this.id,
        this.name,
        this.imageUrl,
        this.isAvailable,
        this.isVegan,
        this.isHalal,
        this.price,
        this.salePrice,
        this.description,
    });

    int id;
    String name;
    String imageUrl;
    bool isAvailable;
    bool isVegan;
    bool isHalal;
    double price;
    double salePrice;
    String description;

    factory FoodsCategory.fromMap(Map<String, dynamic> json) => FoodsCategory(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
        isAvailable: json["isAvailable"] == null ? null : json["isAvailable"],
        isVegan: json["isVegan"] == null ? null : json["isVegan"],
        isHalal: json["isHalal"] == null ? null : json["isHalal"],
        price: json["price"] == null ? null : json["price"].toDouble(),
        salePrice: json["salePrice"] == null ? null : json["salePrice"].toDouble(),
        description: json["description"] == null ? null : json["description"],
    );

    Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "imageUrl": imageUrl == null ? null : imageUrl,
        "isAvailable": isAvailable == null ? null : isAvailable,
        "isVegan": isVegan == null ? null : isVegan,
        "isHalal": isHalal == null ? null : isHalal,
        "price": price == null ? null : price,
        "salePrice": salePrice == null ? null : salePrice,
        "description": description == null ? null : description,
    };
}
