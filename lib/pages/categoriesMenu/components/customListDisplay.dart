import 'package:dinethruu/components/CustomListTile.dart';
import 'package:dinethruu/utils/utilColors.dart';
import 'package:dinethruu/utils/utilImages.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomListDisplay extends StatelessWidget {
  final String categories;
  final Function onEditTap;
  final Function onDeleteTap;
  final Function onCategoryTap;

  const CustomListDisplay({
    Key key,
    this.categories = "",
    this.onEditTap,
    this.onDeleteTap,
    this.onCategoryTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        CustomListTile(
          height: w * 0.097, //40/441.43
          dividerColor: UtilColors.categoriesMenuListDivider,
          dividerOpacity: 0.3,
          leftPadding: w * 0.073, //30/441.43
          rightPadding: w * 0.073, //30/441.43
          bottomPadding: w * 0.03, //12/441.43
          leftChild: Expanded(
            child: GestureDetector(
              child: Container(
                child: Text(
                  categories,
                  style: TextStyle(
                    color: UtilColors.categoriesMenuListText,
                    fontSize: UtilString.fontSizeCategoriesMenuList,
                  ),
                ),
              ),
              onTap: onCategoryTap,
            ),
          ),
          rightChild: Container(
            width: 90,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  child: Image.asset(
                    UtilImages.editIcon,
                    scale: 3,
                    color: UtilColors.categoriesMenuEditIcon,
                  ),
                  onTap: onEditTap,
                ),
                SizedBox(
                  width: w * 0.073, //30/441.43
                ),
                GestureDetector(
                  child: Image.asset(
                    UtilImages.deleteIcon,
                    scale: 3,
                    color: UtilColors.categoriesMenuDeleteIcon,
                  ),
                  onTap: onDeleteTap,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: w * 0.04, //17/441.43
        ),
      ],
    );
  }
}
