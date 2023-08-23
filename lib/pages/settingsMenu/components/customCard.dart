import 'package:dinethruu/utils/utilColors.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String labelText;
  final Widget child;
  final Function onTap;

  const CustomCard({
    Key key,
    this.labelText = "",
    this.child,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double horizontalPadding = w * 0.08;
    return Material(
      color: UtilColors.settingsMenuCardBg,
      child: InkWell(
          splashColor: Colors.grey[400],
          child: Container(
            height: 50,
            width: w,
            padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding, vertical: 10),
            child: Row(
              children: [
                Container(
                  height: double.maxFinite,
                  alignment: Alignment.centerLeft,
                  color: UtilColors.settingsMenuCardBg,
                  child: Text(
                    "$labelText",
                    style: TextStyle(
                        color: UtilColors.settingsMenuText,
                        fontSize: UtilString.fontSizeSettingsMenuLabel,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Expanded(child: Container()),
                Container(
                  height: double.maxFinite,
                  color: UtilColors.settingsMenuCardBg,
                  child: child,
                ),
              ],
            ),
          ),
          onTap: onTap),
    );
  }
}
