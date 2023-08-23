import 'package:dinethruu/components/CustomButton.dart';
import 'package:dinethruu/controllers/loginController.dart';
import 'package:dinethruu/utils/utilColors.dart';
import 'package:dinethruu/utils/utilImages.dart';
import 'package:dinethruu/utils/utilScrollBehavior.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'components/CustomTextField.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loginForm(context),
    );
  }

  Widget loginForm(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    //
    double padding = w * 0.045;
    double heightForm = 500;
    double heightFormEstimated = h * 0.6;
    (heightFormEstimated < heightForm)
        ? heightForm = heightForm
        : heightForm = heightFormEstimated;
    //
    return Container(
      height: h,
      width: w,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(UtilImages.loginBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Obx(
        () => Stack(
          children: [
            ScrollConfiguration(
              behavior: CustomScrollBehavior(),
              child: ListView(
                children: [
                  Container(
                    height: h,
                    width: w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Container(
                            width: w * 0.8,
                            height: heightForm,
                            padding: EdgeInsets.fromLTRB(
                                padding, padding * 3, padding, padding),
                            decoration: BoxDecoration(
                                color: UtilColors.loginBgForm,
                                borderRadius: BorderRadius.circular(h * 0.02)),
                            child: Column(
                              children: [
                                Container(
                                  height: 103,
                                  width: 103,
                                  decoration: BoxDecoration(
                                    color: UtilColors.loginBgForm,
                                    image: DecorationImage(
                                      image:
                                          AssetImage(UtilImages.loginTitleIcon),
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(),
                                ),
                                CustomTextField(
                                  controller:
                                      loginController.phoneController.value,
                                  labelTitle: UtilString.loginFormLabelTitle,
                                  labelSubtitle:
                                      UtilString.loginFormLabelSubtitle,
                                  hintText: UtilString.loginFormHint,
                                ),
                                Obx(
                                  () =>
                                      loginController.isTextFieldEmpty.value ==
                                              true
                                          ? Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                UtilString.loginFormValidation,
                                                style: TextStyle(
                                                  color: UtilColors
                                                      .loginFormValidation,
                                                  fontSize: UtilString
                                                      .fontSizeLoginFormValidation,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            )
                                          : Container(),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(),
                                ),
                                CustomButton(
                                  bgColor: UtilColors.loginBgForm,
                                  child: Text(
                                    UtilString.loginButton,
                                    style: TextStyle(
                                      color: UtilColors.loginButtonText,
                                      fontSize: UtilString.fontSizeLoginButton,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  onTap: () async {
                                    print(
                                        "phone 1234 ${loginController.phoneController.value.text}");
                                    await loginController.login(loginController
                                        .phoneController.value.text);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: h * 0.02,
                          width: w * 0.7,
                          decoration: BoxDecoration(
                            color: UtilColors.loginBgTransparant,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(h * 0.015),
                              bottomRight: Radius.circular(h * 0.015),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            loginController.showLoading.value
                ? SpinKitChasingDots(color: Colors.black38, size: h * 0.1)
                : Container(),
          ],
        ),
      ),
    );
  }
}
