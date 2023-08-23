// To parse this JSON data, do
//
//     final wallet = walletFromMap(jsonString);

import 'dart:convert';

Wallet walletFromMap(String str) => Wallet.fromMap(json.decode(str));

String walletToMap(Wallet data) => json.encode(data.toMap());

class Wallet {
  Wallet({
    this.restaurantId,
    this.restaurantName,
    this.balance,
    this.withdrawableBalance,
    this.totalOrders,
    this.totalSales,
    this.monthSales,
  });

  int restaurantId;
  String restaurantName;
  double balance;
  double withdrawableBalance;
  int totalOrders;
  double totalSales;
  double monthSales;

  factory Wallet.fromMap(Map<String, dynamic> json) => Wallet(
        restaurantId:
            json["restaurantId"] == null ? null : json["restaurantId"],
        restaurantName:
            json["restaurantName"] == null ? null : json["restaurantName"],
        balance: json["balance"] == null ? null : json["balance"].toDouble(),
        withdrawableBalance: json["withdrawableBalance"] == null
            ? null
            : json["withdrawableBalance"].toDouble(),
        totalOrders: json["totalOrders"] == null ? null : json["totalOrders"],
        totalSales:
            json["totalSales"] == null ? null : json["totalSales"].toDouble(),
        monthSales:
            json["monthSales"] == null ? null : json["monthSales"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "restaurantId": restaurantId == null ? null : restaurantId,
        "restaurantName": restaurantName == null ? null : restaurantName,
        "balance": balance == null ? null : balance,
        "withdrawableBalance":
            withdrawableBalance == null ? null : withdrawableBalance,
        "totalOrders": totalOrders == null ? null : totalOrders,
        "totalSales": totalSales == null ? null : totalSales,
        "monthSales": monthSales == null ? null : monthSales,
      };
}
