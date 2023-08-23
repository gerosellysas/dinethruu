import 'package:dinethruu/components/CustomButton.dart';
import 'package:dinethruu/controllers/summaryController.dart';
import 'package:dinethruu/pages/transactionDetail/transactionDetail.dart';
import 'package:dinethruu/pages/transactionHistory/transactionHistory.dart';
import 'package:dinethruu/pages/withdrawalRequest/withdrawalRequest.dart';
import 'package:dinethruu/utils/utilColors.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import 'components/customListTile.dart';
import 'components/header.dart';

class SummaryMenu extends StatefulWidget {
  @override
  _SummaryMenuState createState() => _SummaryMenuState();
}

class _SummaryMenuState extends State<SummaryMenu> {
  final SummaryController summaryController = Get.put(SummaryController());

  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration(milliseconds: 200), () => summaryController.getSummary());
  }

  // int itemCount = 4;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: UtilColors.bgWhite,
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: UtilColors.bgWhite,
        child: Obx(
          () => Stack(
            children: [
              Column(
                children: [
                  Header(
                    restaurantName:
                        (summaryController.wallet.value.restaurantName ==
                                    null ||
                                !summaryController.isGetDataComplete.value)
                            ? ""
                            : summaryController.wallet.value.restaurantName,
                    totalOrders: (summaryController.wallet.value.totalOrders ==
                                null ||
                            !summaryController.isGetDataComplete.value)
                        ? ""
                        : summaryController.wallet.value.totalOrders.toString(),
                    totalSales: (summaryController.wallet.value.totalSales ==
                                null ||
                            !summaryController.isGetDataComplete.value)
                        ? ""
                        : "Rs ${summaryController.wallet.value.totalSales.toString()}",
                    monthSales: (summaryController.wallet.value.monthSales ==
                                null ||
                            !summaryController.isGetDataComplete.value)
                        ? ""
                        : "Rs ${summaryController.wallet.value.monthSales.toString()}",
                    balance: (summaryController.wallet.value.balance == null ||
                            !summaryController.isGetDataComplete.value)
                        ? ""
                        : "Rs ${summaryController.wallet.value.balance.toString()}",
                  ),
                  summaryController.isGetDataComplete.value
                      ? CustomButton(
                          bgColor: Colors.transparent,
                          width: w * 0.5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                UtilString.summaryWithdraw,
                                style: TextStyle(
                                    color:
                                        UtilColors.summaryBodyWithdrawAllTransc,
                                    fontSize:
                                        UtilString.fontSizeSummaryWithDraw,
                                    fontWeight: FontWeight.w600),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: UtilColors.summaryBodyWithdrawAllTransc,
                              )
                            ],
                          ),
                          onTap: () async {
                            var refresh = await Get.to(
                                () => WithdrawalRequest(),
                                arguments: summaryController.wallet.value);
                            print("refresh $refresh");
                            if (refresh != null) {
                              print("hore");
                              await summaryController.getSummary();
                            }
                          },
                        )
                      : Container(),
                  summaryController.isGetDataComplete.value
                      ? Container(
                          height: 35,
                          alignment: Alignment.centerLeft,
                          width: double.maxFinite,
                          margin: EdgeInsets.only(top: 5),
                          padding: EdgeInsets.symmetric(horizontal: w * 0.08),
                          color: UtilColors.bgWhite,
                          child: Text(
                            UtilString.summaryRecentTransc,
                            style: TextStyle(
                                color: UtilColors.summaryBodyRegularText,
                                fontSize:
                                    UtilString.fontSizeSummaryBodyRecentTransc,
                                fontWeight: FontWeight.w400),
                          ),
                        )
                      : Container(),
                  summaryController.isGetDataComplete.value
                      ? Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount:
                                summaryController.recentTransaction.length + 1,
                            itemBuilder: (context, index) {
                              if (index ==
                                  summaryController.recentTransaction.length) {
                                return CustomButton(
                                  bgColor: Colors.transparent,
                                  width: w * 0.5,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        UtilString.summaryAllTransaction,
                                        style: TextStyle(
                                            color: UtilColors
                                                .summaryBodyWithdrawAllTransc,
                                            fontSize: UtilString
                                                .fontSizeSummaryAllTransaction,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        color: UtilColors
                                            .summaryBodyWithdrawAllTransc,
                                      )
                                    ],
                                  ),
                                  onTap: () {
                                    Get.to(() => TransactionHistory());
                                  },
                                );
                              } else {
                                return CustomListTile(
                                  description: summaryController
                                      .recentTransaction[index].description,
                                  additionalDescription: summaryController
                                      .recentTransaction[index]
                                      .additionalDescription,
                                  totalAmount:
                                      "${summaryController.recentTransaction[index].totalAmount}",
                                  transactionTypeId: summaryController
                                      .recentTransaction[index]
                                      .transactionTypeId,
                                  status: summaryController
                                      .recentTransaction[index]
                                      .transactionStatus,
                                  onTap: () {
                                    summaryController.isGetDataComplete.value =
                                        false;
                                    Get.to(() => TransactionDetail(),
                                        arguments: summaryController
                                            .recentTransaction[index].id);
                                  },
                                );
                              }
                            },
                          ),
                        )
                      : Container(),
                ],
              ),
              summaryController.isGetDataComplete.value
                  ? Container()
                  : SpinKitChasingDots(color: Colors.black38, size: h * 0.1),
            ],
          ),
        ),
      ),
    );
  }
}
