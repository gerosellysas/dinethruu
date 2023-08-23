
import 'package:flutter/material.dart';

import '../../../utils/utilColors.dart';
import '../../../utils/utilString.dart';

class CustomBottomSheetAppSetting extends StatelessWidget {
  final String title;
  final onSettingTap;
  final onDenyTap;

  const CustomBottomSheetAppSetting({
    Key key,
    this.title = "",
    this.onSettingTap,
    this.onDenyTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      height: 150,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 22),
            height: 70,
            width: double.maxFinite,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: UtilColors.botSheetAddMenuBg,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(
                  color: UtilColors.botSheetAddMenuText,
                  fontSize: UtilString.fontSizeBotSheetAddMenuTitle,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 22, top: 5),
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: onDenyTap,
                    child: Container(
                      height: w * 0.09, //40/441.43
                      width: w * 0.45, //185/441.43
                      decoration: BoxDecoration(
                        color: UtilColors.botSheetAddMenuButtonBg,
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                        border: Border.all(
                          width: 2,
                          color: UtilColors.botSheetAddMenuButtonBorder,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          UtilString.botSheetAddMenuDeny,
                          style: TextStyle(
                            color: UtilColors.botSheetAddMenuText,
                            fontSize:
                                UtilString.fontSizeBotSheetAddMenuButtonText,
                            fontFamily: "SF_Pro_Text",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: w * 0.025,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(right: 22, top: 5),
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: onSettingTap,
                    child: Container(
                      height: w * 0.09, //40/441.43
                      width: w * 0.45, //185/441.43
                      decoration: BoxDecoration(
                        color: UtilColors.botSheetAddMenuButtonBg,
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                        border: Border.all(
                          width: 2,
                          color: UtilColors.botSheetAddMenuButtonBorder,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          UtilString.botSheetAddMenuSetting,
                          style: TextStyle(
                            color: UtilColors.botSheetAddMenuText,
                            fontSize:
                                UtilString.fontSizeBotSheetAddMenuButtonText,
                            fontFamily: "SF_Pro_Text",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}