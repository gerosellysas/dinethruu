import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';

class MenuIcon extends StatelessWidget {
  final Widget icon;
  final Function onPressed;
  final double height;
  final String label;
  final Color labelColor;

  const MenuIcon({
    Key key,
    this.icon,
    this.onPressed,
    this.height = 50,
    this.label = "",
    this.labelColor = Colors.green,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: height,
        width: double.maxFinite,
        child: Column(
          children: [
            Container(
              height: height * 0.7,
              width: double.maxFinite,
              alignment: Alignment.center,
              child: IconButton(
                icon: icon,
                onPressed: onPressed,
              ),
            ),
            Expanded(
                child: Container(
              height: double.maxFinite,
              width: double.maxFinite,
              alignment: Alignment.topCenter,
              child: Text(
                "$label",
                style: TextStyle(
                    color: labelColor,
                    fontSize: UtilString.fontSizeHomeMenuLabelIcon,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            )),
          ],
        ),
      ),
      onTap: onPressed,
    );
  }
}
