import 'package:dinethruu/pages/categoriesMenu/categoriesMenu.dart';
import 'package:dinethruu/pages/orderMenu/orderMenu.dart';
import 'package:dinethruu/pages/settingsMenu/settingsMenu.dart';
import 'package:dinethruu/pages/summaryMenu/sumarryMenu.dart';
import 'package:dinethruu/utils/utilColors.dart';
import 'package:dinethruu/utils/utilImages.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'components/menuIcon.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<bool> isBottomIconTap = [false, false, false, false];

  @override
  void initState() {
    super.initState();
    _onItemTapped(0);
  }

  void _onItemTapped(int index) {
    setState(() {
      isBottomIconTap = [false, false, false, false];
      isBottomIconTap[index] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UtilColors.bgWhite,
      body: AnimatedSwitcher(
        child: isBottomIconTap[0]
            ? OrderMenu()
            : isBottomIconTap[1]
                ? SummaryMenu()
                : isBottomIconTap[2]
                    ? CategoriesMenu()
                    : isBottomIconTap[3]
                        ? SettingsMenu()
                        : Container(),
        duration: Duration(milliseconds: 800),
      ),
      bottomNavigationBar: customButtonNav(),
    );
  }

  Widget customButtonNav() {
    double btnNavHeight = 70;
    return Container(
      width: double.maxFinite,
      height: btnNavHeight,
      decoration: BoxDecoration(
        color: UtilColors.homeMenuBg,
        border: Border(
          top: BorderSide(width: 1, color: UtilColors.homeLineBorder),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: MenuIcon(
              height: btnNavHeight,
              icon: SvgPicture.asset(
                UtilImages.homeMenuOrder,
                color: isBottomIconTap[0]
                    ? UtilColors.homeActiveIconMenu
                    : UtilColors.homeInactiveIconMenu,
              ),
              label: UtilString.homeMenuOrder,
              labelColor: isBottomIconTap[0]
                  ? UtilColors.homeActiveIconMenu
                  : UtilColors.homeInactiveIconMenu,
              onPressed: () {
                _onItemTapped(0);
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: MenuIcon(
              height: btnNavHeight,
              icon: SvgPicture.asset(
                UtilImages.homeMenuSummary,
                color: isBottomIconTap[1]
                    ? UtilColors.homeActiveIconMenu
                    : UtilColors.homeInactiveIconMenu,
              ),
              label: UtilString.homeMenuSummary,
              labelColor: isBottomIconTap[1]
                  ? UtilColors.homeActiveIconMenu
                  : UtilColors.homeInactiveIconMenu,
              onPressed: () {
                _onItemTapped(1);
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: MenuIcon(
              height: btnNavHeight,
              icon: SvgPicture.asset(
                UtilImages.homeMenuMenu,
                color: isBottomIconTap[2]
                    ? UtilColors.homeActiveIconMenu
                    : UtilColors.homeInactiveIconMenu,
              ),
              label: UtilString.homeMenuMenu,
              labelColor: isBottomIconTap[2]
                  ? UtilColors.homeActiveIconMenu
                  : UtilColors.homeInactiveIconMenu,
              onPressed: () {
                _onItemTapped(2);
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: MenuIcon(
              height: btnNavHeight,
              icon: SvgPicture.asset(
                UtilImages.homeMenuSetting,
                color: isBottomIconTap[3]
                    ? UtilColors.homeActiveIconMenu
                    : UtilColors.homeInactiveIconMenu,
              ),
              label: UtilString.homeMenuSetting,
              labelColor: isBottomIconTap[3]
                  ? UtilColors.homeActiveIconMenu
                  : UtilColors.homeInactiveIconMenu,
              onPressed: () {
                _onItemTapped(3);
              },
            ),
          ),
        ],
      ),
    );
  }
}
