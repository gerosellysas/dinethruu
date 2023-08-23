import 'package:dinethruu/controllers/loginController.dart';
import 'package:dinethruu/controllers/orderController.dart';
import 'package:dinethruu/pages/orderDetails/orderDetails.dart';
import 'package:dinethruu/pages/orderMenu/components/orderCard.dart';
import 'package:dinethruu/pages/rejectCancelOrder/rejectCancelOrder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class NewOrder extends StatefulWidget {
  @override
  _NewOrderState createState() => _NewOrderState();
}

class _NewOrderState extends State<NewOrder> {
  final OrderController orderController = Get.put(OrderController());
  @override
  void initState() {
    super.initState();
    orderController.isModeSearchView.value = false;
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      padding: EdgeInsets.all(w * 0.032),
      alignment: Alignment.topCenter,
      child: Obx(
        () => (orderController.isGetDataComplete.value)
            ? orderController.isModeSearchView.value
                ? OrderCard(
                    referenceNo:
                        orderController.newOrdersSearch.value.referenceNo,
                    orderDate: orderController.newOrdersSearch.value.orderDate,
                    customerName:
                        orderController.newOrdersSearch.value.customerName,
                    tripCompany:
                        orderController.newOrdersSearch.value.tripCompany,
                    tripVehicleNo:
                        orderController.newOrdersSearch.value.tripVehicleNo,
                    totalAmount:
                        orderController.newOrdersSearch.value.totalAmount,
                    totalQty: orderController.newOrdersSearch.value.totalQty,
                    orderType: orderController.newOrdersSearch.value.orderType,
                    onTap: () async {
                      var result = await Get.to(() => OrderDetails(),
                          arguments: orderController.newOrdersSearch.value.id);

                      orderController.isOrderDetailShow.value = false;
                      print(
                          "# isOrderDetailShow ${orderController.isOrderDetailShow.value}");
                    },
                    onAcceptTap: () {
                      orderController.acceptOrder(
                          orderController.newOrdersSearch.value.id);
                    },
                    onRejectTap: () {
                      Get.to(
                        () => RejectCancelOrder(),
                        arguments: orderController.newOrdersSearch.value.id,
                      );
                      print("reject");
                    },
                    onCallTap: () {
                      var phoneNumber = int.parse(
                          orderController.newOrdersSearch.value.customerPhone);
                      print("phone number $phoneNumber");
                      orderController.makePhoneCall('tel:$phoneNumber');
                    },
                  )
                : ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: orderController.newOrders.length,
                    itemBuilder: (context, index) {
                      return OrderCard(
                        referenceNo:
                            orderController.newOrders[index].referenceNo,
                        orderDate: orderController.newOrders[index].orderDate,
                        customerName:
                            orderController.newOrders[index].customerName,
                        tripCompany:
                            orderController.newOrders[index].tripCompany,
                        tripVehicleNo:
                            orderController.newOrders[index].tripVehicleNo,
                        totalAmount:
                            orderController.newOrders[index].totalAmount,
                        totalQty: orderController.newOrders[index].totalQty,
                        orderType: orderController.newOrders[index].orderType,
                        onTap: () async {
                          var result = await Get.to(() => OrderDetails(),
                              arguments: orderController.newOrders[index].id);

                          orderController.isOrderDetailShow.value = false;
                          print(
                              "# isOrderDetailShow ${orderController.isOrderDetailShow.value}");
                        },
                        onAcceptTap: () {
                          orderController
                              .acceptOrder(orderController.newOrders[index].id);
                        },
                        onRejectTap: () {
                          Get.to(
                            () => RejectCancelOrder(),
                            arguments: orderController.newOrders[index].id,
                          );
                          print("reject");
                        },
                        onCallTap: () {
                          var phoneNumber = int.parse(
                              orderController.newOrders[index].customerPhone);
                          print("phone number $phoneNumber");
                          orderController.makePhoneCall('tel:$phoneNumber');
                        },
                      );
                    },
                  )
            : SpinKitChasingDots(color: Colors.black38, size: h * 0.1),
      ),
    );
  }
}
