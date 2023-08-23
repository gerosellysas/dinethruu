import 'package:flutter/material.dart';

import '../../../components/CustomLabelBox.dart';
import '../../../utils/utilColors.dart';
import '../../../utils/utilString.dart';

class CustomTextField extends StatelessWidget {
  final double height;
  final String labelText;
  final String hintText;
  final int maxLines;
  final double containerBottomMargin;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;

  const CustomTextField({
    Key key,
    this.height,
    this.labelText = "",
    this.hintText = "",
    this.maxLines = 1,
    this.containerBottomMargin,
    this.controller,
    this.keyboardType,
    this.textInputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return CustomLabelBox(
      height: height,
      backgroundColor: UtilColors.addMenuTextFieldBg,
      borderColor: UtilColors.addMenuTextFieldBorder,
      labelText: labelText,
      labelColor: UtilColors.addMenuLabelText,
      labelSize: UtilString.fontSizeAddMenuLabel,
      containerBottomMargin: containerBottomMargin == null
          ? w * 0.029 //12/441.43
          : containerBottomMargin,
      child: TextField(
        expands: false,
        maxLines: maxLines,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        controller: controller,
        cursorColor: UtilColors.addMenuInputText,
        style: TextStyle(
          decorationColor: UtilColors.addMenuInputText,
          color: UtilColors.addMenuInputText,
          fontSize: UtilString.fontSizeAddMenuInputText,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: w * 0.025, //10/441.43
            vertical: w * 0.03, //13/411.43
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: UtilColors.addMenuHintText,
            fontSize: UtilString.fontSizeAddMenuHint,
            fontWeight: FontWeight.w400,
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
