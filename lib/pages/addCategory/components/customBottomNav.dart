
import 'package:dinethruu/components/CustomButton.dart';
import 'package:dinethruu/utils/utilColors.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';

class CustomBottomNav extends StatelessWidget {
  final String buttonText;
  final Function onSaveOrEditTap;
  final Function onCancelTap;

  const CustomBottomNav({
    Key key,
    this.buttonText,
    this.onSaveOrEditTap,
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
            bgColor: UtilColors.addCategorySaveButtonBg,
            radius: 5,
            child: Text(
             buttonText,
              style: TextStyle(
                color: UtilColors.addCategorySaveButtonText,
                fontSize: UtilString.fontSizeAddCategoryButton,
                fontWeight: FontWeight.w400,
              ),
            ),
            onTap: onSaveOrEditTap,
          ),
          CustomButton(
            height: w * 0.11, //45/441.43
            width: w,
            bgColor: UtilColors.addCategoryCancelButtonBg,
            radius: 5,
            child: Text(
              UtilString.addCategoryCancelButton,
              style: TextStyle(
                color: UtilColors.addCategoryCancelButtonText,
                fontSize: UtilString.fontSizeAddCategoryButton,
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
