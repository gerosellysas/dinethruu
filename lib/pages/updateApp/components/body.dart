import 'package:dinethruu/controllers/loginController.dart';
import 'package:dinethruu/pages/home/home.dart';
import 'package:dinethruu/pages/updateApp/components/customBottomNav.dart';
import 'package:dinethruu/utils/utilColors.dart';
import 'package:dinethruu/utils/utilImages.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: w * 0.045, //20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              height: double.maxFinite,
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 88,
                    width: 103,
                    child: Image.asset(UtilImages.updateIcon),
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  Container(
                    child: Text(
                      loginController.isUpdateAvailable.value
                          ? UtilString.updateAvailableTitle
                          : UtilString.updateRequiredTitle,
                      style: TextStyle(
                        color: UtilColors.updateTitleText,
                        fontSize: UtilString.fontSizeUpdateTitle,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: Text(
                      loginController.isUpdateAvailable.value
                          ? UtilString.updateAvailableBody1
                          : UtilString.updateRequiredBody1,
                      style: TextStyle(
                        color: UtilColors.updateBodyText,
                        fontSize: UtilString.fontSizeUpdateBody,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      loginController.isUpdateAvailable.value
                          ? UtilString.updateAvailableBody2
                          : UtilString.updateRequiredBody2,
                      style: TextStyle(
                        color: UtilColors.updateBodyText,
                        fontSize: UtilString.fontSizeUpdateBody,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      loginController.isUpdateAvailable.value
                          ? UtilString.updateAvailableBody3
                          : UtilString.updateRequiredBody3,
                      style: TextStyle(
                        color: UtilColors.updateBodyText,
                        fontSize: UtilString.fontSizeUpdateBody,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      loginController.isUpdateAvailable.value
                          ? ""
                          : UtilString.updateRequiredBody4,
                      style: TextStyle(
                        color: UtilColors.updateBodyText,
                        fontSize: UtilString.fontSizeUpdateBody,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomBottomNav(
            cancelButtonText: loginController.isUpdateAvailable.value
                ? UtilString.updateAvailableCancelButton
                : UtilString.updateRequiredCancelButton,
            onUpdateTap: () {
              loginController.launchURL();
            },
            onCancelTap: () {
              loginController.isUpdateAvailable.value
                  ? Get.offAll(() => Home())
                  : Get.back();
            },
          ),
        ],
      ),
    );
  }
}
