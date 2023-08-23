// To parse this JSON data, do
//
//     final order = orderFromMap(jsonString);

import 'dart:convert';

Order orderFromMap(String str) => Order.fromMap(json.decode(str));

String orderToMap(Order data) => json.encode(data.toMap());

class Order {
  Order({
    this.id,
    this.referenceNo,
    this.orderDate,
    this.orderType,
    this.orderStatus,
    this.customerName,
    this.customerPhone,
    this.tripCompany,
    this.tripVehicleNo,
    this.discount,
    this.taxAmount,
    this.totalQty,
    this.processingFee,
    this.subTotalAmount,
    this.totalAmount,
  });

  int id;
  String referenceNo;
  String orderDate;
  String orderType;
  String orderStatus;
  String customerName;
  String customerPhone;
  String tripCompany;
  String tripVehicleNo;
  double discount;
  double taxAmount;
  int totalQty;
  double processingFee;
  double subTotalAmount;
  double totalAmount;

  factory Order.fromMap(Map<String, dynamic> json) => Order(
        id: json["id"] == null ? null : json["id"],
        referenceNo: json["referenceNo"] == null ? null : json["referenceNo"],
        orderDate: json["orderDate"] == null ? null : json["orderDate"],
        orderType: json["orderType"] == null ? null : json["orderType"],
        orderStatus: json["orderStatus"] == null ? null : json["orderStatus"],
        customerName:
            json["customerName"] == null ? null : json["customerName"],
        customerPhone:
            json["customerPhone"] == null ? null : json["customerPhone"],
        tripCompany: json["tripCompany"] == null ? null : json["tripCompany"],
        tripVehicleNo:
            json["tripVehicleNo"] == null ? null : json["tripVehicleNo"],
        discount: json["discount"] == null ? null : json["discount"].toDouble(),
        taxAmount:
            json["taxAmount"] == null ? null : json["taxAmount"].toDouble(),
        totalQty: json["totalQty"] == null ? null : json["totalQty"],
        processingFee: json["processingFee"] == null
            ? null
            : json["processingFee"].toDouble(),
        subTotalAmount: json["subTotalAmount"] == null
            ? null
            : json["subTotalAmount"].toDouble(),
        totalAmount:
            json["totalAmount"] == null ? null : json["totalAmount"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "referenceNo": referenceNo == null ? null : referenceNo,
        "orderDate": orderDate == null ? null : orderDate,
        "orderType": orderType == null ? null : orderType,
        "orderStatus": orderStatus == null ? null : orderStatus,
        "customerName": customerName == null ? null : customerName,
        "customerPhone": customerPhone == null ? null : customerPhone,
        "tripCompany": tripCompany == null ? null : tripCompany,
        "tripVehicleNo": tripVehicleNo == null ? null : tripVehicleNo,
        "discount": discount == null ? null : discount,
        "taxAmount": taxAmount == null ? null : taxAmount,
        "totalQty": totalQty == null ? null : totalQty,
        "processingFee": processingFee == null ? null : processingFee,
        "subTotalAmount": subTotalAmount == null ? null : subTotalAmount,
        "totalAmount": totalAmount == null ? null : totalAmount,
      };
}
