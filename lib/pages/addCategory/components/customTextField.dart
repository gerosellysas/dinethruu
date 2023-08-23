
import 'package:dinethruu/components/CustomLabelBox.dart';
import 'package:dinethruu/utils/utilColors.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';

class CustomAddCategoryTextField extends StatelessWidget {
  final Function(String) onChanged;
  final TextEditingController controller;
  final Function onTap;

  const CustomAddCategoryTextField({
    Key key,
    this.onChanged,
    this.controller,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return CustomLabelBox(
      // key: UniqueKey(),
      backgroundColor: UtilColors.addCategoryTextFieldBg,
      borderColor: UtilColors.addCategoryTextFieldBorder,
      labelText: UtilString.addCategoryLabel,
      labelColor: UtilColors.addCategoryLabelText,
      labelSize: UtilString.fontSizeAddCategoryLabel,
      containerTopMargin: w * 0.022, //9/441.43
      child: TextField(
        // key: UniqueKey(),
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
          hintText: UtilString.addCategoryHint,
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
