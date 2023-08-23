// To parse this JSON data, do
//
//     final transaction = transactionFromMap(jsonString);

import 'dart:convert';

Transaction transactionFromMap(String str) =>
    Transaction.fromMap(json.decode(str));

String transactionToMap(Transaction data) => json.encode(data.toMap());

class Transaction {
  Transaction({
    this.id,
    this.referenceNo,
    this.restaurantName,
    this.amount,
    this.totalFees,
    this.totalAmount,
    this.balanceBefore,
    this.balanceAfter,
    this.description,
    this.additionalDescription,
    this.transactionStatusId,
    this.transactionStatus,
    this.transactionTypeId,
    this.transactionType,
    this.transactionDate,
  });

  int id;
  String referenceNo;
  String restaurantName;
  double amount;
  double totalFees;
  double totalAmount;
  double balanceBefore;
  double balanceAfter;
  String description;
  String additionalDescription;
  int transactionStatusId;
  String transactionStatus;
  int transactionTypeId;
  String transactionType;
  String transactionDate;

  factory Transaction.fromMap(Map<String, dynamic> json) => Transaction(
        id: json["id"] == null ? null : json["id"],
        referenceNo: json["referenceNo"] == null ? null : json["referenceNo"],
        restaurantName:
            json["restaurantName"] == null ? null : json["restaurantName"],
        amount: json["amount"] == null ? null : json["amount"].toDouble(),
        totalFees:
            json["totalFees"] == null ? null : json["totalFees"].toDouble(),
        totalAmount:
            json["totalAmount"] == null ? null : json["totalAmount"].toDouble(),
        balanceBefore: json["balanceBefore"] == null
            ? null
            : json["balanceBefore"].toDouble(),
        balanceAfter: json["balanceAfter"] == null
            ? null
            : json["balanceAfter"].toDouble(),
        description: json["description"] == null ? null : json["description"],
        additionalDescription: json["additionalDescription"] == null
            ? null
            : json["additionalDescription"],
        transactionStatusId: json["transactionStatusId"] == null
            ? null
            : json["transactionStatusId"],
        transactionStatus: json["transactionStatus"] == null
            ? null
            : json["transactionStatus"],
        transactionTypeId: json["transactionTypeId"] == null
            ? null
            : json["transactionTypeId"],
        transactionType:
            json["transactionType"] == null ? null : json["transactionType"],
        transactionDate:
            json["transactionDate"] == null ? null : json["transactionDate"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "referenceNo": referenceNo == null ? null : referenceNo,
        "restaurantName": restaurantName == null ? null : restaurantName,
        "amount": amount == null ? null : amount,
        "totalFees": totalFees == null ? null : totalFees,
        "totalAmount": totalAmount == null ? null : totalAmount,
        "balanceBefore": balanceBefore == null ? null : balanceBefore,
        "balanceAfter": balanceAfter == null ? null : balanceAfter,
        "description": description == null ? null : description,
        "additionalDescription":
            additionalDescription == null ? null : additionalDescription,
        "transactionStatusId":
            transactionStatusId == null ? null : transactionStatusId,
        "transactionStatus":
            transactionStatus == null ? null : transactionStatus,
        "transactionTypeId":
            transactionTypeId == null ? null : transactionTypeId,
        "transactionType": transactionType == null ? null : transactionType,
        "transactionDate": transactionDate == null ? null : transactionDate,
      };
}
