import 'package:auto_size_text/auto_size_text.dart';
import 'package:dinethruu/utils/utilColors.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';

class OrderInformation extends StatelessWidget {
  final String orderStatus;
  final String referenceNo;

  const OrderInformation({
    Key key,
    this.orderStatus = "",
    this.referenceNo = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double height = 82;
    return Container(
      height: height,
      width: double.maxFinite,
      alignment: Alignment.center,
      color: UtilColors.orderDetailsBase,
      child: Container(
        height: 60,
        width: double.maxFinite,
        padding: EdgeInsets.fromLTRB(w * 0.06, 0, w * 0.06, 0),
        alignment: Alignment.center,
        color: UtilColors.orderDetailsCardBg,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                "$referenceNo",
                style: TextStyle(
                    color: UtilColors.orderDetailsBodyBoldText,
                    fontSize: UtilString.fontSizeOrderDetailsOrderListRegular,
                    fontWeight: FontWeight.w600),
              ),
            ),
            // Text(
            //   "$orderStatus",
            //   style: TextStyle(
            //       color: UtilColors.orderDetailStatusOrder,
            //       fontSize: UtilString.fontSizeOrderDetailsOrderListRegular,
            //       fontWeight: FontWeight.w600),
            // ),
            Container(
              alignment: Alignment.centerRight,
              width: w * 0.7,
              child: AutoSizeText(
                "$orderStatus",
                style: TextStyle(
                    color: UtilColors.orderDetailStatusOrder,
                    // fontSize: UtilString.fontSizeOrderDetailsOrderListRegular,
                    fontWeight: FontWeight.w600),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.right,
                presetFontSizes: [
                  UtilString.fontSizeOrderDetailsOrderListRegular,
                  12,
                  11,
                  10,
                  9
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
