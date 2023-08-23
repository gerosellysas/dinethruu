import 'package:dinethruu/components/CustomLabelBox.dart';
import 'package:dinethruu/utils/utilColors.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
  final Function(String) onChanged;
  final TextEditingController controller;
  final Function onTap;

  const CustomSearchTextField({
    Key key,
    this.onChanged,
    this.controller,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      width: w * 0.7,
      height: 45,
      // color: Colors.red,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: UtilColors.wdReqTitle, width: 1),
      ),
      child: TextField(
        expands: false,
        controller: controller,
        onTap: onTap,
        onChanged: onChanged,
        cursorColor: UtilColors.addCategoryInputText,
        style: TextStyle(
          decorationColor: UtilColors.addCategoryInputText,
          color: UtilColors.addCategoryInputText,
          fontSize: UtilString.fontSizeAddCategoryInputText,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: w * 0.025, //10/441.43
          ),
          hintText: "Enter Menu Name",
          hintStyle: TextStyle(
            color: UtilColors.addCategoryHintText,
            fontSize: UtilString.fontSizeAddCategoryHint,
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
