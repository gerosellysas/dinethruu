import 'package:dinethruu/controllers/orderController.dart';
import 'package:dinethruu/pages/orderDetails/orderDetails.dart';
import 'package:dinethruu/pages/orderMenu/components/orderCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class Canceled extends StatefulWidget {
  @override
  _CanceledState createState() => _CanceledState();
}

class _CanceledState extends State<Canceled> {
  final OrderController orderController = Get.put(OrderController());

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
            ? ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: orderController.orderOnCanceled.length,
                itemBuilder: (context, index) {
                  return OrderCard(
                    referenceNo:
                        orderController.orderOnCanceled[index].referenceNo,
                    orderDate: orderController.orderOnCanceled[index].orderDate,
                    orderType: orderController.orderOnCanceled[index].orderType,
                    customerName:
                        orderController.orderOnCanceled[index].customerName,
                    tripCompany:
                        orderController.orderOnCanceled[index].tripCompany,
                    tripVehicleNo:
                        orderController.orderOnCanceled[index].tripVehicleNo,
                    totalQty: orderController.orderOnCanceled[index].totalQty,
                    totalAmount:
                        orderController.orderOnCanceled[index].totalAmount,
                    isAcceptVisible: false,
                    isRejectVisible: false,
                    onTap: () async {
                      // var result =
                      await Get.to(() => OrderDetails(),
                          arguments: orderController.orderOnCanceled[index].id);

                      orderController.isOrderDetailShow.value = false;
                      print(
                          "# isOrderDetailShow ${orderController.isOrderDetailShow.value}");
                    },
                    onCallTap: () {
                      var phoneNumber = int.parse(
                          orderController.orderOnCanceled[index].customerPhone);
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
