import 'package:dinethruu/controllers/categoryController.dart';
import 'package:dinethruu/controllers/menuController.dart';
import 'package:dinethruu/models/category.dart';
import 'package:dinethruu/pages/addMenu/addMenu.dart';
import 'package:dinethruu/pages/menuItemsByCategory/search.dart';
import 'package:dinethruu/utils/utilColors.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/body.dart';
import 'components/customBottomNav.dart';

class MenuItemsByCategory extends StatefulWidget {
  const MenuItemsByCategory({
    Key key,
  }) : super(key: key);
  @override
  _MenuItemsByCategoryState createState() => _MenuItemsByCategoryState();
}

class _MenuItemsByCategoryState extends State<MenuItemsByCategory> {
  final CategoryController categoryController = Get.put(CategoryController());
  final MenuController menuController = Get.put(MenuController());
  Category category = Category();

  @override
  void initState() {
    super.initState();
    category = Get.arguments;
    print("id ${category.id}");
    categoryController.listFoodCategory.clear();
    categoryController.isSelected.value = false;
    categoryController.categoryName.value = category.name;
    Future.delayed(Duration(milliseconds: 200),
        () => categoryController.listFoodOfCategory(category.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: UtilColors.menuItemAppBarbgColor,
        elevation: 0,
        title: Text(
          category.name,
          style: TextStyle(
            fontSize: UtilString.fontSizeMenuItemAppBarTitle,
            fontWeight: FontWeight.bold,
            color: UtilColors.menuItemAppBarTitle,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined),
          color: UtilColors.menuItemAppBarTitle,
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          Obx(
            () => categoryController.isSelected.value
                ? IconButton(
                    icon: Icon(Icons.cancel_outlined),
                    onPressed: () {
                      categoryController.isSelected.value = false;
                      setState(() {});
                    },
                  )
                : IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () async {
                      print("press search");
                      menuController.searchResultVisible.value = false;
                      menuController.searchTextController.value.text = "";
                      var result = await Get.to(() => Search());
                      print("result $result");
                      if (result != null) {
                        await menuController.foodMenuSearchFilter(result);
                        setState(() {});
                      }
                    },
                  ),
          ),
        ],
      ),
      body: Body(
        category: category,
      ),
      bottomNavigationBar: CustomButtomNav(
        onAddMenuItemTap: () async {
          await menuController.getListCategoryName();
          menuController.isNeedReload.value = true;
          var result = await Get.to(() => AddMenu());
          print("result ==== $result");
          if (result == "reload") {
            await categoryController.listFoodOfCategory(category.id);
            print("telah reload data");
          }

          menuController.isNeedReload.value = false;
        },
      ),
    );
  }
}
