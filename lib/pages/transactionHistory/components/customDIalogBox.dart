import 'package:dinethruu/utils/utilColors.dart';
import 'package:dinethruu/utils/utilDate.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';

class CustomDialogBox extends StatelessWidget {
  final Widget child;

  const CustomDialogBox({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double calendarWidth = 0;
    if ((w * 0.8) < 309) {
      calendarWidth = 309;
    } else {
      calendarWidth = w * 0.8;
    }
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      child: Center(
        child: Container(
          height: 450,
          width: calendarWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Material(
            color: UtilColors.calendarBg,
            borderRadius: BorderRadius.circular(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  width: double.maxFinite,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: UtilColors.calendarHeaderBg,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Text(
                    Date.todayDate,
                    style: TextStyle(
                      color: UtilColors.calendarHeaderText,
                      fontSize: UtilString.calendarHeaderText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: child,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
