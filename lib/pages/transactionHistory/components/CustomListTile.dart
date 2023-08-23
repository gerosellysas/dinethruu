import 'package:flutter/material.dart';
import '../../../utils/utilColors.dart';

class CustomListTile extends StatelessWidget {
  final String date;
  final String description;
  final String totalAmount;
  final String additionalDescription;
  final String status;
  final int transactionTypeId;
  final Function onTap;

  const CustomListTile({
    Key key,
    this.date = "",
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
      child: Column(
        children: [
          Container(
            width: w,
            height: 40,
            padding: EdgeInsets.symmetric(horizontal: w * 0.04),
            alignment: Alignment.centerLeft,
            color: UtilColors.transactionHistoryDateBarBg,
            child: Text(
              "$date",
              style: TextStyle(color: UtilColors.transactionHistoryListDivider),
              textAlign: TextAlign.left,
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            child: Container(
              width: double.maxFinite,
              height: 50,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: w * 0.04),
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "$description",
                          style: TextStyle(
                              color: UtilColors.transactionHistoryListTitle,
                              ),
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        width: w * 0.25,
                        alignment: Alignment.centerRight,
                        child: Text(
                          transactionTypeId == 1
                              ? "+Rs $totalAmount"
                              : "-Rs $totalAmount",
                          style: TextStyle(
                              color: UtilColors.transactionHistoryListTitle),
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        width: 20,
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 14,
                          color: UtilColors.transactionHistoryListTitle,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "$additionalDescription",
                          style: TextStyle(
                              color: UtilColors.transactionHistoryListDivider),
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        width: w * 0.25,
                        alignment: Alignment.centerRight,
                        child: Text(
                          "$status",
                          style: TextStyle(
                              color: UtilColors.transactionHistoryListDivider),
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        width: 20,
                      ),
                    ],
                  )
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
