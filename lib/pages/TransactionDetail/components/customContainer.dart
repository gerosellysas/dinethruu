
import 'package:dinethruu/utils/utilColors.dart';
import 'package:flutter/material.dart';

class CustomOrderTransactionDetailContainer extends StatelessWidget {
  final double height;
  final String textDetailTitle;
  final String textDetail;
  final Color titleFontColor;
  final Color detailFontColor;
  final double titleFontSize;
  final double detailFontSize;
  final String titleFontFamily;
  final String detailFontFamily;
  final FontWeight titleFontWeight;
  final FontWeight detailFontWeight;

  const CustomOrderTransactionDetailContainer({
    Key key,
    this.height,
    this.textDetailTitle,
    this.textDetail,
    this.titleFontColor,
    this.detailFontColor,
    this.titleFontSize,
    this.detailFontSize,
    this.titleFontFamily,
    this.detailFontFamily = "",
    this.titleFontWeight,
    this.detailFontWeight = FontWeight.bold,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(23, 10, 23, 10),
      height: height,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: UtilColors.transactionDetailListBg,
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: UtilColors.transactionDetailListDivider.withOpacity(0.3),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            textDetailTitle,
            style: TextStyle(
              color: titleFontColor,
              fontSize: titleFontSize,
              fontFamily: titleFontFamily,
              fontWeight: titleFontWeight,
            ),
          ),
          Text(
            textDetail,
            style: TextStyle(
              color: detailFontColor,
              fontSize: detailFontSize,
              fontFamily: detailFontFamily,
              fontWeight: detailFontWeight,
            ),
          ),
        ],
      ),
    );
  }
}
