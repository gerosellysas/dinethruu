import 'package:dinethruu/utils/utilColors.dart';
import 'package:dinethruu/utils/utilImages.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final double radius;
  final ImageProvider<Object> assetImage;
  final String title;
  final String leftPrice;
  final String rightPrice;
  final String desc;
  final BoxFit imageFit;
  final bool isSelected;
  final Function onLongPress;
  final Function onDeleteTap;
  final Function onEditTap;

  const ItemCard({
    Key key,
    this.radius = 5,
    this.assetImage,
    this.title = "",
    this.leftPrice = "",
    this.rightPrice = "",
    this.desc = "",
    this.imageFit = BoxFit.cover,
    this.isSelected = false,
    this.onLongPress,
    this.onDeleteTap,
    this.onEditTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    double hight = 110;
    return Stack(
      children: [
        Container(
          height: hight,
          width: double.maxFinite,
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            color: UtilColors.bgWhite,
            borderRadius: BorderRadius.circular(radius),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.17),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Material(
            child: InkWell(
              child: Row(
                children: [
                  Container(
                    height: hight,
                    width: hight,
                    decoration: BoxDecoration(
                      // color: UtilColors.bgWhite,
                      // color: Colors.red,
                      borderRadius: BorderRadius.circular(radius),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.17),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      // image: DecorationImage(
                      //   image: assetImage,
                      //   fit: BoxFit.cover,
                      // ),
                      image: DecorationImage(
                        image: assetImage,
                        fit: imageFit,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: w * 0.036,
                      ),
                      // color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              color: UtilColors.menuItemCardTitle,
                              fontSize: UtilString.fontSizeMenuItemCardTitle,
                              fontWeight: FontWeight.w400,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                leftPrice,
                                style: TextStyle(
                                  color: UtilColors.menuItemCardLeftPrice,
                                  fontSize:
                                      UtilString.fontSizeMenuItemCardPrice,
                                  fontWeight: FontWeight.w400,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                rightPrice,
                                style: TextStyle(
                                  color: UtilColors.menuItemCardRightPrice,
                                  fontSize:
                                      UtilString.fontSizeMenuItemCardPrice,
                                  fontWeight: FontWeight.w400,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          Text(
                            desc,
                            style: TextStyle(
                              color: UtilColors.menuItemCardDesc,
                              fontSize: UtilString.fontSizeMenuItemCardDesc,
                              fontWeight: FontWeight.w400,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              onLongPress: onLongPress,
              onTap: onEditTap,
            ),
            color: Colors.transparent,
          ),
        ),
        Positioned(
          right: 0,
          child: AnimatedContainer(
            width: isSelected ? 60 : 0,
            height: isSelected ? hight : hight,
            color:
                isSelected ? Colors.green.withOpacity(0.5) : Colors.transparent,
            // alignment:
            //     isSelected ? Alignment.center : AlignmentDirectional.topCenter,
            duration: const Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
            child: GestureDetector(
              child: Image.asset(
                UtilImages.deleteIcon,
                scale: 3,
                color: UtilColors.categoriesMenuDeleteIcon,
              ),
              onTap: onDeleteTap,
            ),
          ),
        ),
      ],
    );
  }
}
