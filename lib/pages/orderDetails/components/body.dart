import 'package:dinethruu/controllers/orderController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import 'header.dart';
import 'orderCard.dart';
import 'orderInformation.dart';
import 'totalCalculate.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final OrderController orderController = Get.put(OrderController());
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      child: Obx(
        () => Stack(
          children: [
            Column(
              children: [
                Obx(
                  () => Header(
                    customerName: orderController.isGetDataComplete.value
                        ? orderController.orderDetail.value.customerName
                        : "",
                    customerPhone: orderController.isGetDataComplete.value
                        ? orderController.orderDetail.value.customerPhone
                        : "",
                    tripCompany: orderController.isGetDataComplete.value
                        ? orderController.orderDetail.value.tripCompany
                        : "",
                    tripVehicleNo: orderController.isGetDataComplete.value
                        ? orderController.orderDetail.value.tripVehicleNo
                        : "",
                    orderDate: orderController.isGetDataComplete.value
                        ? orderController.orderDetail.value.orderDate
                        : "",
                    orderType: orderController.isGetDataComplete.value
                        ? orderController.orderDetail.value.orderType
                        : "",
                  ),
                ),
                Obx(
                  () => OrderInformation(
                    referenceNo: orderController.isGetDataComplete.value
                        ? orderController.orderDetail.value.referenceNo
                        : "",
                    orderStatus: orderController.isGetDataComplete.value
                        ? orderController.orderDetail.value.orderStatus
                        : "",
                  ),
                ),
                Expanded(
                  child: Container(
                    padding:
                        EdgeInsets.fromLTRB(w * 0.06, 0, w * 0.06, w * 0.03),
                    child: Obx(
                      () => orderController.isGetDataComplete.value
                          ? ListView.builder(
                              padding: EdgeInsets.zero,
                              // controller: _scrollController,
                              itemCount:
                                  orderController.orderDetailMenus.length + 1,
                              itemBuilder: (context, index) {
                                if (index ==
                                    orderController.orderDetailMenus.length) {
                                  return TotalCalculate(
                                    orderAmount: orderController
                                        .orderDetail.value.subTotalAmount,
                                    discount: (orderController
                                                .orderDetail.value.discount ==
                                            null)
                                        ? 0
                                        : orderController
                                            .orderDetail.value.discount,
                                    subtotal: orderController
                                        .orderDetail.value.subTotalAmount,
                                    tax: orderController
                                        .orderDetail.value.taxAmount,
                                    fees: orderController
                                        .orderDetail.value.processingFee,
                                    totalAmount: orderController
                                        .orderDetail.value.totalAmount,
                                  );
                                }
                                return OrderCard(
                                  number:
                                      orderController.orderDetailQties[index],
                                  subTotal: orderController
                                      .orderDetailTotalPrices[index],
                                  title:
                                      orderController.orderDetailMenus[index],
                                );
                              },
                            )
                          : Container(),
                    ),
                  ),
                ),
              ],
            ),
            orderController.isGetDataComplete.value
                ? Container()
                : SpinKitChasingDots(color: Colors.black38, size: h * 0.1),
          ],
        ),
      ),
    );
  }
}
