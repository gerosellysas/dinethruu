import 'package:dinethruu/components/CustomLabelBox.dart';
import 'package:dinethruu/utils/utilColors.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';

class CustomWdReqTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function onTap;
  final bool isHintVisible;

  CustomWdReqTextField({
    Key key,
    this.controller,
    this.onTap,
    this.isHintVisible = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomLabelBox(
      backgroundColor: UtilColors.wdReqFormBg,
      borderColor: UtilColors.wdReqFormBorder,
      labelText: UtilString.wdReqAmountToWDLabel,
      labelColor: UtilColors.wdReqFormLabel,
      labelSize: UtilString.fontSizeWDReqFormLabel,
      child: Row(
        children: [
          isHintVisible
              ? Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    color: UtilColors.wdReqFormBg,
                    child: Text(
                      UtilString.wdReqHint,
                      style: TextStyle(
                          color: UtilColors.wdReqFormHint,
                          fontSize: UtilString.fontSizeWDReqFormHint,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                )
              : SizedBox.shrink(),
          Expanded(
            child: TextField(
              expands: false,
              controller: controller,
              onTap: onTap,
              textAlign: TextAlign.end,
              keyboardType: TextInputType.phone,
              style: TextStyle(
                  color: UtilColors.wdReqFormInput,
                  fontSize: UtilString.fontSizeWDReqFormInput,
                  fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
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
