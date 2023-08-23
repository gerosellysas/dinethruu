import 'package:dinethruu/api/api.dart';
import 'package:dinethruu/models/version.dart';
import 'package:dinethruu/pages/home/home.dart';
import 'package:dinethruu/pages/login/login.dart';
import 'package:dinethruu/pages/otp/otp.dart';
import 'package:dinethruu/pages/updateApp/updateApp.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:dio/dio.dart' as d;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginController extends GetxController {
  // final CheckLoginController checkLoginController =
  //     Get.put(CheckLoginController());

  d.Dio dio = d.Dio();
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  var isTextFieldEmpty = false.obs;
  var showLoading = false.obs;
  //
  var otpFill = "".obs;
  var token = "".obs;
  var phoneController = TextEditingController().obs;
  var isUpdateAvailable = true.obs;
  var isInternetNetworkSuccess = true.obs;
  var isGetDataComplete = false.obs;
  var tokenFCM = "".obs;
  //
  String verificationID = "1234";
  var authCredential;
  var buildNumberApp = "0";
  Version version = Version();
  //

  @override
  void onInit() {
    // called immediately after the widget is allocated memory
    _initPackageInfo();
    super.onInit();
  }

  // Login verification
  Future<void> login(String phoneNumber) async {
    if (phoneController.value.text == "") {
      isTextFieldEmpty.value = true;
    } else {
      isTextFieldEmpty.value = false;
      showLoading.value = true;
      var result = await verificationPhoneNumber(phoneNumber);
      print("result $result");
      if (result) {
        print("verifyphone");
        _auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (phoneAuthCredential) async {
            print("verifikasi ok");

            showLoading.value = false;
            Get.to(() => Otp());
          },
          verificationFailed: (verificationFailed) async {
            showLoading.value = false;
            print("verification error $verificationFailed");
            Get.snackbar(
              UtilString.notifErrorTitle, // title
              "verification error $verificationFailed", // message
              barBlur: 20,
              isDismissible: true,
              duration: Duration(seconds: 3),
              snackPosition: SnackPosition.TOP,
            );
          },
          codeSent: (verificationId, resendingToken) async {
            verificationID = verificationId;

            showLoading.value = false;
            print("codeSent => verificationId $verificationId");
            Get.to(() => Otp());
          },
          codeAutoRetrievalTimeout: (verificationId) async {},
        );
      }
    }
  }

  // OTP verification
  Future<void> verifyOTP() async {
    print("verificationID $verificationID");
    print("otpFill ${otpFill.value}");
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: otpFill.value);
    if (otpFill.value == "") {
      Get.snackbar(
        UtilString.notifInfoTitle, // title
        UtilString.notifOTPInfoEmptyForm, // message
        barBlur: 20,
        isDismissible: true,
        duration: Duration(seconds: 3),
        snackPosition: SnackPosition.TOP,
      );
    } else {
      showLoading.value = true;
      try {
        authCredential = await _auth.signInWithCredential(phoneAuthCredential);
        print("authCredential => $authCredential");
        token.value = await authCredential.user.getIdToken();
        print("token 1 $token %%");
        await saveToken(token.value);
        await checkVersionAndGoToHome();
      } on FirebaseException catch (e) {
        print("error firebase +> $e");
        Future.delayed(Duration(milliseconds: 500), () {
          showLoading.value = false;
          Get.defaultDialog(
            title: UtilString.notifErrorTitle, // title
            middleText: UtilString.notifOTPErrorIncorrectOTP, // message
            radius: 10,
          );
        });
      }
    }
  }

  Future<void> logOut() async {
    try {
      print("user sebelum logout => ${_auth.currentUser}");
      isGetDataComplete.value = false;
      if (_auth.currentUser != null) {
        await _auth.signOut();
        await saveToken("");
        isGetDataComplete.value = true;
        print("user sesudah logout => ${_auth.currentUser}");
        Get.offAll(Login());
      }
    } on FirebaseException catch (e) {
      print("error firebase +> $e");
      Future.delayed(Duration(milliseconds: 500), () {
        showLoading.value = false;
        Get.defaultDialog(
          title: UtilString.notifErrorTitle, // title
          middleText: "Log out error", // message
          radius: 10,
        );
      });
    }
  }

  // Login phone number format validation
  Future<bool> verificationPhoneNumber(String number) async {
    var split = number.split("");
    var tempNumber = "";

    print("tempNumber $tempNumber");
    if (split[0] != "+") {
      await Get.defaultDialog(
        title: UtilString.notifInfoTitle, // title
        middleText: UtilString.notifLoginInfoCountryCode, // message
        radius: 10,
      );
      showLoading.value = false;
      return false;
    } else {
      for (int i = 1; i < split.length; i++) {
        print("split => ${split[i]}");
        final number = num.tryParse(split[i]);
        if (number == null) {
          print("null");
          Get.defaultDialog(
            title: UtilString.notifErrorTitle, // title
            middleText: UtilString.notifLoginErrorInputNumber, //message
            radius: 10,
          );
          showLoading.value = false;
          return false;
        }
      }
      return true;
    }
  }

  // Update token
  Future<void> updateToken() async {
    // print("user => ${_auth.currentUser}");
    // token.value = await authCredential.user.getIdToken();
    // var idTokenResult = await _auth.currentUser.getIdTokenResult(true);
    var temp = await _auth.currentUser.getIdToken();
    token.value = temp;
    print("${temp}");
    print("${token.value}");
    // print("idtoken =>  ${idToken}");
    // token.value = idToken;
  }

  // check app version
  Future<void> _initPackageInfo() async {
    final packageInfo = await PackageInfo.fromPlatform();
    print("appName => ${packageInfo.appName}");
    print("packageName => ${packageInfo.packageName}");
    print("version => ${packageInfo.version}");
    print("buildNumber => ${packageInfo.buildNumber}");
    buildNumberApp = packageInfo.buildNumber;
  }

  // check version ==============================================================
  Future<void> checkVersion() async {
    await updateToken();
    String tokenValue = "Bearer ${token.value}";
    isGetDataComplete.value = false;
    Map<String, dynamic> versionJson = {
      "currentVersion": buildNumberApp,
      "platform": "android",
      "applicationId": 2
    };

    try {
      dio.options.headers["Authorization"] = token;
      d.Response response = await dio.post(
        "${Api.checkVersion()}",
        data: versionJson,
      );
      print("statusCode ${response.statusCode}");
      if (response.statusCode == 200) {
        isInternetNetworkSuccess.value = true;
        print("data ${response.data}");
        if (response.data["isSuccess"]) {
          version = Version.fromMap(response.data["result"]);
          print("version ${version.toMap()}");
        }
        isGetDataComplete.value = true;
      }
    } on d.DioError catch (ex) {
      _dioError(ex);
      isGetDataComplete.value = true;
    }
  }

  Future<void> checkVersionAndGoToHome() async {
    if (_auth.currentUser != null) {
      print("user => ${_auth.currentUser.uid}");
      await profileDevice();
      await checkVersion();
      if (int.parse(version.latestVersion) == int.parse(buildNumberApp)) {
        showLoading.value = false;
        phoneController.value.text = "";
        Get.offAll(() => Home());
      } else {
        showLoading.value = false;
        phoneController.value.text = "";
        if (version.isRequired) {
          isUpdateAvailable.value = false;
        } else {
          isUpdateAvailable.value = true;
        }
        Get.offAll(() => UpdateApp());
      }
    } else {
      print("user => tidak ada");
    }
  }

  Future<void> saveToken(String token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("token", token);
    print("token telah disimpan");
  }

  void loadToken() async {
    var tempToken = await futureLoadToken();
    print("tempToken => $tempToken");
    if (tempToken == "null" || tempToken == "") {
      Future.delayed(Duration(milliseconds: 2000), () {
        isGetDataComplete.value = true;
        Get.to(() => Login());
      });
    } else {
      try {
        var result = await getProfile(tempToken);
        print("result profile => $result");
        print("current user => ${_auth.currentUser}");
        if (result) {
          print("result 1 go to Home");
          token.value = tempToken;
          await checkVersionAndGoToHome();
          isGetDataComplete.value = true;
          // Get.to(() => Home());
        } else {
          print("reload token");
          try {
            // var idTokenResult = await _auth.currentUser.getIdTokenResult(true);
            var idToken = await _auth.currentUser.getIdToken();
            print("temp token reload => ${idToken}");
            var result2 = await getProfile(idToken);
            if (result2) {
              print("result 2 go to Home");
              await saveToken(idToken);
              token.value = idToken;
              await checkVersionAndGoToHome();
              isGetDataComplete.value = true;
              // Get.to(() => Home());
            } else {
              print("result 2 gagal go to login");
              Get.to(() => Login());
            }
          } catch (e) {}
        }
      } catch (e) {
        print("error test token $e");
      }

      // print("token from shareP => ${token.value}");
      // print("updateToken");
      // await updateToken();
      // print("token from shareP => ${token.value}");

    }
  }

  Future<String> futureLoadToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("token") ?? "null";
  }

  Future<bool> getProfile(String token) async {
    try {
      dio.options.headers["Authorization"] = "Bearer $token";
      d.Response response = await dio.get(Api.profile());
      if (response.statusCode == 200) {
        print("respon 200");
        isInternetNetworkSuccess.value = true;
        if (response.data["isSuccess"]) {
          print("isSuccess true");
          return true;
        }
      }
      return false;
    } on d.DioError catch (ex) {
      _dioError(ex);
      return false;
    }
  }

  Future<void> getInitailMessage() async {
    _firebaseMessaging.getInitialMessage().then((RemoteMessage message) {
      // app close
      if (message != null) {
        goToHomeOrder();
      }
    });
    onMessageFMListener();
  }

  Future<void> onMessageFMListener() async {
    FirebaseMessaging.onMessage.listen((message) {
      //app is open
      goToHomeOrder();
      print('message on foreground');
      print(message.notification.title);
      print(message.notification.body);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) async {
      //app in backgorund
      goToHomeOrder();
      print('message on launchApp');
      print(message.notification.title);
      print(message.notification.body);
    });
  }

  Future<void> profileDevice() async {
    await updateToken();
    String token = "Bearer ${loginController.token.value}";
    isGetDataComplete.value = false;
    Map<String, dynamic> tokenFCMJson = {"deviceId": tokenFCM.value};
    try {
      dio.options.headers["Authorization"] = token;
      d.Response response = await dio.post(
        Api.profileDevice(),
        data: tokenFCMJson,
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

  Future<void> goToHomeOrder() async {
    Get.to(() => Home());
  }

  Future<void> getTokenFCM() async {
    _firebaseMessaging.getToken().then((value) {
      tokenFCM.value = value;
      print("token FCM => $value");
    });
  }

  launchURL() async {
    String url = version.storeUrl;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

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
    // Get.snackbar(
    //   UtilString.notifInfoTitle, // title
    //   UtilString.notifInfoConnectionError, // message
    //   barBlur: 20,
    //   isDismissible: true,
    //   duration: Duration(seconds: 3),
    //   snackPosition: SnackPosition.TOP,
    // );
  }
}
