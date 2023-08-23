import 'package:dinethruu/utils/utilColors.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  final String customerName;
  final String customerPhone;
  final String orderDate;
  final String orderType;
  final String tripCompany;
  final String tripVehicleNo;

  const Header({
    Key key,
    this.customerName = "",
    this.customerPhone = "",
    this.orderDate = "",
    this.orderType = "",
    this.tripCompany = "",
    this.tripVehicleNo = "",
  }) : super(key: key);
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      height: 120,
      width: double.maxFinite,
      padding: EdgeInsets.fromLTRB(w * 0.06, 0, w * 0.06, w * 0.03),
      color: UtilColors.orderDetailsHeaderBg,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              text: "${widget.customerName}\n",
              style: TextStyle(
                  color: UtilColors.orderDetailsHeaderText,
                  fontSize: UtilString.fontSizeOrderDetailsHeaderName,
                  fontWeight: FontWeight.w600),
              children: [
                TextSpan(
                  text: "${widget.customerPhone}",
                  style: TextStyle(
                      color: UtilColors.orderDetailsHeaderText,
                      fontSize: UtilString.fontSizeOrderDetailsHeaderTitleText,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Expanded(child: Container()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  text: "${widget.tripCompany}\n",
                  style: TextStyle(
                      color: UtilColors.orderDetailsHeaderText,
                      fontSize: UtilString.fontSizeOrderDetailsHeaderTitleText,
                      fontWeight: FontWeight.w400),
                  children: [
                    TextSpan(
                      text: "${widget.orderType}",
                      style: TextStyle(
                          color: UtilColors.orderDetailsHeaderText,
                          fontSize: UtilString.fontSizeOrderDetailsHeaderText,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  text: "${widget.tripVehicleNo}\n",
                  style: TextStyle(
                      color: UtilColors.orderDetailsHeaderText,
                      fontSize: UtilString.fontSizeOrderDetailsHeaderTitleText,
                      fontWeight: FontWeight.w400),
                  children: [
                    TextSpan(
                      text: "${widget.orderDate}",
                      style: TextStyle(
                          color: UtilColors.orderDetailsHeaderText,
                          fontSize: UtilString.fontSizeOrderDetailsHeaderText,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
