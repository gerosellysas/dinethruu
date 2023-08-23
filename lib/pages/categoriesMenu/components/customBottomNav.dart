import 'package:dinethruu/components/CustomButton.dart';
import 'package:dinethruu/utils/utilColors.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';

class CustomBottomNav extends StatelessWidget {
  final Function addCategory;
  final Function addMenuItem;

  const CustomBottomNav({
    Key key,
    this.addCategory,
    this.addMenuItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      height: w * 0.255, //105/441.43
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: w * 0.06, //24/441.43
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
            bgColor: UtilColors.categoriesMenuButtonBg,
            radius: 5,
            child: Text(
              UtilString.categoriesAddCategoryButton,
              style: TextStyle(
                color: UtilColors.categoriesMenuButtonText,
              ),
            ),
            onTap: addCategory,
          ),
          SizedBox(
            height: w * 0.025, //10/441.43
          ),
          CustomButton(
            height: w * 0.11, //45/441.43
            width: w,
            bgColor: UtilColors.categoriesMenuButtonBg,
            radius: 5,
            child: Text(
              UtilString.categoriesAddMenuItemButton,
              style: TextStyle(
                color: UtilColors.categoriesMenuButtonText,
              ),
            ),
            onTap: addMenuItem,
          ),
        ],
      ),
    );
  }
}