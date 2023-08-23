import 'package:dinethruu/utils/utilColors.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String description;
  final String totalAmount;
  final String additionalDescription;
  final String status;
  final int transactionTypeId;
  final Function onTap;

  const CustomListTile({
    Key key,
    this.description = "",
    this.totalAmount = "",
    this.additionalDescription = "",
    this.status = "",
    this.transactionTypeId = 1,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(bottom: w * 0.01),
      color: UtilColors.summaryListTileBg,
      child: Column(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            child: Container(
              width: double.maxFinite,
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: w * 0.08),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: UtilColors.summaryListTileBg,
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: UtilColors.summaryListTileDivider.withOpacity(0.3),
                  ),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: UtilColors.summaryListTileBg,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "$description",
                                  style: TextStyle(
                                      color: UtilColors.summaryBodyRegularText,
                                      fontSize: UtilString
                                          .fontSizeSummaryBodyDescription,
                                      fontWeight: FontWeight.w400),
                                  textAlign: TextAlign.left,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Container(
                                width: w * 0.25,
                                alignment: Alignment.centerRight,
                                color: UtilColors.summaryListTileBg,
                                child: Text(
                                  transactionTypeId == 1
                                      ? "+Rs $totalAmount"
                                      : "-Rs $totalAmount",
                                  style: TextStyle(
                                      color: transactionTypeId == 1
                                          ? UtilColors.summaryBodySmallText
                                          : UtilColors.summaryBodyWithdrawText,
                                      fontSize: UtilString
                                          .fontSizeSummaryBodySmallText,
                                      fontWeight: FontWeight.w400),
                                  textAlign: TextAlign.left,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Container(
                                width: 10,
                                color: UtilColors.summaryListTileBg,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "$additionalDescription",
                                  style: TextStyle(
                                      color: UtilColors.summaryBodySmallText,
                                      fontSize: UtilString
                                          .fontSizeSummaryBodySmallText,
                                      fontWeight: FontWeight.w400),
                                  textAlign: TextAlign.left,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Container(
                                width: w * 0.25,
                                alignment: Alignment.centerRight,
                                color: UtilColors.summaryListTileBg,
                                child: Text(
                                  "$status",
                                  style: TextStyle(
                                      color: UtilColors.summaryBodySmallText,
                                      fontSize: UtilString
                                          .fontSizeSummaryBodySmallText,
                                      fontWeight: FontWeight.w400),
                                  textAlign: TextAlign.left,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Container(
                                width: 10,
                                color: UtilColors.summaryListTileBg,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 20,
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: UtilColors.summaryBodyRegularText,
                    ),
                  ),
                ],
              ),
            ),
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}
