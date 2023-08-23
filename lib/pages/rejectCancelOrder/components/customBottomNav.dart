import 'package:dinethruu/components/CustomButton.dart';
import 'package:dinethruu/utils/utilColors.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';

class CustomBottomNav extends StatelessWidget {
  final String rejectCancelOrderButtonText;
  final Function onRejectCancelOrderTap;
  final Function onBackTap;

  const CustomBottomNav({
    Key key,
    this.rejectCancelOrderButtonText,
    this.onRejectCancelOrderTap,
    this.onBackTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      height: 105,
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: w * 0.06),
      margin: EdgeInsets.only(bottom: 10),
      alignment: Alignment.center,
      color: UtilColors.bgWhite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomButton(
            height: 45,
            width: w,
            bgColor: UtilColors.rejectCancelOrderButtonBg,
            radius: 5,
            child: Text(
              "$rejectCancelOrderButtonText",
              style: TextStyle(
                  color: UtilColors.rejectCancelOrderButtonText,
                  fontSize: UtilString.fontSizeRejectCancelOrderButtonText,
                  fontWeight: FontWeight.w400),
            ),
            onTap: onRejectCancelOrderTap,
          ),
          CustomButton(
            height: 45,
            width: w,
            bgColor: UtilColors.rejectCancelOrderBackButtonBg,
            radius: 5,
            child: Text(
              UtilString.rejectCancelOrderBackButton,
              style: TextStyle(
                  color: UtilColors.rejectCancelOrderBackButtonText,
                  fontSize: UtilString.fontSizeRejectCancelOrderButtonText,
                  fontWeight: FontWeight.w400),
            ),
            onTap: onBackTap,
          ),
        ],
      ),
    );
  }
}
