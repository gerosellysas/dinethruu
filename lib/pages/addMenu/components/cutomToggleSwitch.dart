
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../utils/utilColors.dart';
import '../../../utils/utilString.dart';

class CustomToggleSwitch extends StatelessWidget {
  final String labelText;
  final bool toggleValue;
  final ValueChanged<bool> onToggle;

  const CustomToggleSwitch({
    Key key,
    this.labelText = "",
    this.toggleValue = true,
    @required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
        left: w * 0.017,
        right: w * 0.017,
        bottom: w * 0.038,
        // 7, 7, 17/441.43
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              labelText,
              style: TextStyle(
                color: UtilColors.addMenuLabelText,
                fontSize: UtilString.fontSizeAddMenuLabel,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          FlutterSwitch(
            height: w * 0.06, //25/441.43
            width: w * 0.1, //45/441.43
            toggleSize: w * 0.06, //25/441.43
            padding: 1,
            toggleColor: UtilColors.bgWhite,
            activeColor: UtilColors.addMenuToggleActiveButton,
            inactiveColor: UtilColors.addMenuToggleInactiveButton,
            value: toggleValue,
            onToggle: onToggle,
          ),
        ],
      ),
    );
  }
}

class ToggleSwitchDisplay extends StatelessWidget {
  final bool vegetarianToggleValue;
  final bool availableToggleValue;
  final ValueChanged<bool> vegetarianToggle;
  final ValueChanged<bool> availableToggle;

  const ToggleSwitchDisplay({
    Key key,
    this.vegetarianToggleValue = true,
    this.availableToggleValue = false,
    this.vegetarianToggle,
    this.availableToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomToggleSwitch(
            labelText: UtilString.addMenuVegetarianLabel,
            toggleValue: vegetarianToggleValue,
            onToggle: vegetarianToggle),
        CustomToggleSwitch(
            labelText: UtilString.addMenuAvailableLabel,
            toggleValue: availableToggleValue,
            onToggle: availableToggle),
      ],
    );
  }
}
