import 'package:dinethruu/controllers/imagePickerController.dart';
import 'package:dinethruu/controllers/menuController.dart';
import 'package:dinethruu/models/foodsCategory.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/utilColors.dart';
import '../../utils/utilString.dart';
import 'components/body.dart';

final menuController = Get.put(MenuController());

class AddMenu extends StatefulWidget {
  @override
  _AddMenuState createState() => _AddMenuState();
}

class _AddMenuState extends State<AddMenu> {
  final ImagePickerCtrl imageController = Get.put(ImagePickerCtrl());
  @override
  void initState() {
    super.initState();
    imageController.imageBase64.value = "";
    print("imageBase64 ${imageController.imageBase64.value}");
    if (!menuController.isEditMenu.value) {
      print("clear data");
      menuController.dataMenuClear();
      imageController.isOldImage.value = false;
      setState(() {
        print(" dropDownvalue.value ${menuController.dropDownvalue.value}");
      });
    } else {
      imageController.isOldImage.value = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _scaffoldKey,
      // resizeToAvoidBottomInset: false,
      backgroundColor: UtilColors.bgWhite,
      appBar: appBar(context),
      body: Body(),
    );
  }
}

Widget appBar(BuildContext context) {
  return AppBar(
    title: Text(
      menuController.isEditMenu.value ? "Edit Menu" : UtilString.addMenuTitle,
      style: TextStyle(
        color: UtilColors.addMenuTitle,
        fontSize: UtilString.fontSizeAddMenuTitle,
        fontWeight: FontWeight.bold,
      ),
    ),
    backgroundColor: UtilColors.addMenuAppBarBg,
    elevation: 0,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back_ios_outlined,
        color: UtilColors.addMenuTitle,
      ),
      onPressed: () {
        Get.back();
      },
    ),
  );
}
