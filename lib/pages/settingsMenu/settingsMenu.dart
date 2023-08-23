import 'package:dinethruu/controllers/loginController.dart';
import 'package:dinethruu/controllers/settingController.dart';
import 'package:dinethruu/utils/utilColors.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

import 'components/customCard.dart';
import 'components/header.dart';

class SettingsMenu extends StatefulWidget {
  @override
  _SettingsMenuState createState() => _SettingsMenuState();
}

class _SettingsMenuState extends State<SettingsMenu> {
  final LoginController loginController = Get.put(LoginController());
  final SettingController settingController = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: UtilColors.settingsMenuPageBg,
      body: Stack(
        children: [
          Column(
            children: [
              Header(),
              CustomCard(
                labelText: UtilString.settingsMenuAvailableLabel,
                child: Obx(
                  () => FlutterSwitch(
                    height: 25,
                    width: 45,
                    toggleSize: 25,
                    padding: 1,
                    toggleColor: UtilColors.bgWhite,
                    activeColor: UtilColors.settingsMenuToggleActiveButton,
                    inactiveColor: UtilColors.settingsMenuToggleInactiveButton,
                    value: settingController.isToggled.value,
                    onToggle: (val) async {
                      settingController.isToggled.value = val;
                      await settingController.statusShop();
                    },
                  ),
                ),
              ),
              SizedBox(height: 10),
              CustomCard(
                labelText: UtilString.settingMenuLogoutLabel,
                child: Container(
                  width: 45,
                  alignment: Alignment.centerRight,
                  color: UtilColors.settingsMenuCardBg,
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: UtilColors.settingsMenuText,
                  ),
                ),
                onTap: () async {
                  await settingController.signOut();
                },
              ),
            ],
          ),
          // loginController.isGetDataComplete.value ||
          Obx(
            () => settingController.isGetDataComplete.value
                ? Container()
                : SpinKitChasingDots(color: Colors.black38, size: h * 0.1),
          )
        ],
      ),
    );
  }
}
