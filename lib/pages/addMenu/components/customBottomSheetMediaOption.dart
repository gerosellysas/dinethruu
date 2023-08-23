
import 'package:flutter/material.dart';

import '../../../utils/utilColors.dart';
import '../../../utils/utilString.dart';

class CustomBottomSheetMediaOption extends StatelessWidget {
  final Function onCameraTap;
  final Function onGalleryTap;

  const CustomBottomSheetMediaOption({
    Key key,
    this.onCameraTap,
    this.onGalleryTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onCameraTap,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 22),
              height: 70,
              width: double.maxFinite,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: UtilColors.botSheetAddMenuButtonBg,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.camera_alt,
                    color: UtilColors.botSheetAddMenuIcon,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    UtilString.botSheetAddMenuCamera,
                    style: TextStyle(
                      color: UtilColors.botSheetAddMenuText,
                      fontSize: UtilString.fontSizeBotSheetAddMenuText,
                      fontFamily: "SF_Pro_Text",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onGalleryTap,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 22),
              height: 70,
              width: double.maxFinite,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: UtilColors.botSheetAddMenuButtonBg,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.collections,
                    color: UtilColors.botSheetAddMenuText,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    UtilString.botSheetAddMenuGallery,
                    style: TextStyle(
                      color: UtilColors.botSheetAddMenuText,
                      fontSize: UtilString.fontSizeBotSheetAddMenuText,
                      fontFamily: "SF_Pro_Text",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
