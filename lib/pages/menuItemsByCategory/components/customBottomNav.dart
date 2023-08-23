import 'package:dinethruu/components/CustomButton.dart';
import 'package:dinethruu/utils/utilColors.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';

class CustomButtomNav extends StatelessWidget {
  final Function onAddMenuItemTap;

  const CustomButtomNav({
    Key key,
    this.onAddMenuItemTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      height: 87,
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: w * 0.06),
      margin: EdgeInsets.only(bottom: 10),
      alignment: Alignment.center,
      // color: Colors.pink,
      child: CustomButton(
        height: 45,
        width: w,
        bgColor: UtilColors.orderDetailsGreenButtonBg,
        radius: 5,
        child: Text(
          UtilString.menuItemButtonText,
          style: TextStyle(
            color: UtilColors.bgWhite,
            fontSize: UtilString.fontSizeMenuItemButtonText,
          ),
        ),
        onTap: onAddMenuItemTap,
      ),
    );
  }
}
