import 'package:dinethruu/utils/utilColors.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final Function(String) onChanged;
  final TextEditingController controller;

  const CustomTextField({
    Key key,
    this.onChanged,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      width: w * 0.7,
      height: 45,
      decoration: BoxDecoration(
        color: UtilColors.orderMenuSearchFormBg,
        borderRadius: BorderRadius.circular(5),
        border:
            Border.all(color: UtilColors.orderMenuSearchFormBorder, width: 1),
      ),
      child: TextField(
        expands: false,
        controller: controller,
        keyboardType: TextInputType.text,
        onChanged: onChanged,
        style: TextStyle(
            color: UtilColors.orderMenuSearchFormInput,
            decorationColor: UtilColors.orderMenuSearchFormInput,
            fontSize: UtilString.fontSizeOrderMenuSearchFormInput,
            fontWeight: FontWeight.w400),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 13,
          ),
          hintText: UtilString.orderMenuSearchFormHint,
          hintStyle: TextStyle(
              color: UtilColors.orderMenuSearchFormHint,
              fontSize: UtilString.fontSizeOrderMenuSearchFormHint,
              fontWeight: FontWeight.w400),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
