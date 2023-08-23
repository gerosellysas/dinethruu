import 'package:dinethruu/controllers/orderController.dart';
import 'package:dinethruu/pages/orderDetails/orderDetails.dart';
import 'package:dinethruu/pages/orderMenu/components/orderCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class OnPreparation extends StatefulWidget {
  @override
  _OnPreparationState createState() => _OnPreparationState();
}

class _OnPreparationState extends State<OnPreparation> {
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
                        orderController.onPreparationSearch.value.referenceNo,
                    orderDate:
                        orderController.onPreparationSearch.value.orderDate,
                    customerName:
                        orderController.onPreparationSearch.value.customerName,
                    tripCompany:
                        orderController.onPreparationSearch.value.tripCompany,
                    tripVehicleNo:
                        orderController.onPreparationSearch.value.tripVehicleNo,
                    totalAmount:
                        orderController.onPreparationSearch.value.totalAmount,
                    totalQty:
                        orderController.onPreparationSearch.value.totalQty,
                    orderType:
                        orderController.onPreparationSearch.value.orderType,
                    isAcceptVisible: false,
                    isRejectVisible: false,
                    onTap: () async {
                      var result = await Get.to(() => OrderDetails(),
                          arguments:
                              orderController.onPreparationSearch.value.id);

                      orderController.isOrderDetailShow.value = false;
                      print(
                          "# isOrderDetailShow ${orderController.isOrderDetailShow.value}");
                    },
                    onCallTap: () {
                      var phoneNumber = int.parse(orderController
                          .onPreparationSearch.value.customerPhone);
                      print("phone number $phoneNumber");
                      orderController.makePhoneCall('tel:$phoneNumber');
                    },
                  )
                : ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: orderController.orderOnPreparation.length,
                    itemBuilder: (context, index) {
                      return OrderCard(
                        referenceNo: orderController
                            .orderOnPreparation[index].referenceNo,
                        orderDate:
                            orderController.orderOnPreparation[index].orderDate,
                        orderType:
                            orderController.orderOnPreparation[index].orderType,
                        customerName: orderController
                            .orderOnPreparation[index].customerName,
                        tripCompany: orderController
                            .orderOnPreparation[index].tripCompany,
                        tripVehicleNo: orderController
                            .orderOnPreparation[index].tripVehicleNo,
                        totalQty:
                            orderController.orderOnPreparation[index].totalQty,
                        totalAmount: orderController
                            .orderOnPreparation[index].totalAmount,
                        isAcceptVisible: false,
                        isRejectVisible: false,
                        onTap: () async {
                          var result = await Get.to(() => OrderDetails(),
                              arguments:
                                  orderController.orderOnPreparation[index].id);

                          orderController.isOrderDetailShow.value = false;
                          print(
                              "# isOrderDetailShow ${orderController.isOrderDetailShow.value}");
                        },
                        onCallTap: () {
                          var phoneNumber = int.parse(orderController
                              .orderOnPreparation[index].customerPhone);
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
