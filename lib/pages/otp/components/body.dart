import 'package:dinethruu/controllers/loginController.dart';
import 'package:dinethruu/utils/utilColors.dart';
import 'package:dinethruu/utils/utilImages.dart';
import 'package:dinethruu/utils/utilScrollBehavior.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final LoginController loginController = Get.put(LoginController());

  @override
  void initState() {
    super.initState();
    // listenOtg();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Obx(
      () => Stack(
        children: [
          ScrollConfiguration(
            behavior: CustomScrollBehavior(),
            child: ListView(
              children: [
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: h * 0.4,
                  width: double.maxFinite,
                  color: UtilColors.bgWhite,
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          height: double.maxFinite,
                          width: double.maxFinite,
                          margin: EdgeInsets.only(bottom: h * 0.02),
                          decoration: BoxDecoration(
                            color:UtilColors.bgWhite,
                            image: DecorationImage(
                              image: AssetImage(UtilImages.otpImage),
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 80,
                        width: double.maxFinite,
                        color: UtilColors.bgWhite,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AutoSizeText(
                              UtilString.otpSendToNumber1,
                              style: TextStyle(
                                  color: UtilColors.otpTextColor,
                                  fontWeight: FontWeight.w400),
                              textAlign: TextAlign.center,
                              presetFontSizes: [20],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    AutoSizeText(
                                      UtilString.otpSendToNumber2,
                                      style: TextStyle(
                                          color: UtilColors.otpTextColor,
                                          fontWeight: FontWeight.w400),
                                      textAlign: TextAlign.center,
                                      presetFontSizes: [20],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Obx(
                                      () => AutoSizeText(
                                        loginController
                                            .phoneController.value.text,
                                        style: TextStyle(
                                          color: UtilColors.otpTextColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                        presetFontSizes: [20],
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.edit,
                                    color: UtilColors.otpTextColor,
                                  ),
                                  onPressed: () {
                                    Get.back();
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: h * 0.04),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      color: UtilColors.bgWhite,
                      child: PinFieldAutoFill(
                        keyboardType: TextInputType.phone,
                        codeLength: 6,
                        decoration: UnderlineDecoration(
                          textStyle: TextStyle(
                              color: UtilColors.otpTextColor,
                              fontSize: UtilString.fontSizeOTPInputNumber,
                              fontWeight: FontWeight.w400),
                          colorBuilder: FixedColorBuilder(
                              UtilColors.otpInputNumberUnderlineColor),
                        ),
                        onCodeChanged: (value) {
                          print("value $value");
                          loginController.otpFill.value = value;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: h * 0.01),
                      color: UtilColors.bgWhite,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            UtilString.otpDidntReceive,
                            style: TextStyle(
                                color: UtilColors.otpTextColor,
                                fontSize: UtilString.fontSizeOTPResendText,
                                fontWeight: FontWeight.w400),
                          ),
                          TextButton(
                            child: Text(
                              UtilString.otpResend,
                              style: TextStyle(
                                  color: UtilColors.otpResendColor,
                                  fontSize: UtilString.fontSizeOTPResendText,
                                  fontWeight: FontWeight.w400),
                            ),
                            onPressed: () {
                              print("Resend");
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          loginController.showLoading.value
              ? SpinKitChasingDots(color: Colors.black38, size: h * 0.1)
              : Container(),
        ],
      ),
    );
  }

  Future<void> listenOtg() async {
    await SmsAutoFill().listenForCode;
  }
}
