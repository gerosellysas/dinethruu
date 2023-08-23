import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double height;
  final double width;
  final Function onTap;
  final Color bgColor;
  final Color borderColor;
  final Color splashColor;
  final double radius;
  final double widthBorder;
  final Widget child;

  CustomButton({
    Key key,
    this.height = 47,
    this.width = 100,
    this.onTap,
    this.bgColor = Colors.blue,
    this.borderColor = Colors.transparent,
    this.splashColor = Colors.grey,
    this.radius = 10,
    this.widthBorder = 0.1,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color splashColorChange;
    (splashColor == Colors.grey)
        ? splashColorChange = Colors.grey[400]
        : splashColorChange = splashColor;
    return Material(
      color: bgColor,
      borderRadius: BorderRadius.circular(radius),
      child: InkWell(
          splashColor: splashColorChange,
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          child: Container(
            height: height,
            width: width,
            padding: EdgeInsets.all(height * 0.1),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius),
                border: Border.all(width: widthBorder, color: borderColor)),
            child: Center(child: child),
          ),
          onTap: onTap),
    );
  }
}
