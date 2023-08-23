import 'package:dinethruu/utils/utilColors.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';

class RadioButtonCard extends StatelessWidget {
  final String radioButtonTitle;
  final Widget listRadioButtonBuilder;

  const RadioButtonCard({
    Key key,
    this.radioButtonTitle,
    this.listRadioButtonBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Expanded(
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(
          vertical: w * 0.045, //20,
        ),
        color: UtilColors.rejectCancelOrderCardBg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: w * 0.057, //25
              ),
              color: UtilColors.rejectCancelOrderCardBg,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "$radioButtonTitle",
                    style: TextStyle(
                        color: UtilColors.rejectCancelOrderRegularText,
                        fontSize:
                            UtilString.fontSizeRejectCancelOrderRegularText,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 10),
                  Container(
                    color: UtilColors.rejectCancelOrderCardBg,
                    child: listRadioButtonBuilder,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
