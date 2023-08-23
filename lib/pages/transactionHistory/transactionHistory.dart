import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/utilColors.dart';
import '../../utils/utilString.dart';
import 'components/body.dart';

class TransactionHistory extends StatefulWidget {
  @override
  _TransactionHistoryState createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: UtilColors.bgWhite,
      appBar: AppBar(
        title: Text(
          UtilString.transactionHistoryTitle,
          style: TextStyle(
            color: UtilColors.transactionHistoryTitle,
            fontSize: UtilString.fontSizeTransactionHistoryTitle,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: UtilColors.transactionHistoryAppBarBg,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: UtilColors.transactionHistoryTitle,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Body(),
    );
  }
}
