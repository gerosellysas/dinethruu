import 'package:dinethruu/api/api.dart';
import 'package:dinethruu/controllers/categoryController.dart';
import 'package:dinethruu/controllers/imagePickerController.dart';
import 'package:dinethruu/models/foodsCategory.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as d;
import 'package:shared_preferences/shared_preferences.dart';

import 'loginController.dart';

import 'package:path_provider/path_provider.dart';
import 'dart:io';

class MenuController extends GetxController {
  final LoginController loginController = Get.put(LoginController());
  final ImagePickerCtrl imagePickerCtrl = Get.put(ImagePickerCtrl());
  final CategoryController categoryController = Get.put(CategoryController());

  d.Dio dio = d.Dio();

  var isInternetNetworkSuccess = true.obs;
  var isGetDataComplete = true.obs;
  var menuTextController = TextEditingController().obs;
  var priceController = TextEditingController().obs;
  var salePriceController = TextEditingController().obs;
  var isVegan = false.obs;
  var isAvailable = false.obs;
  var descriptionTextController = TextEditingController().obs;
  var listCategoryName = <String>[].obs;
  var foodCategoryEdit = FoodsCategory().obs;
  var dropDownvalue = "".obs;
  var isEditMenu = false.obs;
  var isNeedReload = false.obs;
  var searchTextController = TextEditingController().obs;
  var searchResultVisible = false.obs;
  var searchResult = <String>[].obs;
  var foodMenuSearch = FoodsCategory().obs;
  var isSearchFound = false.obs;
  var isModeSearchView = false.obs;
  // var isUpdateImage = true.obs;
  var oldImageNetwork = "".obs;

  int categoryId = 0;

  Future<void> saveImageBase64(String image) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("image", image);
    print("token telah disimpan");
  }

  Future<String> futureLoadToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("image") ?? "null";
  }

  Future<String> getFilePath() async {
    Directory storageDirectory = await getExternalStorageDirectory();
    String sdPath = storageDirectory.path + "/record";

    return sdPath;
  }

  void saveFile(String image) async {
    File file = File(await getFilePath()); // 1
    file.writeAsString(image); // 2
  }

  Future<void> createMenu() async {
    await loginController.updateToken();
    String token = "Bearer ${loginController.token.value}";

    if (menuTextController.value.text == "") {
      Get.defaultDialog(
          title: "Information", middleText: "Menu Name cannot be empty");
    } else if (dropDownvalue.value == null || dropDownvalue.value == "") {
      Get.defaultDialog(
          title: "Information", middleText: "Category cannot be empty");
    } else if (priceController.value.text == "") {
      Get.defaultDialog(
          title: "Information", middleText: "Price cannot be empty");
    } else if (salePriceController.value.text == "") {
      Get.defaultDialog(
          title: "Information", middleText: "Sale cannot be empty");
    } else if (descriptionTextController.value.text == "") {
      Get.defaultDialog(
          title: "Information", middleText: "Description cannot be empty");
    } else if (imagePickerCtrl.imageBase64.value == "" ||
        imagePickerCtrl.imageBase64.value == null) {
      Get.defaultDialog(
          title: "Information", middleText: "Image cannot be empty");
    } else {
      print("test");

      isGetDataComplete.value = false;
      for (int i = 0; i < categoryController.listCategory.length; i++) {
        if (dropDownvalue.value == categoryController.listCategory[i].name) {
          categoryId = categoryController.listCategory[i].id;
          break;
        }
      }

      print("dropDownvalue.value ${dropDownvalue.value}");
      print("name: ${menuTextController.value.text}");
      // print("categoryName: ${categoryName}");
      print("categoryId $categoryId");
      print("price: ${double.parse(priceController.value.text)}");
      print("salePrice: ${double.parse(salePriceController.value.text)}");
      print("isVegan: ${isVegan.value}");
      print("isAvailable: ${isAvailable.value}");
      print("description: ${descriptionTextController.value.text}");
      print(
          "imagebase64 length ${imagePickerCtrl.imageBase64.value.split("").length}");
      // await saveImageBase64(imagePickerCtrl.imageBase64.value);
      // var im = await futureLoadToken();
      // print("im length => ${im.split("").length}");
      // saveFile(imagePickerCtrl.imageBase64.value);

      Map<String, dynamic> foodCategoryJson = {
        "id": 0,
        "name": menuTextController.value.text,
        "categoryId": categoryId,
        "price": double.parse(priceController.value.text),
        "salePrice": double.parse(salePriceController.value.text),
        "isVegan": isVegan.value,
        "isAvailable": isAvailable.value,
        "description": descriptionTextController.value.text,
        "imageBase64": imagePickerCtrl.imageBase64.value,
        "imageExtension": "png",
        "isUpdateImage": true
      };

      // print("foodCategoryJson ${foodCategoryJson}");

      try {
        dio.options.headers["Authorization"] = token;
        d.Response response = await dio.post(
          Api.shopMenuAddFoodMenu(),
          data: foodCategoryJson,
        );

        if (response.statusCode == 200) {
          isInternetNetworkSuccess.value = true;
          if (response.data["isSuccess"]) {
            print("# ada data 123");
            print("# response result 123=> ${response.data["result"]}");
            menuTextController.value.text = "";
            priceController.value.text = "";
            salePriceController.value.text = "";
            isVegan.value = false;
            isAvailable.value = false;
            descriptionTextController.value.text = "";
          }
          isGetDataComplete.value = true;
          isNeedReload.value ? Get.back(result: "reload") : Get.back();
          Get.snackbar(
            "Information", // title
            "Add menu is successful", // message
            barBlur: 20,
            isDismissible: true,
            duration: Duration(seconds: 3),
            snackPosition: SnackPosition.TOP,
          );
        }
      } on d.DioError catch (ex) {
        _dioError(ex);
      }
    }
  }

  Future<void> updateMenu() async {
    await loginController.updateToken();
    String token = "Bearer ${loginController.token.value}";
    if (imagePickerCtrl.isOldImage.value) // image doesn't change
    {
      imagePickerCtrl.imageBase64.value = "image not change";
    }

    if (menuTextController.value.text == "") {
      Get.defaultDialog(
          title: "Information", middleText: "Menu Name cannot be empty");
    } else if (dropDownvalue.value == null || dropDownvalue.value == "") {
      Get.defaultDialog(
          title: "Information", middleText: "Category cannot be empty");
    } else if (priceController.value.text == "") {
      Get.defaultDialog(
          title: "Information", middleText: "Price cannot be empty");
    } else if (salePriceController.value.text == "") {
      Get.defaultDialog(
          title: "Information", middleText: "Sale cannot be empty");
    } else if (descriptionTextController.value.text == "") {
      Get.defaultDialog(
          title: "Information", middleText: "Description cannot be empty");
    } else if (imagePickerCtrl.imageBase64.value == "" ||
        imagePickerCtrl.imageBase64.value == null) {
      Get.defaultDialog(
          title: "Information", middleText: "Image cannot be empty");
    } else {
      print("test");
      int categoryId = 0;
      isGetDataComplete.value = false;
      for (int i = 0; i < categoryController.listCategory.length; i++) {
        if (dropDownvalue.value == categoryController.listCategory[i].name) {
          categoryId = categoryController.listCategory[i].id;
          break;
        }
      }
      print("categoryId $categoryId");
      print("dropDownvalue.value ${dropDownvalue.value}");
      print("name: ${menuTextController.value.text}");
      print(" id: ${foodCategoryEdit.value.id}");
      print("categoryId $categoryId");
      print("price: ${double.parse(priceController.value.text)}");
      print("salePrice: ${double.parse(salePriceController.value.text)}");
      print("isVegan: ${isVegan.value}");
      print("isAvailable: ${isAvailable.value}");
      print("description: ${descriptionTextController.value.text}");
      print(
          "imagebase64 length ${imagePickerCtrl.imageBase64.value.split("").length}");
      Map<String, dynamic> foodCategoryJson;

      if (imagePickerCtrl.isOldImage.value) // image doesn't change
      {
        foodCategoryJson = {
          "id": foodCategoryEdit.value.id,
          "name": menuTextController.value.text,
          "categoryId": categoryId,
          "price": double.parse(priceController.value.text),
          "salePrice": double.parse(salePriceController.value.text),
          "isVegan": isVegan.value,
          "isAvailable": isAvailable.value,
          "description": descriptionTextController.value.text,
          "imageBase64": "",
          "imageExtension": "png",
          "isUpdateImage": false
        };
        print("image tidak beruabah");
        print("foodCategoryJson $foodCategoryJson");
      } else {
        foodCategoryJson = {
          "id": foodCategoryEdit.value.id,
          "name": menuTextController.value.text,
          "categoryId": categoryId,
          "price": double.parse(priceController.value.text),
          "salePrice": double.parse(salePriceController.value.text),
          "isVegan": isVegan.value,
          "isAvailable": isAvailable.value,
          "description": descriptionTextController.value.text,
          "imageBase64": imagePickerCtrl.imageBase64.value,
          "imageExtension": "png",
          "isUpdateImage": true
        };
        print("image berubah");
      }

      // print("foodCategoryJson ${foodCategoryJson}");

      try {
        dio.options.headers["Authorization"] = token;
        d.Response response = await dio.post(
          Api.shopMenuEditFoodMenu(),
          data: foodCategoryJson,
        );

        if (response.statusCode == 200) {
          isInternetNetworkSuccess.value = true;
          if (response.data["isSuccess"]) {
            print("# ada data 123");
            print("# response result 123=> ${response.data["result"]}");
            menuTextController.value.text = "";
            priceController.value.text = "";
            salePriceController.value.text = "";
            isVegan.value = false;
            isAvailable.value = false;
            descriptionTextController.value.text = "";
          }
          isGetDataComplete.value = true;
          isNeedReload.value ? Get.back(result: "reload") : Get.back();
          Get.snackbar(
            "Information", // title
            "Update menu is successful", // message
            barBlur: 20,
            isDismissible: true,
            duration: Duration(seconds: 3),
            snackPosition: SnackPosition.TOP,
          );
        }
      } on d.DioError catch (ex) {
        _dioError(ex);
      }
    }
  }

  Future<void> deleteMenu(int id, categoryId) async {
    await loginController.updateToken();
    String token = "Bearer ${loginController.token.value}";
    isGetDataComplete.value = false;
    try {
      dio.options.headers["Authorization"] = token;
      d.Response response = await dio.delete(Api.shopMenuDeleteFoodMenu(id));

      if (response.statusCode == 200) {
        isInternetNetworkSuccess.value = true;
        if (response.data["isSuccess"]) {
          await categoryController.listFoodOfCategory(categoryId);
          print("update categoryId");
          isGetDataComplete.value = true;
        }
        // isGetDataComplete.value = true;

        Get.snackbar(
          "Information", // title
          "Delete item is successful", // message
          barBlur: 20,
          isDismissible: true,
          duration: Duration(seconds: 3),
          snackPosition: SnackPosition.TOP,
        );
      }
    } on d.DioError catch (ex) {
      _dioError(ex);
    }
  }

  Future<void> getListCategoryName() async {
    listCategoryName.clear();
    await Future.forEach(categoryController.listCategory, (nameResult) async {
      String categoryName = nameResult.name;
      listCategoryName.add(categoryName);
    });
    dropDownvalue.value = listCategoryName[0];
  }

  Future<void> foodMenuEdit(String categoryName) async {
    print("categoryName $categoryName");
    oldImageNetwork.value = foodCategoryEdit.value.imageUrl;
    menuTextController.value.text = foodCategoryEdit.value.name;
    dropDownvalue.value = categoryName;
    priceController.value.text = foodCategoryEdit.value.price.toString();
    salePriceController.value.text =
        foodCategoryEdit.value.salePrice.toString();
    isVegan.value = foodCategoryEdit.value.isVegan;
    isAvailable.value = foodCategoryEdit.value.isAvailable;
    descriptionTextController.value.text = foodCategoryEdit.value.description;
    // print("menuTextController ${menuTextController.value.text}");
    print("dropDownvalue ${dropDownvalue.value}");
  }

  Future<void> dataMenuClear() async {
    await getListCategoryName();
    print("listCategoryName $listCategoryName");
    imagePickerCtrl.compressImgPath.value = "";
    menuTextController.value.text = "";
    dropDownvalue.value = listCategoryName[0];
    priceController.value.text = "";
    salePriceController.value.text = "";
    isVegan.value = false;
    isAvailable.value = false;
    descriptionTextController.value.text = "";
    // print("menuTextController ${menuTextController.value.text}");
  }

  Future<void> filterSearch(String search) async {
    List<String> listFoodName = [];
    List<String> temp = [];
    var searchToLow = "";
    searchToLow = search.toLowerCase();
    print("filter search new order");
    await Future.forEach(categoryController.listFoodCategory, (data) async {
      listFoodName.add(data.name);
    });
    // print("listReferenceNo $listReferenceNo");
    await Future.forEach(listFoodName, (item) async {
      // print("searchToLow $searchToLow item ${item.toLowerCase()}");
      if (item.toLowerCase().contains(searchToLow)) {
        temp.add(item);
        // print("item $item");
      }
    });
    searchResult.value = temp;
  }

  Future<bool> foodMenuSearchFilter(String search) async {
    for (int i = 0; i < categoryController.listFoodCategory.length; i++) {
      if (search == categoryController.listFoodCategory[i].name) {
        foodMenuSearch.value = categoryController.listFoodCategory[i];
        isSearchFound.value = true;
        isModeSearchView.value = true;
        return true;
      }
      // print("i $i");
    }
    isSearchFound.value = false;
    return false;
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
