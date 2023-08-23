import 'package:dinethruu/controllers/summaryController.dart';
import 'package:dinethruu/models/wallet.dart';
import 'package:dinethruu/utils/utilColors.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/customBottomNav.dart';
import 'components/balanceDisplay.dart';
import 'components/customTextField.dart';

class WithdrawalRequest extends StatefulWidget {
  @override
  _WithdrawalRequestState createState() => _WithdrawalRequestState();
}

class _WithdrawalRequestState extends State<WithdrawalRequest> {
  final SummaryController summaryController = Get.put(SummaryController());
  Wallet wallet = Wallet();
  bool isHintVisible = true;

  @override
  void initState() {
    super.initState();
    wallet = Get.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: UtilColors.bgWhite,
      appBar: appBar(context),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BalanceDisplay(
              labelText: UtilString.wdReqYourBalanceLabel,
              text: wallet.balance.toString(),
            ),
            BalanceDisplay(
              labelText: UtilString.wdReqAvailableBalanceLabel,
              text: wallet.withdrawableBalance.toString(),
            ),
            CustomWdReqTextField(
                isHintVisible: isHintVisible,
                controller: summaryController.withdrawTxtFieldController.value,
                onTap: () {
                  setState(
                    () {
                      isHintVisible = false;
                    },
                  );
                }),
            Expanded(
              child: SizedBox(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNav(
        onSendReqTap: () {
          summaryController.withdrawalRequest();
        },
        onCancelTap: () {
          Get.back();
        },
      ),
    );
  }
}

Widget appBar(BuildContext context) {
  return AppBar(
    title: Text(
      UtilString.wdReqTitle,
      style: TextStyle(
        color: UtilColors.wdReqTitle,
        fontSize: UtilString.fontSizeWDReqTitle,
        fontWeight: FontWeight.bold,
      ),
    ),
    backgroundColor: UtilColors.wdReqAppBarBg,
    elevation: 0,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back_ios_outlined,
        color: UtilColors.wdReqTitle,
      ),
      onPressed: () {
        Get.back();
      },
    ),
  );
}
