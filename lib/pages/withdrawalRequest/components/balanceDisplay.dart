import 'package:dinethruu/components/CustomLabelBox.dart';
import 'package:dinethruu/utils/utilColors.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';

class BalanceDisplay extends StatelessWidget {
  final String labelText;
  final String text;

  const BalanceDisplay({
    Key key,
    this.labelText,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomLabelBox(
      backgroundColor: UtilColors.wdReqBalanceDisplayBg,
      borderColor: UtilColors.wdReqBalanceDisplayBorder,
      labelText: "$labelText",
      labelColor: UtilColors.wdReqFormLabel,
      labelSize: UtilString.fontSizeWDReqFormLabel,
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          color: UtilColors.wdReqBalanceDisplayBg,
          child: Text(
            "$text",
            style: TextStyle(
              color: UtilColors.wdReqFormInput,
              fontSize: UtilString.fontSizeWDReqFormInput,
            ),
          ),
        ),
      ),
    );
  }
}
