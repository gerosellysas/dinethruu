import 'package:dinethruu/controllers/orderController.dart';
import 'package:dinethruu/utils/utilColors.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/body.dart';
import 'components/customBottomNav.dart';

class RejectCancelOrder extends StatefulWidget {
  @override
  _RejectCancelOrderState createState() => _RejectCancelOrderState();
}

class _RejectCancelOrderState extends State<RejectCancelOrder> {
  final OrderController orderController = Get.put(OrderController());
  int id;

  @override
  void initState() {
    super.initState();
    orderController.radioButtonValue.value = null;
    id = Get.arguments;
    print("id => $id");
    Future.delayed(Duration(milliseconds: 200), () async {
      await orderController.getShopOrdersDetails(id);
      await orderController.getCancelOrderReasonsList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UtilColors.rejectCancelOrderBgColor,
      appBar: appBar(context),
      body: Body(id: id),
      bottomNavigationBar: Container(
        color: UtilColors.rejectCancelOrderCardBg,
        child: CustomBottomNav(
          rejectCancelOrderButtonText:
              orderController.orderSubMenuTitle.value == "Order"
                  ? UtilString.rejectOrderButton
                  : UtilString.cancelOrderButton,
          onRejectCancelOrderTap: () {
            orderController.onRejectCancelOrder(
              id,
              orderController.reasonId.value,
            );
          },
          onBackTap: () {
            Get.back();
          },
        ),
      ),
    );
  }
}

Widget appBar(BuildContext context) {
  final OrderController orderController = Get.find();
  return AppBar(
    title: Text(
      orderController.orderSubMenuTitle.value == "Order"
          ? UtilString.rejectOrderTitle
          : UtilString.cancelOrderTitle,
      style: TextStyle(
        color: UtilColors.rejectCancelOrderTitle,
        fontSize: UtilString.fontSizeRejectCancelOrderTitle,
        fontWeight: FontWeight.bold,
      ),
    ),
    backgroundColor: UtilColors.rejectCancelOrderAppBarBg,
    elevation: 0,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back_ios_outlined,
        color: UtilColors.rejectCancelOrderTitle,
      ),
      onPressed: () {
        Get.back();
      },
    ),
  );
}
