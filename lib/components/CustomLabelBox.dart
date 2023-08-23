import 'package:flutter/material.dart';

class CustomLabelBox extends StatelessWidget {
  final double height;
  final double width;
  final String labelText;
  final Color labelColor;
  final double labelSize;
  final FontWeight labelWeight;
  final Color backgroundColor;
  final Color borderColor;
  final double containerTopMargin;
  final double containerBottomMargin;
  final Widget child;

  const CustomLabelBox({
    Key key,
    this.height = 50,
    this.width = double.maxFinite,
    this.labelText = "",
    this.labelColor,
    this.labelSize,
    this.labelWeight = FontWeight.w400,
    this.backgroundColor,
    this.borderColor = Colors.transparent,
    this.containerTopMargin = 5,
    this.containerBottomMargin = 12,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$labelText",
          style: TextStyle(
            color: labelColor,
            fontSize: labelSize,
            fontWeight: labelWeight
          ),
        ),
        SizedBox(height: containerTopMargin),
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              width: 1,
              color: borderColor,
            ),
          ),
          child: child,
        ),
        SizedBox(
          height: containerBottomMargin,
        ),
      ],
    );
  }
}
