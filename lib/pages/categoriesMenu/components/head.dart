import 'package:dinethruu/utils/utilColors.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';

class Head extends StatefulWidget {
  @override
  _HeadState createState() => _HeadState();
}

class _HeadState extends State<Head> {
  @override
  Widget build(BuildContext context) {
    // double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    double topPaddingScreen = MediaQuery.of(context).padding.top;
    double headHeight = ((w * 0.136) + topPaddingScreen); //56/441.43
    print("# topPaddingScreen $topPaddingScreen --- w = $w");
    return Container(
      padding: EdgeInsets.only(
        left: w * 0.08, //33/441.43
        top: topPaddingScreen,
      ),
      height: headHeight,
      width: double.maxFinite,
      // color: Colors.pink,
      child: Container(
        // color: Colors.green,
        alignment: Alignment.centerLeft,
        height: (w * 0.136), //56/441.43
        child: Text(
          UtilString.categoriesMenuTitle,
          style: TextStyle(
            color: UtilColors.categoriesMenuTitle,
            fontWeight: FontWeight.bold,
            fontSize: UtilString.fontSizeCategoriesMenuTitle,
          ),
        ),
      ),
    );
  }
}
