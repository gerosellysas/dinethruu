import 'package:dinethruu/utils/utilColors.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';

import 'totalCalculateCard.dart';

class TotalCalculate extends StatelessWidget {
  final double orderAmount;
  final double discount;
  final double subtotal;
  final double tax;
  final double fees;
  final double totalAmount;

  const TotalCalculate({
    Key key,
    this.orderAmount,
    this.discount,
    this.subtotal,
    this.tax,
    this.fees,
    this.totalAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(top: w * 0.04),
      color: UtilColors.orderDetailsCardBg,
      child: Column(
        children: [
          TotalCalculateCard(
            title: Text(
              UtilString.orderDetailsOrderAmount,
              style: TextStyle(
                  color: UtilColors.orderDetailsBodyRegularText,
                  fontSize: UtilString.fontSizeOrderDetailsOrderListRegular,
                  fontWeight: FontWeight.w400),
            ),
            price: "Rs $orderAmount",
          ),
          TotalCalculateCard(
            height: 35,
            title: Text.rich(
              TextSpan(
                text: "${UtilString.orderDetailsDiscount}\n",
                style: TextStyle(
                    color: UtilColors.orderDetailsBodyRegularText,
                    fontSize: UtilString.fontSizeOrderDetailsOrderListRegular,
                    fontWeight: FontWeight.w400),
                children: [
                  TextSpan(
                    text: "20% OFF",
                    style: TextStyle(
                        color: UtilColors.orderDetailsBodyRegularText,
                        fontSize: UtilString.fontSizeOrderDetailsOrderListSmall,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            price: "($discount)",
            priceColor: UtilColors.orderDetailDiscAndFees,
          ),
          TotalCalculateCard(
            title: Text(
              UtilString.orderDetailsSubtotal,
              style: TextStyle(
                  color: UtilColors.orderDetailsBodyRegularText,
                  fontSize: UtilString.fontSizeOrderDetailsOrderListRegular,
                  fontWeight: FontWeight.w400),
            ),
            price: "Rs $subtotal",
          ),
          TotalCalculateCard(
            height: 35,
            title: Text.rich(
              TextSpan(
                text: "${UtilString.orderDetailsTax}\n",
                style: TextStyle(
                    color: UtilColors.orderDetailsBodyRegularText,
                    fontSize: UtilString.fontSizeOrderDetailsOrderListRegular,
                    fontWeight: FontWeight.w400),
                children: [
                  TextSpan(
                    text: UtilString.orderDetailsTaxExplain,
                    style: TextStyle(
                        color: UtilColors.orderDetailsBodyRegularText,
                        fontSize: UtilString.fontSizeOrderDetailsOrderListSmall,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            price: "Rs $tax",
            priceColor: UtilColors.orderDetailDiscAndFees,
          ),
          TotalCalculateCard(
            height: 35,
            title: Text.rich(
              TextSpan(
                text: "${UtilString.orderDetailsFees}\n",
                style: TextStyle(
                    color: UtilColors.orderDetailsBodyRegularText,
                    fontSize: UtilString.fontSizeOrderDetailsOrderListRegular,
                    fontWeight: FontWeight.w400),
                children: [
                  TextSpan(
                    text: UtilString.orderDetailsFeesExplain,
                    style: TextStyle(
                        color: UtilColors.orderDetailsBodyRegularText,
                        fontSize: UtilString.fontSizeOrderDetailsOrderListSmall,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            price: "(Rs $fees)",
            priceColor: UtilColors.orderDetailDiscAndFees,
          ),
          Divider(thickness: 0.1, color: UtilColors.homeLineBorder),
          TotalCalculateCard(
            height: 50,
            title: Text.rich(
              TextSpan(
                text: "${UtilString.orderDetailsTotal}\n",
                style: TextStyle(
                    color: UtilColors.orderDetailsTotal,
                    fontSize: UtilString.fontSizeOrderDetailsOrderListTotal,
                    fontWeight: FontWeight.w600),
                children: [
                  TextSpan(
                    text: UtilString.orderDetailsTotalExplain,
                    style: TextStyle(
                        color: UtilColors.orderDetailsTotal,
                        fontSize: UtilString.fontSizeOrderDetailsOrderListSmall,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            price: "Rs $totalAmount",
            priceColor: UtilColors.orderDetailsTotal,
            priceSize: UtilString.fontSizeOrderDetailsOrderListTotal,
          ),
        ],
      ),
    );
  }
}
