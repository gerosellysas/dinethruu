import 'package:dinethruu/utils/utilColors.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelTitle;
  final String labelSubtitle;

  const CustomTextField({
    Key key,
    this.controller,
    this.hintText = "",
    this.labelTitle = "",
    this.labelSubtitle = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      color: UtilColors.loginBgForm,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$labelTitle",
            style: TextStyle(
                color: UtilColors.loginFormLabelTitle,
                fontSize: UtilString.fontSizeLoginFormLabelTitle,
                fontWeight: FontWeight.w400),
          ),
          (labelSubtitle == "")
              ? Container()
              : Text(
                  "$labelSubtitle",
                  style: TextStyle(
                      color: UtilColors.loginFormLabelSubtitle,
                      fontSize: UtilString.fontSizeLoginFormLabelSubtitle,
                      fontWeight: FontWeight.w400),
                ),
          SizedBox(height: 10),
          Container(
            height: 47,
            decoration: BoxDecoration(
                color: UtilColors.loginBgForm,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: UtilColors.loginFormBorder)),
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.phone,
              style: TextStyle(
                  color: UtilColors.loginFormInput,
                  fontSize: UtilString.fontSizeLoginFormInput,
                  fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 13),
                hintText: "$hintText",
                hintStyle: TextStyle(
                    color: UtilColors.loginFormHint,
                    fontSize: UtilString.fontSizeLoginFormHint,
                    fontWeight: FontWeight.w400),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
