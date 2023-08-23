import 'package:dinethruu/utils/utilColors.dart';
import 'package:flutter/material.dart';

class CustomCardListTile extends StatelessWidget {
  final String textDetailTitle;
  final String textDetail;
  final Color titleFontColor;
  final Color detailFontColor;
  final double titleFontSize;
  final double detailFontSize;
  final FontWeight titleFontWeight;
  final FontWeight detailFontWeight;

  const CustomCardListTile({
    Key key,
    this.textDetailTitle = "",
    this.textDetail = "",
    this.titleFontColor,
    this.detailFontColor,
    this.titleFontSize,
    this.detailFontSize,
    this.titleFontWeight = FontWeight.w400,
    this.detailFontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 23, vertical: 10),
      decoration: BoxDecoration(
        color: UtilColors.rejectCancelOrderCardBg,
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: UtilColors.rejectCancelOrderListDivider.withOpacity(0.3),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "$textDetailTitle",
            style: TextStyle(
              color: titleFontColor,
              fontSize: titleFontSize,
              fontWeight: titleFontWeight,
            ),
          ),
          Text(
            "$textDetail",
            style: TextStyle(
              color: detailFontColor,
              fontSize: detailFontSize,
              fontWeight: detailFontWeight,
            ),
          ),
        ],
      ),
    );
  }
}
