import 'package:dinethruu/controllers/orderController.dart';
import 'package:dinethruu/utils/utilColors.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import 'orderDetailCard.dart';
import 'radioButtonCard.dart';

class Body extends StatefulWidget {
  final int id;

  const Body({
    Key key,
    this.id,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final OrderController orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Obx(
      () => Stack(
        children: [
          Column(
            children: [
              Obx(
                () => orderController.isGetDataComplete.value
                    ? OrderDetailCard(
                        orderDate: orderController.orderDetail.value.orderDate,
                        referenceNo:
                            orderController.orderDetail.value.referenceNo,
                        totalAmount:
                            orderController.orderDetail.value.totalAmount,
                      )
                    : Container(
                        height: 126,
                        width: double.maxFinite,
                        color: UtilColors.rejectCancelOrderCardBg,
                      ),
              ),
              SizedBox(height: 13),
              Obx(
                () => orderController.isGetDataComplete.value
                    ? RadioButtonCard(
                        radioButtonTitle:
                            orderController.orderSubMenuTitle.value == "Order"
                                ? UtilString.rejectOrderRadioButtonTitle
                                : UtilString.cancelOrderRadioButtonTitle,
                        listRadioButtonBuilder: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemCount:
                              orderController.cancelOrderReasonsList.length,
                          itemBuilder: (context, index) {
                            return Obx(
                              () => GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () {
                                  orderController.radioButtonValue.value =
                                      index;
                                  orderController.reasonId.value =
                                      orderController
                                          .cancelOrderReasonsList[index].id;
                                  print(
                                      "reason : ${orderController.reasonId.value}");
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  color: UtilColors.rejectCancelOrderCardBg,
                                  child: Row(
                                    children: [
                                      Radio(
                                        // toggleable: true,
                                        visualDensity: VisualDensity(
                                            horizontal:
                                                VisualDensity.minimumDensity,
                                            vertical:
                                                VisualDensity.minimumDensity),
                                        value: index,
                                        groupValue: orderController
                                            .radioButtonValue.value,
                                        onChanged: (int newValue) {
                                          // orderController
                                          //     .onRadioButtonTap(newValue);
                                          print(
                                              "radio: ${orderController.radioButtonValue.value}");
                                          orderController.reasonId.value =
                                              orderController
                                                  .cancelOrderReasonsList[index]
                                                  .id;
                                          print(
                                              "reason : ${orderController.reasonId.value}");
                                        },
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: Container(
                                          color: UtilColors
                                              .rejectCancelOrderCardBg,
                                          child: Text(
                                            orderController
                                                .cancelOrderReasonsList[index]
                                                .name,
                                            style: TextStyle(
                                                color: UtilColors
                                                    .rejectCancelOrderRegularText,
                                                fontSize: UtilString
                                                    .fontSizeRejectCancelOrderRegularText,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : Expanded(
                        child: Container(
                          color: UtilColors.rejectCancelOrderCardBg,
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
    );
  }
}
