import 'package:dinethruu/components/CustomButton.dart';
import 'package:dinethruu/utils/utilColors.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';

class CustomBottomNav extends StatelessWidget {
  final Function onTap;

  const CustomBottomNav({
    Key key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      height: 80,
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: w * 0.05),
      alignment: Alignment.topCenter,
      color: UtilColors.bgWhite,
      child: CustomButton(
          bgColor: UtilColors.otpVerifyButtonBg,
          width: double.maxFinite,
          radius: 5,
          child: Text(
            UtilString.otpVerifyButton,
            style: TextStyle(
                color: UtilColors.otpVerifyButtonText,
                fontSize: UtilString.fontSizeOTPVerifyButton,
                fontWeight: FontWeight.w400),
          ),
          onTap: onTap),
    );
  }
}
