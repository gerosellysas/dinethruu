import 'package:dinethruu/api/api.dart';
import 'package:dinethruu/controllers/dateFilterController.dart';
import 'package:dinethruu/controllers/loginController.dart';
import 'package:dinethruu/models/transaction.dart';
import 'package:dinethruu/models/wallet.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as d;
import 'package:intl/intl.dart';

class SummaryController extends GetxController {
  final LoginController loginController = Get.put(LoginController());
  d.Dio dio = d.Dio();

  var isInternetNetworkSuccess = true.obs;
  var isGetDataComplete = false.obs;
  //
  var wallet = Wallet().obs;
  var recentTransaction = <Transaction>[].obs;
  var viewTransaction = <Transaction>[].obs;
  var transactionDetail = Transaction().obs;
  var withdrawTxtFieldController = TextEditingController().obs;
  var isFilter = false.obs;
  //
  bool isNumberNotValidate = false;
  var allTransaction = <Transaction>[];
  var filterTransaction = <Transaction>[];

  @override
  void onInit() {
    super.onInit();
    withdrawTxtFieldController.value.text = "";
  }

  Future<void> getSummary() async {
    await loginController.updateToken();
    String token = "Bearer ${loginController.token.value}";
    isGetDataComplete.value = false;
    try {
      dio.options.headers["Authorization"] = token;
      d.Response response = await dio.get(Api.wallet());
      if (response.statusCode == 200) {
        isInternetNetworkSuccess.value = true;
        if (response.data["isSuccess"]) {
          print("# ada data");
          print("# response result => ${response.data["result"].length}");
          wallet.value = Wallet.fromMap(response.data["result"]);
          await getRecentTransaction();
        }
        isGetDataComplete.value = true;
      }
    } on d.DioError catch (ex) {
      _dioError(ex);
    }
  }

  Future<void> getAllTransaction() async {
    await loginController.updateToken();
    String token = "Bearer ${loginController.token.value}";
    isGetDataComplete.value = false;
    try {
      dio.options.headers["Authorization"] = token;
      d.Response response = await dio.get(Api.allTransaction());
      if (response.statusCode == 200) {
        isInternetNetworkSuccess.value = true;
        allTransaction.clear();
        if (response.data["isSuccess"]) {
          print("# ada data");
          print("# response result => ${response.data["result"]}");
          await Future.forEach(response.data["result"], (item) async {
            var splitOrderDate = item["transactionDate"].split("T");
            var time = splitOrderDate[1].split(":");
            var transactionDate = "${splitOrderDate[0]} ${time[0]}:${time[1]}";

            Transaction transaction = Transaction.fromMap(item);
            transaction.transactionDate = transactionDate;
            allTransaction.add(transaction);
          });
          viewTransaction.value = allTransaction;
          // allTransaction.forEach((element) {
          //   print("element ${element.toMap()}");
          // });
        }
        isGetDataComplete.value = true;
      }
    } on d.DioError catch (ex) {
      _dioError(ex);
    }
  }

  Future<void> withdrawalRequest() async {
    await loginController.updateToken();
    String token = "Bearer ${loginController.token.value}";
    print("1${withdrawTxtFieldController.value.text}2");
    if (withdrawTxtFieldController.value.text == "" ||
        withdrawTxtFieldController.value.text == null) {
      Get.snackbar(
        UtilString.notifInfoTitle, // title
        UtilString.notifSummaryInfoEmptyForm, // message
        barBlur: 20,
        isDismissible: true,
        duration: Duration(seconds: 3),
        snackPosition: SnackPosition.TOP,
      );
    } else {
      var isValidate =
          await validateWithdraw(withdrawTxtFieldController.value.text);
      print("isValidate $isValidate");
      if (isValidate) {
        Map<String, dynamic> requestAmount = {
          "requestedAmount": withdrawTxtFieldController.value.text
        };
        try {
          dio.options.headers["Authorization"] = token;
          d.Response response = await dio.post(
            Api.withdrawalRequest(),
            data: requestAmount,
          );

          if (response.statusCode == 200) {
            isInternetNetworkSuccess.value = true;
            if (await response.data["isSuccess"]) {
              print("# ada data 123");
              print("# response result 123=> ${response.data["result"]}");
              isGetDataComplete.value = true;
              withdrawTxtFieldController.value.text = "";
              Get.back(result: true);
              Get.snackbar(
                UtilString.notifInfoTitle, // title
                UtilString.notifSummaryInfoWDSuccess, // message
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
      } else {
        Get.snackbar(
          UtilString.notifErrorTitle, // title
          UtilString.notifSummaryErrorInputNumber, // message
          barBlur: 20,
          isDismissible: true,
          duration: Duration(seconds: 3),
          snackPosition: SnackPosition.TOP,
        );
      }
    }
  }

  Future<void> getRecentTransaction() async {
    await loginController.updateToken();
    String token = "Bearer ${loginController.token.value}";
    try {
      dio.options.headers["Authorization"] = token;
      d.Response response = await dio.get(Api.recentTransaction());
      if (response.statusCode == 200) {
        isInternetNetworkSuccess.value = true;
        recentTransaction.clear();
        if (response.data["isSuccess"]) {
          print("# ada data");
          print("# response result => ${response.data["result"]}");
          await Future.forEach(response.data["result"], (item) async {
            Transaction transaction = Transaction.fromMap(item);
            recentTransaction.add(transaction);
          });
        }
      }
    } on d.DioError catch (ex) {
      _dioError(ex);
    }
  }

  Future<void> getTransactionDetail(int id) async {
    await loginController.updateToken();
    String token = "Bearer ${loginController.token.value}";
    isGetDataComplete.value = false;
    try {
      dio.options.headers["Authorization"] = token;
      d.Response response = await dio.get(Api.transactionDetail(id));
      if (response.statusCode == 200) {
        isInternetNetworkSuccess.value = true;
        if (response.data["isSuccess"]) {
          print("# ada data");
          print("# response result => ${response.data["result"]}");
          var splitOrderDate =
              response.data["result"]["transactionDate"].split("T");
          var time = splitOrderDate[1].split(":");
          var transactionDate = "${splitOrderDate[0]} ${time[0]}:${time[1]}";
          Transaction transaction =
              Transaction.fromMap(response.data["result"]);
          transaction.transactionDate = transactionDate;

          transactionDetail.value = transaction;

          print("transactionDetail ${transactionDetail.value.toMap()}");
        }
        isGetDataComplete.value = true;
      }
    } on d.DioError catch (ex) {
      _dioError(ex);
    }
  }

  Future<bool> validateWithdraw(String value) async {
    var split = value.split("");
    if (split[0] == "0") {
      Get.snackbar(
        UtilString.notifErrorTitle, // title
        UtilString.notifSummaryErrorInputNumber, // message
        barBlur: 20,
        isDismissible: true,
        duration: Duration(seconds: 3),
        snackPosition: SnackPosition.TOP,
      );
    } else {
      for (var item in split) {
        for (int x = 0; x < 10; x++) {
          final number = num.tryParse(item);
          if (number == null) {
            return false;
            // break;
          }
        }
      }
    }
    return true;
  }

  Future<void> filterByDate(DateTime startDate, DateTime endDate) async {
    int i = 0;
    int j = 0;
    filterTransaction.clear();
    await Future.forEach(allTransaction, (item) async {
      i++;
      DateTime tempDate =
          new DateFormat("yyyy-MM-dd hh:mm").parse(item.transactionDate);
      // print("sStartDate ${startDate}");
      // print("tempDate $tempDate");
      // print("selectEndDate ${endDate}");
      if (startDate.isBefore(tempDate) && endDate.isAfter(tempDate)) {
        j++;
        print("============> data ke $i add data $j");
        filterTransaction.add(item);
      }
    });

    viewTransaction.value = filterTransaction;
    viewTransaction.forEach((element) {
      print("element ${element.transactionDate}");
    });
  }

  //  network error detection
  _dioError(d.DioError ex) {
    if (ex.type == d.DioErrorType.response) {
      //error respon 400,500
      isInternetNetworkSuccess.value = false;
      print("error http respon 400,500");
    } else if (ex.type == d.DioErrorType.other) {
      //example wifi off
      isInternetNetworkSuccess.value = false;
      print("error http default");
    } else {
      //timeout dan cancel
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
