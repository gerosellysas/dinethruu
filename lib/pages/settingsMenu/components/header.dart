import 'package:dinethruu/utils/utilColors.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double topPaddingScreen = MediaQuery.of(context).padding.top;
    double headerHeight = 60 + topPaddingScreen;
    return Container(
      padding: EdgeInsets.only(
        left: w * 0.08,
        top: topPaddingScreen,
      ),
      height: headerHeight,
      width: double.maxFinite,
      color: UtilColors.settingsMenuHeaderBg,
      child: Container(
        height: 60,
        alignment: Alignment.centerLeft,
        color: UtilColors.settingsMenuHeaderBg,
        child: Text(
          UtilString.settingsMenuTitle,
          style: TextStyle(
              color: UtilColors.settingsMenuText,
              fontSize: UtilString.fontSizeSettingsMenuTitle,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
