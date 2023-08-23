import 'package:auto_size_text/auto_size_text.dart';
import 'package:dinethruu/utils/utilColors.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';

class TotalCalculateCard extends StatelessWidget {
  final Widget title;
  final String price;
  final Color priceColor;
  final double height;
  final double priceSize;

  const TotalCalculateCard({
    Key key,
    this.price = "",
    this.title,
    this.priceColor = Colors.grey,
    this.height = 25,
    this.priceSize = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    Color color = Colors.grey;
    double sizeOfPrice = 10;
    //
    (priceColor == color)
        ? color = UtilColors.orderDetailsBodyBoldText
        : color = priceColor;
    (priceSize == sizeOfPrice)
        ? sizeOfPrice = UtilString.fontSizeOrderDetailsOrderListRegular
        : sizeOfPrice = priceSize;
    //
    return Container(
      height: height,
      width: double.maxFinite,
      alignment: Alignment.center,
      color: UtilColors.orderDetailsCardBg,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: double.maxFinite,
              width: double.maxFinite,
              alignment: Alignment.centerLeft,
              color: UtilColors.orderDetailsCardBg,
              child: title,
            ),
          ),
          Container(
            height: double.maxFinite,
            width: w * 0.25,
            alignment: Alignment.centerRight,
            color: UtilColors.orderDetailsCardBg,
            child: AutoSizeText(
              "$price",
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
              presetFontSizes: [sizeOfPrice],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
