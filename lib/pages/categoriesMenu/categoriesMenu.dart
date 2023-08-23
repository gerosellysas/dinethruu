import 'package:dinethruu/controllers/categoryController.dart';
import 'package:dinethruu/controllers/menuController.dart';
import 'package:dinethruu/models/category.dart';
import 'package:dinethruu/pages/addCategory/addCategory.dart';
import 'package:dinethruu/pages/addMenu/addMenu.dart';
import 'package:dinethruu/pages/menuItemsByCategory/menuItemsByCategory.dart';
import 'package:dinethruu/utils/utilColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'components/customBottomNav.dart';
import 'components/customListDisplay.dart';
import 'components/head.dart';

class CategoriesMenu extends StatefulWidget {
  const CategoriesMenu({
    Key key,
  }) : super(key: key);
  @override
  _CategoriesMenuState createState() => _CategoriesMenuState();
}

class _CategoriesMenuState extends State<CategoriesMenu> {
  final CategoryController categoryController = Get.put(CategoryController());
  final menuController = Get.put(MenuController());
  Category categories = Category();

  List<dynamic> arguments = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration(milliseconds: 200), () => categoryController.getCategory());
    print("init state");
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: UtilColors.bgWhite,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Head(),
          Container(
            height: w * 0.035, //14/441.43
          ),
          Expanded(
            child: Obx(
              () => categoryController.isGetDataComplete.value
                  ? ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: categoryController.listCategory.length,
                      itemBuilder: (context, index) {
                        return CustomListDisplay(
                          categories:
                              categoryController.listCategory[index].name,
                          onCategoryTap: () {
                            print("go to menuItems");
                            menuController.isModeSearchView.value = false;
                            Get.to(() => MenuItemsByCategory(),
                                arguments:
                                    categoryController.listCategory[index]);
                          },
                          onEditTap: () async {
                            var result = await Get.to(() => AddCategory(),
                                arguments:
                                    categoryController.listCategory[index]);
                            if (result == null) {
                              result = false;
                            }
                            if (result) {
                              Get.snackbar(
                                "SUCCESS",
                                "Category menu has been updated",
                                barBlur: 20,
                                isDismissible: true,
                                duration: Duration(seconds: 3),
                                snackPosition: SnackPosition.TOP,
                              );
                              await categoryController.getCategory();
                            }
                          },
                          onDeleteTap: () async {
                            await categoryController.deleteCategory(
                                categoryController.listCategory[index].id);
                            print("delete");
                          },
                        );
                      },
                    )
                  : SpinKitChasingDots(color: Colors.black38, size: h * 0.1),
            ),
          ),
          Container(
            height: w * 0.035, //14/441.43
          ),
          CustomBottomNav(
            addCategory: () async {
              var result = await Get.to(() => AddCategory());
              print("result $result");

              if (result == null) {
                result = false;
              }
              if (result) {
                Get.snackbar(
                  "SUCCESS",
                  "Category menu has been saved",
                  barBlur: 20,
                  isDismissible: true,
                  duration: Duration(seconds: 3),
                  snackPosition: SnackPosition.TOP,
                );
                await categoryController.getCategory();
              }
            },
            addMenuItem: () {
              menuController.getListCategoryName();
              Get.to(() => AddMenu());
            },
          ),
        ],
      ),
    );
  }
}
