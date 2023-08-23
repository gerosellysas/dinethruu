import 'package:dinethruu/controllers/dateFilterController.dart';
import 'package:dinethruu/controllers/summaryController.dart';
import 'package:dinethruu/pages/TransactionDetail/TransactionDetail.dart';
import 'package:dinethruu/pages/transactionHistory/components/customDIalogBox.dart';
import 'package:dinethruu/pages/transactionHistory/components/dateBarFilter.dart';
import 'package:dinethruu/pages/transactionHistory/components/displayCalendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import 'CustomListTile.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final SummaryController summaryController = Get.put(SummaryController());
  final DateFilterController dateFilterController =
      Get.put(DateFilterController());
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 200),
        () => summaryController.getAllTransaction());
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Obx(
          () => DateBarFilter(
            startDateController: dateFilterController.startDateController.value,
            onStartDateTap: () {
              dateFilterController.onStartDateTapped();
            },
            endDateController: dateFilterController.endDateController.value,
            onEndDateTap: () async {
              var result = await dateFilterController.onEndDateTapped();
              print("result ${dateFilterController.isFilter.value}");
              if (dateFilterController.isFilter.value) {
                setState(() {});

                await summaryController.filterByDate(
                    dateFilterController.selectStartDate.value,
                    dateFilterController.selectEndDate.value);
              }
              //  await summaryController.filterByDate(selectStartDate.value, selectEndDate.value);
            },
          ),
        ),
        Expanded(
          child: Container(
            width: double.maxFinite,
            child: Obx(
              () => summaryController.isGetDataComplete.value
                  ? Obx(
                      () => ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: summaryController.viewTransaction.length,
                        itemBuilder: (context, index) {
                          return CustomListTile(
                            date: summaryController
                                .viewTransaction[index].transactionDate,
                            description: summaryController
                                .viewTransaction[index].description,
                            totalAmount:
                                // "${summaryController.viewTransaction[index].totalAmount}",
                                "${summaryController.viewTransaction.length}",
                            additionalDescription: summaryController
                                .viewTransaction[index].additionalDescription,
                            status: summaryController
                                .viewTransaction[index].transactionStatus,
                            transactionTypeId: summaryController
                                .viewTransaction[index].transactionTypeId,
                            onTap: () {
                              summaryController.isGetDataComplete.value = false;
                              Get.to(() => TransactionDetail(),
                                  arguments: summaryController
                                      .viewTransaction[index].id);
                            },
                          );
                        },
                      ),
                    )
                  : SpinKitChasingDots(color: Colors.black38, size: h * 0.1),
            ),
          ),
        ),
      ],
    );
  }
}
