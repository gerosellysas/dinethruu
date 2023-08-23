import 'package:dinethruu/utils/utilColors.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';

import 'customContainer.dart';

class TransactionListDetail extends StatefulWidget {
  final String transactionDate;
  final String referenceNo;
  final String transactionType;
  final String transactionStatus;

  const TransactionListDetail({
    Key key,
    this.transactionDate = "",
    this.referenceNo = "",
    this.transactionType = "",
    this.transactionStatus = "",
  }) : super(key: key);

  @override
  _TransactionListDetailState createState() => _TransactionListDetailState();
}

class _TransactionListDetailState extends State<TransactionListDetail> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomOrderTransactionDetailContainer(
          height: 42,
          textDetailTitle: UtilString.transactionDate,
          titleFontColor: UtilColors.transactionDetailText,
          titleFontSize: UtilString.fontSizeTransactionDetailText1,
          textDetail: widget.transactionDate,
          detailFontColor: UtilColors.transactionDetailText,
          detailFontSize: UtilString.fontSizeTransactionDetailText1,
        ),
        CustomOrderTransactionDetailContainer(
          height: 42,
          textDetailTitle: UtilString.transactionRefNo,
          titleFontColor: UtilColors.transactionDetailText,
          titleFontSize: UtilString.fontSizeTransactionDetailText1,
          textDetail: widget.referenceNo,
          detailFontColor: UtilColors.transactionDetailRefNoText,
          detailFontSize: UtilString.fontSizeTransactionDetailText2,
        ),
        CustomOrderTransactionDetailContainer(
          height: 42,
          textDetailTitle: UtilString.transactionType,
          titleFontColor: UtilColors.transactionDetailText,
          titleFontSize: UtilString.fontSizeTransactionDetailText1,
          textDetail: widget.transactionType,
          detailFontColor: UtilColors.transactionDetailText,
          detailFontSize: UtilString.fontSizeTransactionDetailText1,
        ),
        CustomOrderTransactionDetailContainer(
          height: 42,
          textDetailTitle: UtilString.transactionStatus,
          titleFontColor: UtilColors.transactionDetailText,
          titleFontSize: UtilString.fontSizeTransactionDetailText1,
          textDetail: widget.transactionStatus,
          detailFontColor: UtilColors.transactionDetailGreenText,
          detailFontSize: UtilString.fontSizeTransactionDetailText1,
        ),
      ],
    );
  }
}
