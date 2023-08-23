import 'package:dinethruu/utils/utilColors.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';
import 'customContainer.dart';

class TransactionAmountListDetail extends StatefulWidget {
  final String amount;
  final String fees;
  final String totalAmount;

  const TransactionAmountListDetail({
    Key key,
    this.amount = "",
    this.fees = "",
    this.totalAmount = "",
  }) : super(key: key);

  @override
  _TransactionAmountListDetailState createState() =>
      _TransactionAmountListDetailState();
}

class _TransactionAmountListDetailState
    extends State<TransactionAmountListDetail> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomOrderTransactionDetailContainer(
          height: 50,
          textDetailTitle: UtilString.transactionAmount,
          titleFontColor: UtilColors.transactionDetailText,
          titleFontSize: UtilString.fontSizeTransactionDetailText1,
          textDetail: widget.amount,
          detailFontColor: UtilColors.transactionDetailText,
          detailFontSize: UtilString.fontSizeTransactionDetailText3,
        ),
        CustomOrderTransactionDetailContainer(
          height: 50,
          textDetailTitle: UtilString.transactionFees,
          titleFontColor: UtilColors.transactionDetailText,
          titleFontSize: UtilString.fontSizeTransactionDetailText1,
          textDetail: widget.fees,
          detailFontColor: UtilColors.transactionDetailRedText,
          detailFontSize: UtilString.fontSizeTransactionDetailText3,
        ),
        CustomOrderTransactionDetailContainer(
          height: 50,
          textDetailTitle: UtilString.transactionTotalAmount,
          titleFontColor: UtilColors.transactionDetailTotalAmountText,
          titleFontSize: UtilString.fontSizeTransactionDetailText1,
          textDetail: widget.totalAmount,
          detailFontColor: UtilColors.transactionDetailTotalAmountText,
          detailFontSize: UtilString.fontSizeTransactionDetailText2,
        ),
      ],
    );
  }
}
