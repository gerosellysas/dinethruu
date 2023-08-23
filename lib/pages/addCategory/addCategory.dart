import 'package:dinethruu/controllers/categoryController.dart';
import 'package:dinethruu/models/category.dart';
import 'package:dinethruu/utils/utilColors.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import 'components/customBottomNav.dart';
import 'components/customTextField.dart';

class AddCategory extends StatefulWidget {
  @override
  _AddCategoryState createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  final CategoryController categoryController = Get.find();
  Category getCategory = Category();
  bool isCategoryNew = true;

  @override
  void initState() {
    if (Get.arguments != null) {
      isCategoryNew = false;
      getCategory = Get.arguments;
      categoryController.categoryTextController.value.text = getCategory.name;
    } else {
      categoryController.categoryTextController.value.text = "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: UtilColors.bgWhite,
      appBar: appBar(context, isCategoryNew),
      body: Padding(
        padding: EdgeInsets.only(
          left: w * 0.049,
          top: w * 0.073,
          right: w * 0.049,
          // 20, 30, 20, 20,/441.43
        ),
        child: Obx(
          () => Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomAddCategoryTextField(
                    controller: categoryController.categoryTextController.value,
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  CustomBottomNav(
                    buttonText: isCategoryNew
                        ? UtilString.addCategorySaveButton
                        : UtilString.addCategoryEditButton,
                    onSaveOrEditTap: () async {
                      if (isCategoryNew) {
                        await categoryController.createCategory();
                      } else {
                        await categoryController.updateCategory(getCategory.id);
                      }                                           
                    },
                    onCancelTap: () {
                      Get.back();
                    },
                  ),
                ],
              ),
              categoryController.isGetDataComplete.value
                  ? Container()
                  : SpinKitChasingDots(color: Colors.black38, size: h * 0.1),
            ],
          ),
        ),
      ),
    );
  }
}

Widget appBar(BuildContext context, bool isCategoryNew) {
  bool newCategory = isCategoryNew;
  return AppBar(
    title: Text(
      newCategory == true
          ? UtilString.addCategoryTitle
          : UtilString.addCategoryEditTitle,
      style: TextStyle(
        color: UtilColors.addCategoryTitle,
        fontSize: UtilString.fontSizeAddCategoryTitle,
        fontWeight: FontWeight.bold,
      ),
    ),
    backgroundColor: UtilColors.addCategoryAppBarBg,
    elevation: 0,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back_ios_outlined,
        color: UtilColors.addCategoryTitle,
      ),
      onPressed: () {
        Get.back();
      },
    ),
  );
}
