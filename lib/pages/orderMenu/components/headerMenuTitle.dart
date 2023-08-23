import 'package:auto_size_text/auto_size_text.dart';
import 'package:dinethruu/utils/utilColors.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';

class HeaderMenuTitle extends StatefulWidget {
  final String title;
  final Function onTap;
  final bool isTitleTap;

  const HeaderMenuTitle({
    Key key,
    this.title = "",
    this.onTap,
    this.isTitleTap = false,
  }) : super(key: key);
  @override
  _HeaderMenuTitleState createState() => _HeaderMenuTitleState();
}

class _HeaderMenuTitleState extends State<HeaderMenuTitle> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    print("w => $w");
    return GestureDetector(
      child: Container(
          width: 130,
          // color: UtilColors.bgWhite,

          child: Column(
            children: [
              Text(
                "${widget.title}",
                style: TextStyle(
                    color: UtilColors.homeOrderMenuHeaderMenu,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Expanded(child: Container()),
              Container(
                width: w / 3,
                color: UtilColors.bgWhite,
                alignment: widget.isTitleTap
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 150),
                  height: widget.isTitleTap ? 3 : 3,
                  width: widget.isTitleTap ? w / 3 : 0,
                  decoration: BoxDecoration(
                    color: widget.isTitleTap
                        ? UtilColors.homeOrderMenuHeaderBar
                        : Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                ),
              ),
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: UtilColors.bgWhite,
                  border: Border(
                    bottom:
                        BorderSide(width: 1, color: UtilColors.homeLineBorder),
                  ),
                ),
              ),
            ],
          )),
      onTap: widget.onTap,
    );
  }
}
