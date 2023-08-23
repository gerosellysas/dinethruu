import 'package:auto_size_text/auto_size_text.dart';
import 'package:dinethruu/utils/utilColors.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';

class HeaderCardInformation extends StatelessWidget {
  final double height;
  final String title;
  final String detail;
  final Color detailColor;

  const HeaderCardInformation({
    Key key,
    this.height = 55,
    this.title = "",
    this.detail = "",
    this.detailColor = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = Colors.grey;
    (detailColor == color)
        ? color = UtilColors.summaryHeaderText
        : color = detailColor;
    return Container(
      height: height,
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$title",
            style: TextStyle(
                color: UtilColors.summaryHeaderText,
                fontSize: UtilString.fontSizeSummaryHeaderValueTitle,
                fontWeight: FontWeight.w400),
          ),
          AutoSizeText(
            "$detail",
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
            presetFontSizes: [
              UtilString.fontSizeSummaryHeaderValueDetail,
              24,
              23,
              22,
            ],
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
