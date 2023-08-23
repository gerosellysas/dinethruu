import 'package:dinethruu/components/CustomButton.dart';
import 'package:dinethruu/utils/utilColors.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';

class CustomBottomNav extends StatelessWidget {
  final Function onSendReqTap;
  final Function onCancelTap;

  const CustomBottomNav({
    Key key,
    this.onSendReqTap,
    this.onCancelTap,
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
      color: UtilColors.wdReqFormBg,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomButton(
            height: 45,
            width: double.maxFinite,
            bgColor: UtilColors.wdReqSendButtonBg,
            radius: 5,
            child: Text(
              UtilString.wdReqSendButton,
              style: TextStyle(
                color: UtilColors.wdReqSendButtonText,
                fontSize: UtilString.fontSizeWDReqButton,
                fontWeight: FontWeight.w400,
              ),
            ),
            onTap: onSendReqTap,
          ),
          CustomButton(
            height: 45,
            width: double.maxFinite,
            bgColor: UtilColors.wdReqCancelButtonBg,
            radius: 5,
            child: Text(
              UtilString.wdReqCancelButton,
              style: TextStyle(
                color: UtilColors.wdReqCancelButtonText,
                fontSize: UtilString.fontSizeWDReqButton,
                fontWeight: FontWeight.w400,
              ),
            ),
            onTap: onCancelTap,
          ),
        ],
      ),
    );
  }
}
