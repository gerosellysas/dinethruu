import 'package:dinethruu/utils/utilColors.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';

import 'customCardListTile.dart';

class OrderDetailCard extends StatelessWidget {
  final String orderDate;
  final String referenceNo;
  final double totalAmount;

  const OrderDetailCard({
    Key key,
    this.orderDate = "",
    this.referenceNo = "",
    this.totalAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCardListTile(
          textDetailTitle: UtilString.rejectCancelOrderDate,
          titleFontColor: UtilColors.rejectCancelOrderRegularText,
          titleFontSize: UtilString.fontSizeRejectCancelOrderRegularText,
          textDetail: "$orderDate",
          detailFontColor: UtilColors.rejectCancelOrderRegularText,
          detailFontSize: UtilString.fontSizeRejectCancelOrderRegularText,
          detailFontWeight: FontWeight.bold,
        ),
        CustomCardListTile(
          textDetailTitle: UtilString.rejectCancelOrderRefNo,
          titleFontColor: UtilColors.rejectCancelOrderRegularText,
          titleFontSize: UtilString.fontSizeRejectCancelOrderRegularText,
          textDetail: "$referenceNo",
          detailFontColor: UtilColors.rejectCancelOrderRefNoDetail,
          detailFontSize: UtilString.fontSizeRejectCancelOrderRefNoDetail,
          detailFontWeight: FontWeight.w600,
        ),
        CustomCardListTile(
          textDetailTitle: UtilString.rejectCancelOrderTotalAmount,
          titleFontColor: UtilColors.rejectCancelOrderRegularText,
          titleFontSize: UtilString.fontSizeRejectCancelOrderRegularText,
          textDetail: "Rs $totalAmount",
          detailFontColor: UtilColors.rejectCancelOrderRegularText,
          detailFontSize: UtilString.fontSizeRejectCancelOrderRegularText,
          detailFontWeight: FontWeight.w600,
        ),
      ],
    );
  }
}
