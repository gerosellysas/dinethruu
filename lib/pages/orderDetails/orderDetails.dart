import 'package:dinethruu/controllers/orderController.dart';
import 'package:dinethruu/pages/rejectCancelOrder/rejectCancelOrder.dart';
import 'package:dinethruu/utils/utilColors.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/body.dart';
import 'components/customBottomNav.dart';

class OrderDetails extends StatefulWidget {
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  final OrderController orderController = Get.put(OrderController());

  @override
  void initState() {
    super.initState();
    var id = Get.arguments;
    orderController.isOrderDetailShow.value = true;
    print("id => $id");
    Future.delayed(Duration(milliseconds: 200),
        () => orderController.getShopOrdersDetails(id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UtilColors.bgWhite,
      appBar: appBarBuild(context),
      body: Body(),
      bottomNavigationBar: CustomButtomNav(
        onAccept: orderController.orderSubMenuTitle.value == "Order"
            ? UtilString.orderDetailsAcceptButton
            : UtilString.orderDetailsFoodReadyButton,
        onAcceptTap: () {
          if (orderController.orderSubMenuTitle.value == "Order") {
            orderController.acceptOrder(orderController.orderDetail.value.id);
          } else {
            orderController.readyOrder(orderController.orderDetail.value.id);
          }
        },
        onReject: orderController.orderSubMenuTitle.value == "Order"
            ? UtilString.orderDetailsRejectButton
            : UtilString.orderDetailsCancelOrderButton,
        onRejectTap: () async {
          var result =
              await Get.to(() => RejectCancelOrder(), arguments: Get.arguments);
          print("RESULT +++ $result");
          if (result == "success") {
            Get.back();
          }
        },
        isCompleted: orderController.orderSubMenuTitle.value == "Completed" ||
                orderController.orderSubMenuTitle.value == "Canceled"
            ? true
            : false,
        onCall: () {
          var phoneNumber =
              int.parse(orderController.orderDetail.value.customerPhone);
          print("phone number $phoneNumber");
          orderController.makePhoneCall('tel:$phoneNumber');
        },
      ),
    );
  }

  Widget appBarBuild(BuildContext context) {
    return AppBar(
      backgroundColor: UtilColors.orderDetailsHeaderBg,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_outlined),
        color: UtilColors.orderDetailsHeaderText,
        onPressed: () {
          Get.back();
        },
      ),
      title: Text(
        UtilString.orderDetailsTitle,
        style: TextStyle(
            color: UtilColors.orderDetailsHeaderText,
            fontSize: UtilString.fontSizeOrderDetailsTitle,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
