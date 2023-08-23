import 'package:flutter/material.dart';

import '../../../components/CustomButton.dart';
import '../../../utils/utilColors.dart';
import '../../../utils/utilString.dart';

class CustomBottomNav extends StatelessWidget {
  final Function onSaveTap;
  final Function onCancelTap;

  const CustomBottomNav({
    Key key,
    this.onSaveTap,
    this.onCancelTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      height: w * 0.255, //105/441.43
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: w * 0.012, //5/441.43
      ),
      margin: EdgeInsets.only(
        bottom: w * 0.025, //10/441.43
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomButton(
            height: w * 0.11, //45/441.43
            width: w,
            bgColor: UtilColors.addMenuSaveButtonBg,
            radius: 5,
            child: Text(
              UtilString.addMenuSaveButton,
              style: TextStyle(
                color: UtilColors.addMenuSaveButtonText,
                fontSize: UtilString.fontSizeAddMenuButton,
                fontWeight: FontWeight.w400,
              ),
            ),
            onTap: onSaveTap,
          ),
          CustomButton(
            height: w * 0.11, //45/441.43
            width: w,
            bgColor: UtilColors.addMenuCancelButtonBg,
            radius: 5,
            child: Text(
              UtilString.addMenuCancelButton,
              style: TextStyle(
                color: UtilColors.addMenuCancelButtonText,
                fontSize: UtilString.fontSizeAddMenuButton,
                fontWeight: FontWeight.w400,
              ),
            ),
            onTap: onCancelTap,
          ),
        ],
      ),
    );
  }
}
