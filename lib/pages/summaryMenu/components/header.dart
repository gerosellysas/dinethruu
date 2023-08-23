import 'package:dinethruu/utils/utilColors.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';

import 'headerCardInformation.dart';

class Header extends StatelessWidget {
  final String restaurantName;
  final String totalOrders;
  final String totalSales;
  final String monthSales;
  final String balance;

  const Header({
    Key key,
    this.restaurantName = "",
    this.totalOrders = "",
    this.totalSales = "",
    this.monthSales = "",
    this.balance = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double topPaddingScreen = MediaQuery.of(context).padding.top;
    double headHeight = 170 + topPaddingScreen;
    return Container(
      height: headHeight + 120,
      width: double.maxFinite,
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: headHeight,
                width: double.maxFinite,
                color: UtilColors.summaryHeaderBg,
                child: Column(
                  children: [
                    Container(
                      height: topPaddingScreen,
                      width: double.maxFinite,
                      color: UtilColors.summaryHeaderBg,
                    ),
                    Container(
                      height: 60,
                      width: double.maxFinite,
                      padding: EdgeInsets.only(left: w * 0.08),
                      alignment: Alignment.centerLeft,
                      color: UtilColors.summaryHeaderBg,
                      child: Text(
                        UtilString.summaryTitle,
                        style: TextStyle(
                            color: UtilColors.summaryHeaderText,
                            fontSize: UtilString.fontSizeSummaryHeaderTitle,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  color: UtilColors.bgWhite,
                ),
              ),
            ],
          ),
          Positioned(
            top: topPaddingScreen + 61,
            left: w * 0.08,
            right: w * 0.08,
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(
                  horizontal: w * 0.066, vertical: w * 0.027),
              decoration: BoxDecoration(
                color: UtilColors.summaryHeaderCardBg,
                borderRadius: BorderRadius.circular(w * 0.05),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.17),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      text: "${UtilString.summarySecretRecipe}\n",
                      style: TextStyle(
                          color: UtilColors.summaryHeaderText,
                          fontSize:
                              UtilString.fontSizeSummaryHeaderSecretRecipeTitle,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: "$restaurantName",
                          style: TextStyle(
                              color: UtilColors.summaryHeaderText,
                              fontSize: UtilString
                                  .fontSizeSummaryHeaderSecretRecipeDetail,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: HeaderCardInformation(
                          title: UtilString.summaryTotalOrders,
                          detail: "$totalOrders",
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: HeaderCardInformation(
                          title: UtilString.summaryTotalSales,
                          detail: "$totalSales",
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: HeaderCardInformation(
                          title: UtilString.summaryMonthSales,
                          detail: "$monthSales",
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: HeaderCardInformation(
                          title: UtilString.summaryBalance,
                          detail: "$balance",
                          detailColor: UtilColors.summaryHeaderBalanceValue,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
