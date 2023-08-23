import 'package:auto_size_text/auto_size_text.dart';
import 'package:dinethruu/utils/utilColors.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  final String title;
  final int number;
  final double subTotal;

  const OrderCard({
    Key key,
    this.title = "",
    this.number = 0,
    this.subTotal = 0,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      height: 40,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: UtilColors.orderDetailsCardBg,
        border: Border(
          bottom:
              BorderSide(width: 1, color: UtilColors.orderDetailsLineBorder),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: double.maxFinite,
              width: double.maxFinite,
              alignment: Alignment.centerLeft,
              color: UtilColors.orderDetailsCardBg,
              child: AutoSizeText(
                "$title x $number",
                style: TextStyle(
                  color: UtilColors.orderDetailsBodyBoldText,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.left,
                presetFontSizes: [
                  UtilString.fontSizeOrderDetailsOrderListProduct,
                ],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Container(
            height: double.maxFinite,
            width: w * 0.25,
            alignment: Alignment.centerRight,
            color: UtilColors.orderDetailsCardBg,
            child: AutoSizeText(
              "Rs $subTotal",
              style: TextStyle(
                color: UtilColors.orderDetailsBodyBoldText,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
              presetFontSizes: [
                UtilString.fontSizeOrderDetailsOrderListRegular,
              ],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
