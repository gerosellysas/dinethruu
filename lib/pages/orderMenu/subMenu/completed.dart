import 'package:dinethruu/controllers/orderController.dart';
import 'package:dinethruu/pages/orderDetails/orderDetails.dart';
import 'package:dinethruu/pages/orderMenu/components/orderCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class Completed extends StatefulWidget {
  @override
  _CompletedState createState() => _CompletedState();
}

class _CompletedState extends State<Completed> {
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
                        orderController.completedSearch.value.referenceNo,
                    orderDate: orderController.completedSearch.value.orderDate,
                    customerName:
                        orderController.completedSearch.value.customerName,
                    tripCompany:
                        orderController.completedSearch.value.tripCompany,
                    tripVehicleNo:
                        orderController.completedSearch.value.tripVehicleNo,
                    totalAmount:
                        orderController.completedSearch.value.totalAmount,
                    totalQty: orderController.completedSearch.value.totalQty,
                    orderType: orderController.completedSearch.value.orderType,
                    isAcceptVisible: false,
                    isRejectVisible: false,
                    onTap: () async {
                      var result = await Get.to(() => OrderDetails(),
                          arguments: orderController.completedSearch.value.id);

                      orderController.isOrderDetailShow.value = false;
                      print(
                          "# isOrderDetailShow ${orderController.isOrderDetailShow.value}");
                    },
                    onCallTap: () {
                      var phoneNumber = int.parse(
                          orderController.completedSearch.value.customerPhone);
                      print("phone number $phoneNumber");
                      orderController.makePhoneCall('tel:$phoneNumber');
                    },
                  )
                : ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: orderController.orderOnCompleted.length,
                    itemBuilder: (context, index) {
                      return OrderCard(
                        referenceNo:
                            orderController.orderOnCompleted[index].referenceNo,
                        orderDate:
                            orderController.orderOnCompleted[index].orderDate,
                        orderType:
                            orderController.orderOnCompleted[index].orderType,
                        customerName: orderController
                            .orderOnCompleted[index].customerName,
                        tripCompany:
                            orderController.orderOnCompleted[index].tripCompany,
                        tripVehicleNo: orderController
                            .orderOnCompleted[index].tripVehicleNo,
                        totalQty:
                            orderController.orderOnCompleted[index].totalQty,
                        totalAmount:
                            orderController.orderOnCompleted[index].totalAmount,
                        isAcceptVisible: false,
                        isRejectVisible: false,
                        onTap: () async {
                          var result = await Get.to(() => OrderDetails(),
                              arguments:
                                  orderController.orderOnCompleted[index].id);

                          orderController.isOrderDetailShow.value = false;
                          print(
                              "# isOrderDetailShow ${orderController.isOrderDetailShow.value}");
                        },
                        onCallTap: () {
                          var phoneNumber = int.parse(orderController
                              .orderOnCompleted[index].customerPhone);
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
