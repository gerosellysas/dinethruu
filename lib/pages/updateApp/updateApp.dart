import 'package:dinethruu/controllers/loginController.dart';
import 'package:dinethruu/pages/home/home.dart';
import 'package:dinethruu/pages/updateApp/components/body.dart';
import 'package:dinethruu/utils/utilColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateApp extends StatefulWidget {
  @override
  _UpdateAppState createState() => _UpdateAppState();
}

final LoginController loginController = Get.put(LoginController());

class _UpdateAppState extends State<UpdateApp> {
  bool isUpdateAvailable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: UtilColors.bgWhite,
        appBar: appBar(context),
        body: Body());
  }
}

Widget appBar(BuildContext context) {
  double w = MediaQuery.of(context).size.width;
  return AppBar(
    backgroundColor: UtilColors.updateBgColor,
    elevation: 0,
    actions: [
      IconButton(
        icon: Icon(Icons.close),
        color: UtilColors.updateCloseIcon,
        iconSize: w * 0.075, //32.5/441.43,
        onPressed: () {
          loginController.isUpdateAvailable.value
              ? Get.offAll(() => Home())
              : Get.offAll(() => UpdateApp());
        },
      ),
      SizedBox(
        width: w * 0.034, //15,
      ),
    ],
  );
}
