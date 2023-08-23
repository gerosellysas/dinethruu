import 'package:dinethruu/components/CustomButton.dart';
import 'package:dinethruu/utils/utilColors.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';

class CustomButtomNav extends StatelessWidget {
  final String onAccept;
  final String onReject;
  final Function onAcceptTap;
  final Function onRejectTap;
  final Function onCall;
  final bool isCompleted;

  const CustomButtomNav({
    Key key,
    this.onAccept = "",
    this.onReject = "",
    this.onAcceptTap,
    this.onRejectTap,
    this.isCompleted = false,
    this.onCall,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      height: isCompleted ? 60 : 105,
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: w * 0.06),
      margin: EdgeInsets.only(bottom: 10),
      alignment: Alignment.center,
      color: UtilColors.orderDetailsCardBg,
      child: isCompleted
          ? CustomButton(
              height: 45,
              width: w,
              bgColor: UtilColors.orderDetailsGreenButtonBg,
              radius: 5,
              child: Text(
                "Call",
                style: TextStyle(
                    color: UtilColors.orderDetailsButtonText,
                    fontSize: UtilString.fontSizeOrderDetailsButton,
                    fontWeight: FontWeight.w400),
              ),
              onTap: onCall,
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(
                  height: 45,
                  width: w,
                  bgColor: UtilColors.orderDetailsGreenButtonBg,
                  radius: 5,
                  child: Text(
                    "$onAccept",
                    style: TextStyle(
                        color: UtilColors.orderDetailsButtonText,
                        fontSize: UtilString.fontSizeOrderDetailsButton,
                        fontWeight: FontWeight.w400),
                  ),
                  onTap: onAcceptTap,
                ),
                CustomButton(
                  height: 45,
                  width: w,
                  bgColor: UtilColors.orderDetailsRedButtonBg,
                  radius: 5,
                  child: Text(
                    "$onReject",
                    style: TextStyle(
                        color: UtilColors.orderDetailsButtonText,
                        fontSize: UtilString.fontSizeOrderDetailsButton,
                        fontWeight: FontWeight.w400),
                  ),
                  onTap: onRejectTap,
                ),
              ],
            ),
    );
  }
}
