import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final double height;
  final double width;
  final Color backgroundColor;
  final Color dividerColor;
  final double dividerOpacity;
  final double leftPadding;
  final double topPadding;
  final double rightPadding;
  final double bottomPadding;
  final Widget leftChild;
  final Widget rightChild;

  const CustomListTile({
    Key key,
    this.height,
    this.width = double.maxFinite,
    this.backgroundColor,
    this.dividerColor,
    this.dividerOpacity = 1.0,
    this.leftPadding = 0.0,
    this.topPadding = 0.0,
    this.rightPadding = 0.0,
    this.bottomPadding = 0.0,
    this.leftChild,
    this.rightChild,
  })  : assert(dividerOpacity >= 0.0 && dividerOpacity <= 1.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        leftPadding,
        topPadding,
        rightPadding,
        bottomPadding,
      ),
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: dividerColor.withOpacity(dividerOpacity),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [leftChild, rightChild],
      ),
    );
  }
}
