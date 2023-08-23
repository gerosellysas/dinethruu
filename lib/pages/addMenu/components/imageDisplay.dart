import 'dart:io';

import 'package:flutter/material.dart';

import '../../../utils/utilColors.dart';
import '../../../utils/utilImages.dart';

class ImageDisplay extends StatelessWidget {
  final Function onTap;
  final String image;

  const ImageDisplay({
    Key key,
    this.onTap,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
        bottom: w * 0.03, //12/441.43
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: GestureDetector(
          onTap: onTap,
          child: Stack(
            children: [
              Container(
                height: w * 0.45, //180/441.43
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: UtilColors.addMenuImgBg,
                  borderRadius: BorderRadius.circular(10),
                  border: Border(
                    left: BorderSide.none,
                    top: BorderSide.none,
                    right: BorderSide.none,
                    bottom: BorderSide.none,
                  ),
                ),
              ),
              Center(
                child: Container(
                  // color: Colors.green,
                  height: w * 0.45,
                  width: w * 0.45,
                  child: image == ""
                      ? Image.asset(
                          UtilImages.noImage,
                          color: UtilColors.addMenuNoImgIcon,
                          scale: 3,
                        )
                      : Image.file(
                          File(image),
                          fit: BoxFit.fill,
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
