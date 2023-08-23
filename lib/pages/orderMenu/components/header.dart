import 'package:dinethruu/utils/utilColors.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  final Function onSearchPressed;

  const Header({
    Key key,
    this.onSearchPressed,
  }) : super(key: key);

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
      height: headerHeight,
      width: double.maxFinite,
      color: UtilColors.bgWhite,
      child: Column(
        children: [
          Expanded(
            child: Container(),
          ),
          Container(
            height: 60,
            width: double.maxFinite,
            color: UtilColors.bgWhite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: w * 0.08),
                  alignment: Alignment.center,
                  color: UtilColors.bgWhite,
                  child: Text(
                    UtilString.homeOrderMenuTitle,
                    style: TextStyle(
                        color: UtilColors.homeOrderMenuTitle,
                        fontSize: UtilString.fontSizeHomeOrderMenuTitle,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: double.maxFinite,
                  width: 50,
                  margin: EdgeInsets.only(right: w * 0.08),
                  alignment: Alignment.center,
                  color: UtilColors.bgWhite,
                  child: IconButton(
                    icon: Icon(
                      Icons.search,
                      color: UtilColors.homeOrderMenuTitle,
                    ),
                    onPressed: widget.onSearchPressed,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
