import 'package:dinethruu/components/CustomLabelBox.dart';
import 'package:dinethruu/utils/utilColors.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';

class CustomDropDownField extends StatelessWidget {
  final double height;
  final String labelText;
  final String hintText;
  final int maxLines;
  final int minLines;
  final double containerBottomMargin;
  final List<String> items;
  // final String value;
  final Function(String) onChanged;
  final String dropDownValue;

  const CustomDropDownField({
    Key key,
    this.height,
    this.labelText = "",
    this.hintText = "",
    this.maxLines,
    this.minLines,
    this.containerBottomMargin,
    this.items,
    // this.value,
    this.onChanged,
    this.dropDownValue,
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
      child:
          // /*
          DropdownButtonFormField(
        icon: Icon(
          Icons.arrow_drop_down_circle,
          color: UtilColors.addMenuTextFieldBorder,
        ),
        items: items.map((item) {
          return DropdownMenuItem(
            value: item,
            child: Text(item),
          );
        }).toList(),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: w * 0.025, //10/441.43
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: UtilColors.addMenuHintText,
            fontSize: UtilString.fontSizeAddMenuHint,
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
        ),
        onChanged: onChanged,
        value: dropDownValue,
      ),
    );
  }
}
