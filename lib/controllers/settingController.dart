import 'package:dinethruu/api/api.dart';
import 'package:dinethruu/controllers/loginController.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as d;

class SettingController extends GetxController {
  final LoginController loginController = Get.put(LoginController());
  d.Dio dio = d.Dio();

  var isToggled = false.obs;
  var isInternetNetworkSuccess = true.obs;
  var isGetDataComplete = true.obs;

  Future<void> statusShop() async {
    await loginController.updateToken();
    String token = "Bearer ${loginController.token.value}";
    isGetDataComplete.value = false;
    Map<String, dynamic> statusJson = {"isAvailable": isToggled.value};
    print("statusJson $statusJson");
    try {
      dio.options.headers["Authorization"] = token;
      d.Response response = await dio.post(Api.statusShop(), data: statusJson);
      print("statusCode ${response.statusCode}");
      if (response.statusCode == 200) {
        isInternetNetworkSuccess.value = true;
        print("data statusShop ${response.data}");
        if (response.data["isSuccess"]) {
          Future.delayed(Duration(seconds: 1), () {
            isGetDataComplete.value = true;
            print("reload");
          });
        }
      }
    } on d.DioError catch (ex) {
      _dioError(ex);
      isGetDataComplete.value = true;
    }
  }

  Future<void> signOut() async {
    await loginController.logOut();
  }

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
