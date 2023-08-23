import 'package:dinethruu/api/api.dart';
import 'package:dinethruu/models/category.dart';
import 'package:dinethruu/models/foodsCategory.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as d;

import 'loginController.dart';

class CategoryController extends GetxController {
  final LoginController loginController = Get.put(LoginController());
  d.Dio dio = d.Dio();

  var isInternetNetworkSuccess = true.obs;
  var listCategory = <Category>[].obs;
  var listFoodCategory = <FoodsCategory>[].obs;
  var categoryTextController = TextEditingController().obs;
  var isGetDataComplete = false.obs;
  var isSelected = false.obs;
  var categoryName = "".obs;

  Future<void> createCategory() async {
    await loginController.updateToken();
    String token = "Bearer ${loginController.token.value}";
    // print("token => $token");
    print("create ${categoryTextController.value.text}");
    if (categoryTextController.value.text == null ||
        categoryTextController.value.text == "") {
      print("snackbar appear");
      Get.snackbar(
        "Information", // title
        "Category cannot be empty", // message
        barBlur: 20,
        isDismissible: true,
        duration: Duration(seconds: 3),
        snackPosition: SnackPosition.TOP,
      );
    } else {
      isGetDataComplete.value = false;
      Map<String, dynamic> categoryJson = {
        "id": 0,
        "name": categoryTextController.value.text, //newCategory.value,
        "restaurantId": 0
      };
      try {
        dio.options.headers["Authorization"] = token;
        d.Response response = await dio.post(
          Api.shopMenusCategory(),
          data: categoryJson,
        );

        if (response.statusCode == 200) {
          isInternetNetworkSuccess.value = true;
          if (await response.data["isSuccess"]) {
            print("# ada data 123");
            print("# response result 123=> ${response.data["result"]}");
            isGetDataComplete.value = true;
            Get.back(result: true);
          }
        }
      } on d.DioError catch (ex) {
        _dioError(ex);
      }
    }
  }

  Future<void> getCategory() async {
    await loginController.updateToken();
    String token = "Bearer ${loginController.token.value}";
    // print("token => $token");
    isGetDataComplete.value = false;
    try {
      dio.options.headers["Authorization"] = token;
      d.Response response = await dio.get(Api.shopMenusCategory());
      if (response.statusCode == 200) {
        isInternetNetworkSuccess.value = true;
        listCategory.clear();
        if (await response.data["isSuccess"]) {
          print("# ada data");
          print("# response result => ${response.data["result"]}");
          await Future.forEach(response.data["result"], (categoryResult) async {
            Category category = Category();
            category.id = categoryResult["id"];
            category.name = categoryResult["name"];
            //
            listCategory.add(category);
          });
        }
        isGetDataComplete.value = true;
      }
    } on d.DioError catch (ex) {
      _dioError(ex);
    }
  }

  Future<void> updateCategory(int id) async {
    await loginController.updateToken();
    String token = "Bearer ${loginController.token.value}";
    // print("token => $token");
    print("update");
    print("id $id");
    if (categoryTextController.value.text == null ||
        categoryTextController.value.text == "") {
      print("snackbar appear");
      Get.snackbar(
        "Information", // title
        "Category cannot be empty", // message
        barBlur: 20,
        isDismissible: true,
        duration: Duration(seconds: 3),
        snackPosition: SnackPosition.TOP,
      );
    } else {
      isGetDataComplete.value = false;
      Map<String, dynamic> categoryJson = {
        "id": id,
        "name": categoryTextController.value.text,
        "restaurantId": 0
      };
      try {
        dio.options.headers["Authorization"] = token;
        d.Response response =
            await dio.post(Api.editShopMenusCategory(), data: categoryJson);
        if (response.statusCode == 200) {
          isInternetNetworkSuccess.value = true;
          if (response.data["isSuccess"]) {
            isGetDataComplete.value = true;
            Get.back(result: true);
          }
        }
      } on d.DioError catch (ex) {
        _dioError(ex);
      }
    }
  }

  Future<void> deleteCategory(int id) async {
    await loginController.updateToken();
    String token = "Bearer ${loginController.token.value}";
    // print("token => $token");
    print("id $id");
    isGetDataComplete.value = false;
    Map<String, dynamic> categoryJson = {
      "id": id,
      "name": categoryTextController.value.text,
      "restaurantId": 0
    };
    try {
      dio.options.headers["Authorization"] = token;
      // d.Response response = await dio
      //     .delete(Api.shopMenusCategory() + "/?id=$id", data: categoryJson);
      d.Response response =
          await dio.delete(Api.deleteShopMenusCategory(id), data: categoryJson);
      if (response.statusCode == 200) {
        isInternetNetworkSuccess.value = true;
        if (response.data["isSuccess"]) {
          await getCategory();
          isGetDataComplete.value = true;
          Get.snackbar(
            "SUCCESS", // title
            "Deleted ${categoryTextController.value.text} from category menu", // message
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

  Future<void> listFoodOfCategory(int id) async {
    await loginController.updateToken();
    String token = "Bearer ${loginController.token.value}";
    // print("token => $token");
    print("id $id");
    isGetDataComplete.value = false;
    try {
      dio.options.headers["Authorization"] = token;
      d.Response response = await dio.get(Api.listFoodOfCategory(id));
      if (response.statusCode == 200) {
        isInternetNetworkSuccess.value = true;
        listFoodCategory.clear();
        if (response.data["isSuccess"]) {
          print("# ada data");
          // print("# response result => ${response.data["result"]}");
          await Future.forEach(response.data["result"], (foodResult) async {
            FoodsCategory foodsCategory = FoodsCategory();
            foodsCategory.id = foodResult["id"];
            foodsCategory.name = foodResult["name"];
            foodsCategory.imageUrl = foodResult["imageUrl"];
            foodsCategory.isAvailable = foodResult["isAvailable"];
            foodsCategory.isVegan = foodResult["isVegan"];
            foodsCategory.isHalal = foodResult["isHalal"];
            foodsCategory.price = foodResult["price"];
            foodsCategory.salePrice = foodResult["salePrice"];
            foodsCategory.description = foodResult["description"];
            // print("foodsCategory ${foodsCategory.toMap()}");
            listFoodCategory.add(foodsCategory);
          });
          isGetDataComplete.value = true;
          // listFoodCategory.forEach((element) {
          //   print("network ${element.imageUrl}");
          // });
        }
      }
    } on d.DioError catch (ex) {
      _dioError(ex);
    }
  }

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
      "Information", // title
      "Network Error, Check your connection", // message
      barBlur: 20,
      isDismissible: true,
      duration: Duration(seconds: 3),
      snackPosition: SnackPosition.TOP,
    );
  }
}
