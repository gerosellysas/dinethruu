import 'package:dinethruu/api/api.dart';
import 'package:dinethruu/controllers/loginController.dart';
import 'package:dinethruu/models/cancelOrderReasons.dart';
import 'package:dinethruu/models/order.dart';
import 'package:dinethruu/pages/home/home.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as d;
import 'package:url_launcher/url_launcher.dart';

class OrderController extends GetxController {
  final LoginController loginController = Get.put(LoginController());
  d.Dio dio = d.Dio();

  var isInternetNetworkSuccess = true.obs;
  var isGetDataComplete = false.obs;
  //
  var newOrders = <Order>[].obs;
  var orderOnPreparation = <Order>[].obs;
  var orderOnCompleted = <Order>[].obs;
  var orderOnCanceled = <Order>[].obs;
  var orderSubMenuTitle = "Order".obs;
  var orderDetailMenus = [].obs;
  var orderDetailTotalPrices = [].obs;
  var orderDetailQties = [].obs;
  var orderDetail = Order().obs;
  var orderMenuIndex = 0.obs;
  var searchResult = <String>[].obs;
  var searchTextController = TextEditingController().obs;
  var searchResultVisible = false.obs;
  var isModeSearchView = false.obs;
  var isSearchFound = false.obs;
  var isOrderDetailShow = false.obs;
  //
  var newOrdersSearch = Order().obs;
  var onPreparationSearch = Order().obs;
  var completedSearch = Order().obs;
  //
  var radioButtonValue = 0.obs;
  var reasonId = 0.obs;
  var cancelOrderReasonsList = <CancelOrderReasons>[];

  //============================================================================
  //============================================================================
  //============================================================================

  // get all order data ========================================================
  Future<void> getShopOrders() async {
    String token = "";
    print("btoken $token");
    await loginController.updateToken();
    token = "Bearer ${loginController.token.value}";
    print("$token");
    isGetDataComplete.value = false;
    try {
      dio.options.headers["Authorization"] = token;
      d.Response response = await dio.get(Api.shopOrders());
      if (response.statusCode == 200) {
        isInternetNetworkSuccess.value = true;
        newOrders.clear();
        orderOnPreparation.clear();
        orderOnCompleted.clear();

        if (response.data["isSuccess"]) {
          print("# ada data");
          print("# response result => ${response.data["result"].length}");
          // selection data for New Orders
          await Future.forEach(response.data["result"], (orderResult) async {
            if (orderResult["orderStatusId"] == 2) {
              // 2 is status of Waiting for Restaurant Confirmation
              var order = await updateDataOrder(orderResult);
              //
              newOrders.add(order);
            }
            // selection data for On Preparation
            if (orderResult["orderStatusId"] == 3) {
              // 3 is status of on Preparation
              var order = await updateDataOrder(orderResult);
              //
              orderOnPreparation.add(order);
            }
            // selection data for Completed
            if (orderResult["orderStatusId"] == 99 ||
                orderResult["orderStatusId"] == 4) {
              // 99 is status of completed
              var order = await updateDataOrder(orderResult);
              //
              orderOnCompleted.add(order);
            }
            if (orderResult["orderStatusId"] == 888 ||
                orderResult["orderStatusId"] == 999) {
              // 888 is status of rejected
              var order = await updateDataOrder(orderResult);
              //
              orderOnCanceled.add(order);
            }
          });
          isGetDataComplete.value = true;
          isModeSearchView.value = false;
        }
      }
    } on d.DioError catch (ex) {
      _dioError(ex);
    }
  }

  //============================================================================
  //============================================================================
  //============================================================================

  // getOrder Details ==========================================================

  Future<void> getShopOrdersDetails(int id) async {
    await loginController.updateToken();
    String token = "Bearer ${loginController.token.value}";
    isGetDataComplete.value = false;

    try {
      dio.options.headers["Authorization"] = token;
      d.Response response = await dio.get("${Api.shopOrders()}/$id");
      if (response.statusCode == 200) {
        isInternetNetworkSuccess.value = true;
        orderDetailMenus.clear();
        orderDetailTotalPrices.clear();
        orderDetailQties.clear();

        if (response.data["isSuccess"]) {
          var splitOrderDate = response.data["result"]["orderDate"].split("T");
          var time = splitOrderDate[1].split(":");
          var orderDate = "${splitOrderDate[0]} ${time[0]}:${time[1]}";
          //
          await Future.forEach(response.data["result"]["items"], (data) async {
            orderDetailMenus.add(data["menu"]);
            orderDetailTotalPrices.add(data["totalPrice"]);
            orderDetailQties.add(data["qty"]);
          });

          Order order = Order();
          order.id = response.data["result"]["id"];
          order.referenceNo = response.data["result"]["referenceNo"];
          order.orderDate = orderDate;
          order.orderType = response.data["result"]["orderType"];
          order.orderStatus = response.data["result"]["orderStatus"];
          order.customerName = response.data["result"]["customerName"];
          order.customerPhone = response.data["result"]["customerPhone"];
          order.tripCompany = response.data["result"]["tripCompany"];
          order.tripVehicleNo = response.data["result"]["tripVehicleNo"];
          order.totalQty = response.data["result"]["totalQty"];
          order.subTotalAmount = response.data["result"]["subTotalAmount"];
          order.totalAmount = response.data["result"]["totalAmount"];
          order.discount = response.data["result"]["discount"];
          order.taxAmount = response.data["result"]["taxAmount"];
          order.processingFee = response.data["result"]["processingFee"];

          orderDetail.value = order;

          isGetDataComplete.value = true;
          print("finish");
        }
      }
    } on d.DioError catch (ex) {
      _dioError(ex);
    }
  }

  //============================================================================
  //============================================================================
  //============================================================================

  // accept order ==============================================================
  Future<void> acceptOrder(int id) async {
    await loginController.updateToken();
    String token = "Bearer ${loginController.token.value}";
    print("id $id");
    isGetDataComplete.value = false;
    try {
      dio.options.headers["Authorization"] = token;
      d.Response response = await dio.post("${Api.acceptOrder(id)}");
      print("statusCode ${response.statusCode}");
      if (response.statusCode == 200) {
        isInternetNetworkSuccess.value = true;
        print("data ${response.data}");
        if (response.data["isSuccess"]) {
          print("order di terima reload data");
          if (isOrderDetailShow.value) {
            Get.back();
          }
          await getShopOrders();
        } else {
          Get.snackbar(
            UtilString.notifErrorTitle, // title
            "${response.data["message"]}", // message
            barBlur: 20,
            isDismissible: true,
            duration: Duration(seconds: 3),
            snackPosition: SnackPosition.TOP,
          );
          isGetDataComplete.value = true;
        }
      }
    } on d.DioError catch (ex) {
      _dioError(ex);
      isGetDataComplete.value = true;
    }
  }

  //============================================================================
  //============================================================================
  //============================================================================

  // Food Ready order ==========================================================
  Future<void> readyOrder(int id) async {
    await loginController.updateToken();
    String token = "Bearer ${loginController.token.value}";
    print("id $id");
    isGetDataComplete.value = false;
    try {
      dio.options.headers["Authorization"] = token;
      d.Response response = await dio.post("${Api.readyOrder(id)}");
      print("API => ${Api.readyOrder(id)}");
      print("statusCode ${response.statusCode}");
      if (response.statusCode == 200) {
        isInternetNetworkSuccess.value = true;
        print("data ${response.data}");
        if (response.data["isSuccess"]) {
          print("order di terima reload data");
          if (isOrderDetailShow.value) {
            Get.back();
          }
          await getShopOrders();
        } else {
          Get.snackbar(
            UtilString.notifErrorTitle, // title
            "${response.data["message"]}", // message
            barBlur: 20,
            isDismissible: true,
            duration: Duration(seconds: 3),
            snackPosition: SnackPosition.TOP,
          );
          isGetDataComplete.value = true;
        }
      }
    } on d.DioError catch (ex) {
      _dioError(ex);
      isGetDataComplete.value = true;
    }
  }

  //============================================================================
  //============================================================================
  //============================================================================

  // reject order ==============================================================
  Future<void> rejectOrder(int id, int reasonId) async {
    String token = "Bearer ${loginController.token.value}";
    print("id = $id, reasonId = $reasonId");
    isGetDataComplete.value = false;
    try {
      dio.options.headers["Authorization"] = token;
      d.Response response = await dio.post(
        "${Api.rejectOrder(id, reasonId)}",
      );
      if (response.statusCode == 200) {
        isInternetNetworkSuccess.value = true;
        print("data ${response.data}");
        if (response.data["isSuccess"]) {
          print("order di reject reload data");
          await getShopOrders();
          isGetDataComplete.value = true;
          print("rejected");
          print("API => ${Api.rejectOrder(id, reasonId)}");
          if (isOrderDetailShow.value) {
            Get.offUntil(GetPageRoute(page: () => Home()), (route) => false);
            // Get.offUntil(Route<Home>, (route) => false);
            // Get.off(page)
          }
          Get.back();
        } else {
          Get.snackbar(
            UtilString.notifErrorTitle, // title
            "${response.data["message"]}", // message
            barBlur: 20,
            isDismissible: true,
            duration: Duration(seconds: 3),
            snackPosition: SnackPosition.TOP,
          );
        }
      }
    } on d.DioError catch (ex) {
      _dioError(ex);
    }
  }

  //============================================================================
  //============================================================================
  //============================================================================

  // cancel order ==============================================================
  Future<void> cancelOrder(int id, int reasonId) async {
    String token = "Bearer ${loginController.token.value}";
    print("id = $id, reasonId = $reasonId");
    isGetDataComplete.value = false;
    try {
      dio.options.headers["Authorization"] = token;
      d.Response response = await dio.post(
        "${Api.cancelOrder(id, reasonId)}",
      );
      if (response.statusCode == 200) {
        isInternetNetworkSuccess.value = true;
        print("data ${response.data}");
        if (response.data["isSuccess"]) {
          print("order di cancel reload data");
          await getShopOrders();
          isGetDataComplete.value = true;
          print("cancelled");
          print("API => ${Api.cancelOrder(id, reasonId)}");
          Get.back();
        } else {
          Get.snackbar(
            UtilString.notifErrorTitle, // title
            "${response.data["message"]}", // message
            barBlur: 20,
            isDismissible: true,
            duration: Duration(seconds: 3),
            snackPosition: SnackPosition.TOP,
          );
        }
      }
    } on d.DioError catch (ex) {
      _dioError(ex);
    }
  }

  //============================================================================
  //============================================================================
  //============================================================================

  // reject/cancel order dialog ================================================
  Future<void> onRejectCancelOrder(int id, int reasonId) async {
    if (radioButtonValue.value == null) {
      Get.defaultDialog(
        title: UtilString.notifInfoTitle, // title
        middleText: orderSubMenuTitle.value == "Order"
            ? UtilString.notifRejectOrderValidation // reject message
            : UtilString.notifCancelOrderValidation, // cancel message
        radius: 10,
      );
    } else {
      await Get.defaultDialog(
        title: orderSubMenuTitle.value == "Order"
            ? UtilString.notifRejectOrderTitle // title
            : UtilString.notifCancelOrderTitle, // title
        middleText: orderSubMenuTitle.value == "Order"
            ? UtilString.notifRejectOrderConfirm // reject message
            : UtilString.notifCancelOrderConfirm, // cancel message
        radius: 10,
        textCancel: UtilString.rejectCancelOrderNoDialogButton,
        onCancel: () {},
        textConfirm: UtilString.rejectCancelOrderYesDialogButton,
        onConfirm: () async {
          Get.back();
          orderSubMenuTitle.value == "Order"
              ? await rejectOrder(id, reasonId)
              : await cancelOrder(id, reasonId);
          Get.back(result: "success");
        },
      );
    }
  }

  //============================================================================
  //============================================================================
  //============================================================================

  // get list reasone reject/cancel ============================================
  Future<void> getCancelOrderReasonsList() async {
    String token = "Bearer ${loginController.token.value}";
    isGetDataComplete.value = false;
    try {
      dio.options.headers["Authorization"] = token;
      d.Response response = await dio.get("${Api.shopOrders()}/cancelReasons");
      if (response.statusCode == 200) {
        isInternetNetworkSuccess.value = true;
        cancelOrderReasonsList.clear();
        if (await response.data["isSuccess"]) {
          print("# ada data");
          print("# response result => ${response.data["result"]}");
          await Future.forEach(response.data["result"], (data) async {
            CancelOrderReasons cancelOrderReasons = CancelOrderReasons();
            cancelOrderReasons.id = data["id"];
            cancelOrderReasons.code = data["code"];
            cancelOrderReasons.name = data["name"];

            cancelOrderReasonsList.add(cancelOrderReasons);
          });
        }
        isGetDataComplete.value = true;
      }
    } on d.DioError catch (ex) {
      _dioError(ex);
    }
  }

  // Future<void> onRadioButtonTap(int value) async {
  //   radioButtonValue.value = value;
  // }

  //============================================================================
  //============================================================================
  //============================================================================

  // Update and Clear Order Obj ================================================

  orderDetailClear() {
    Order orderClear;
    orderClear.id = 0;
    orderClear.referenceNo = "";
    orderClear.orderDate = "";
    orderClear.orderType = "";
    orderClear.orderStatus = "";
    orderClear.customerName = "";
    orderClear.customerPhone = "";
    orderClear.tripCompany = "";
    orderClear.tripVehicleNo = "";
    orderClear.totalQty = 0;
    orderClear.subTotalAmount = 0;
    orderClear.totalAmount = 0;
    orderClear.discount = 0;
    orderClear.taxAmount = 0;
    orderClear.processingFee = 0;

    orderDetail.value = orderClear;

    orderDetailMenus.clear();
    orderDetailTotalPrices.clear();
    orderDetailQties.clear();
  }

  Future<Order> updateDataOrder(dynamic orderResult) async {
    var splitOrderDate = orderResult["orderDate"].split("T");
    var time = splitOrderDate[1].split(":");
    var orderDate = "${splitOrderDate[0]} ${time[0]}:${time[1]}";
    //
    Order order = Order();
    order.id = orderResult["id"];
    order.referenceNo = orderResult["referenceNo"];
    order.orderDate = orderDate;
    order.orderType = orderResult["orderType"];
    order.orderStatus = orderResult["orderStatus"];
    order.customerName = orderResult["customerName"];
    order.customerPhone = orderResult["customerPhone"];
    order.tripCompany = orderResult["tripCompany"];
    order.tripVehicleNo = orderResult["tripVehicleNo"];
    order.totalQty = orderResult["totalQty"];
    order.subTotalAmount = orderResult["subTotalAmount"];
    order.totalAmount = orderResult["totalAmount"];
    order.discount = orderResult["discount"];

    return order;
  }
  //============================================================================
  //============================================================================
  //============================================================================

  // Call Phone Function ========================================================

  Future<void> makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could not launch $url";
    }
  }

  //============================================================================
  //============================================================================
  //============================================================================

  // Order Menu Search ========================================================

  Future<void> filterSearch(String search, indexMenu) async {
    List<String> listReferenceNo = [];
    List<String> temp = [];
    var searchToLow = "";
    searchToLow = search.toLowerCase();
    switch (indexMenu) {
      case 0:
        print("filter search new order");
        await Future.forEach(newOrders, (data) async {
          listReferenceNo.add(data.referenceNo);
        });
        // print("listReferenceNo $listReferenceNo");
        await Future.forEach(listReferenceNo, (item) async {
          // print("searchToLow $searchToLow item ${item.toLowerCase()}");
          if (item.toLowerCase().contains(searchToLow)) {
            temp.add(item);
            // print("item $item");
          }
        });
        searchResult.value = temp;
        break;
      case 1:
        print("filter search on preparation");
        await Future.forEach(orderOnPreparation, (data) async {
          listReferenceNo.add(data.referenceNo);
        });
        await Future.forEach(listReferenceNo, (item) async {
          if (item.toLowerCase().contains(searchToLow)) {
            temp.add(item);
          }
        });
        searchResult.value = temp;
        break;
      case 2:
        print("filter search completed");
        await Future.forEach(orderOnCompleted, (data) async {
          listReferenceNo.add(data.referenceNo);
        });
        await Future.forEach(listReferenceNo, (item) async {
          if (item.toLowerCase().contains(searchToLow)) {
            temp.add(item);
          }
        });
        searchResult.value = temp;
        break;
    }
  }

  Future<bool> newOrderSearchFilter(String search) async {
    await Future.forEach(newOrders, (data) async {});
    for (int i = 0; i < newOrders.length; i++) {
      if (search == newOrders[i].referenceNo) {
        newOrdersSearch.value = newOrders[i];
        isSearchFound.value = true;
        isModeSearchView.value = true;
        return true;
      }
      // print("i $i");
    }
    isSearchFound.value = false;
    return false;
  }

  Future<bool> onPreparationSearchFilter(String search) async {
    await Future.forEach(orderOnPreparation, (data) async {});
    for (int i = 0; i < orderOnPreparation.length; i++) {
      if (search == orderOnPreparation[i].referenceNo) {
        onPreparationSearch.value = orderOnPreparation[i];
        isSearchFound.value = true;
        isModeSearchView.value = true;
        return true;
      }
    }
    isSearchFound.value = false;
    return false;
  }

  Future<bool> completedSearchFilter(String search) async {
    await Future.forEach(orderOnCompleted, (data) async {});
    for (int i = 0; i < orderOnCompleted.length; i++) {
      if (search == orderOnCompleted[i].referenceNo) {
        completedSearch.value = orderOnCompleted[i];
        isSearchFound.value = true;
        isModeSearchView.value = true;
        return true;
      }
    }
    isSearchFound.value = false;
    return false;
  }
  //============================================================================
  //============================================================================
  //============================================================================

  //  network error detection
  _dioError(d.DioError ex) {
    if (ex.type == d.DioErrorType.response) {
      isInternetNetworkSuccess.value = false;
      print("error http respon 400,500");
    } else if (ex.type == d.DioErrorType.other) {
      isInternetNetworkSuccess.value = false;
      print("error http default");
    } else {
      isInternetNetworkSuccess.value = false;
      print("error time out or cancel");
    }
    Get.snackbar(
      UtilString.notifInfoTitle, // title
      UtilString.notifInfoConnectionError, // message
      barBlur: 20,
      isDismissible: true,
      duration: Duration(seconds: 3),
      snackPosition: SnackPosition.TOP,
    );
  }
}
