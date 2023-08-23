import 'package:dinethruu/controllers/summaryController.dart';
import 'package:dinethruu/utils/utilColors.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import 'components/transactionAmountDetail.dart';
import 'components/transactionListDetail.dart';

class TransactionDetail extends StatefulWidget {
  @override
  _TransactionDetailState createState() => _TransactionDetailState();
}

class _TransactionDetailState extends State<TransactionDetail> {
  final SummaryController summaryController = Get.put(SummaryController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var id = Get.arguments;
    print("id => $id");
    Future.delayed(Duration(milliseconds: 200),
        () => summaryController.getTransactionDetail(id));
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: UtilColors.transactionDetailPageBg,
      appBar: AppBar(
        title: Text(
          UtilString.transactionDetailTitle,
          style: TextStyle(
            color: UtilColors.transactionDetailTitle,
            fontSize: UtilString.fontSizeTransactionDetailTitle,
            fontWeight: FontWeight.bold,
            fontFamily: "poppins",
          ),
        ),
        backgroundColor: UtilColors.transactionDetailAppBarBg,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: UtilColors.transactionDetailTitle,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Obx(
        () => summaryController.isGetDataComplete.value
            ? Column(
                children: [
                  TransactionListDetail(
                    transactionDate: summaryController
                        .transactionDetail.value.transactionDate,
                    referenceNo:
                        summaryController.transactionDetail.value.referenceNo,
                    transactionType: summaryController
                        .transactionDetail.value.transactionType,
                    transactionStatus: summaryController
                        .transactionDetail.value.transactionStatus,
                  ),
                  SizedBox(height: 14),
                  TransactionAmountListDetail(
                    amount: summaryController
                                .transactionDetail.value.transactionTypeId ==
                            1
                        ? "+Rs ${summaryController.transactionDetail.value.amount}"
                        : "-Rs ${summaryController.transactionDetail.value.amount}",
                    fees:
                        "-Rs ${summaryController.transactionDetail.value.totalFees}",
                    totalAmount: summaryController
                                .transactionDetail.value.transactionTypeId ==
                            1
                        ? "+Rs ${summaryController.transactionDetail.value.totalAmount}"
                        : "-Rs ${summaryController.transactionDetail.value.totalAmount}",
                  ),
                  SizedBox(height: 14),
                  Container(
                    height: 130,
                    width: double.maxFinite,
                    color: UtilColors.transactionDetailListBg,
                    child: Center(
                      child: Text(
                        summaryController.transactionDetail.value
                                    .transactionTypeId ==
                                1
                            ? "+Rs ${summaryController.transactionDetail.value.totalAmount}"
                            : "-Rs ${summaryController.transactionDetail.value.totalAmount}",
                        style: TextStyle(
                          color: summaryController.transactionDetail.value
                                      .transactionTypeId ==
                                  1
                              ? UtilColors.transactionDetailGreenText
                              : UtilColors.transactionDetailRedText,
                          fontSize: UtilString.fontSizeTransactionDetailText4,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : SpinKitChasingDots(color: Colors.black38, size: h * 0.1),
      ),
    );
  }
}
