import 'package:dinethruu/controllers/loginController.dart';
import 'package:dinethruu/utils/utilColors.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/body.dart';
import 'components/customBottomNav.dart';

class Otp extends StatefulWidget {
  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final LoginController loginController = Get.put(LoginController());
  String otp = "";
  String verificationId = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UtilColors.bgWhite,
      appBar: appBar(context),
      body: Body(),
      bottomNavigationBar: CustomBottomNav(
        onTap: () async {
          loginController.verifyOTP();
        },
      ),
    );
  }
}

Widget appBar(BuildContext context) {
  return AppBar(
    title: Text(
      UtilString.otpTitle,
      style: TextStyle(
        color: UtilColors.otpTextColor,
        fontSize: UtilString.fontSizeOTPTitle,
        fontWeight: FontWeight.bold,
      ),
    ),
    backgroundColor: UtilColors.bgWhite,
    elevation: 0,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back_ios_outlined,
        color: UtilColors.otpTextColor,
      ),
      onPressed: () {
        Get.back();
      },
    ),
  );
}
