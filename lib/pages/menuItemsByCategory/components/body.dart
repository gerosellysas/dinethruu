import 'package:dinethruu/controllers/categoryController.dart';
import 'package:dinethruu/controllers/imagePickerController.dart';
import 'package:dinethruu/controllers/menuController.dart';
import 'package:dinethruu/models/category.dart';
import 'package:dinethruu/pages/addMenu/addMenu.dart';
import 'package:dinethruu/utils/utilColors.dart';
import 'package:dinethruu/utils/utilImages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import 'itemCard.dart';

class Body extends StatefulWidget {
  final Category category;

  const Body({
    Key key,
    this.category,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final CategoryController categoryController = Get.put(CategoryController());
  final MenuController menuController = Get.put(MenuController());
  final ImagePickerCtrl imageController = Get.put(ImagePickerCtrl());

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      padding: EdgeInsets.all(w * 0.036),
      color: UtilColors.bgWhite,
      child: Obx(
        () => categoryController.isGetDataComplete.value
            ? menuController.isModeSearchView.value
                ? ItemCard(
                    // assetImage: AssetImage("assets/images/menuItem.png"),
                    assetImage: menuController.foodMenuSearch.value.imageUrl ==
                                null ||
                            menuController.foodMenuSearch.value.imageUrl == ""
                        ? AssetImage(UtilImages.loginTitleIcon)
                        : NetworkImage(
                            menuController.foodMenuSearch.value.imageUrl),
                    imageFit: menuController.foodMenuSearch.value.imageUrl ==
                                null ||
                            menuController.foodMenuSearch.value.imageUrl == ""
                        ? BoxFit.fitHeight
                        : BoxFit.cover,
                    radius: 5,
                    title: menuController.foodMenuSearch.value.name,
                    leftPrice:
                        menuController.foodMenuSearch.value.price.toString(),
                    rightPrice:
                        menuController.foodMenuSearch.value.salePrice == null
                            ? ""
                            : menuController.foodMenuSearch.value.salePrice
                                .toString(),
                    desc:
                        menuController.foodMenuSearch.value.description == null
                            ? ""
                            : menuController.foodMenuSearch.value.description,
                    isSelected: categoryController.isSelected.value,
                    onLongPress: () {
                      setState(() {
                        categoryController.isSelected.value =
                            !categoryController.isSelected.value;
                      });
                    },
                    onEditTap: () async {
                      print("gas podsada edit");
                      await menuController.dataMenuClear();
                      await menuController.getListCategoryName();
                      print(
                          "dropdown => ${menuController.dropDownvalue.value}");
                      menuController.foodCategoryEdit.value =
                          menuController.foodMenuSearch.value;
                      await menuController
                          .foodMenuEdit(categoryController.categoryName.value);
                      print("sebelum pindah");
                      print(
                          "foodCategoryEdit12 ${menuController.foodCategoryEdit.value.toMap()}");
                      menuController.isEditMenu.value = true;
                      menuController.isNeedReload.value = true;
                      print(
                          "description ${menuController.descriptionTextController.value.text}");
                      var result = await Get.to(() => AddMenu(),
                          arguments: menuController.isEditMenu.value);
                      print("result $result");
                      if (result == "reload") {
                        await categoryController
                            .listFoodOfCategory(widget.category.id);
                        print(
                            "telah reload data category ${widget.category.id}");
                        menuController.isModeSearchView.value = false;
                      }
                      menuController.isEditMenu.value = false;
                      menuController.isNeedReload.value = false;
                      imageController.isOldImage.value = false;
                      print("isEditMenu ${menuController.isEditMenu.value}");
                    },
                    onDeleteTap: () async {
                      print("didelete 123");
                      print("id ${menuController.foodMenuSearch.value.id}");
                      await menuController.deleteMenu(
                          menuController.foodMenuSearch.value.id,
                          widget.category.id);
                      menuController.isModeSearchView.value = false;
                      setState(() {
                        categoryController.isSelected.value =
                            !categoryController.isSelected.value;
                      });
                    },
                  )
                : ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: categoryController.listFoodCategory.length,
                    itemBuilder: (context, index) {
                      return ItemCard(
                        // assetImage: AssetImage("assets/images/menuItem.png"),
                        assetImage: (categoryController
                                        .listFoodCategory[index].imageUrl ==
                                    null ||
                                categoryController
                                        .listFoodCategory[index].imageUrl ==
                                    "")
                            ? AssetImage(UtilImages.loginTitleIcon)
                            : NetworkImage(categoryController
                                .listFoodCategory[index].imageUrl),
                        imageFit: (categoryController
                                        .listFoodCategory[index].imageUrl ==
                                    null ||
                                categoryController
                                        .listFoodCategory[index].imageUrl ==
                                    "")
                            ? BoxFit.fitHeight
                            : BoxFit.cover,
                        radius: 5,
                        title: categoryController.listFoodCategory[index].name,
                        leftPrice: categoryController
                            .listFoodCategory[index].price
                            .toString(),
                        rightPrice: categoryController
                                    .listFoodCategory[index].salePrice ==
                                null
                            ? ""
                            : categoryController
                                .listFoodCategory[index].salePrice
                                .toString(),
                        desc: categoryController
                                    .listFoodCategory[index].description ==
                                null
                            ? ""
                            : categoryController
                                .listFoodCategory[index].description,
                        isSelected: categoryController.isSelected.value,
                        onLongPress: () {
                          setState(() {
                            categoryController.isSelected.value =
                                !categoryController.isSelected.value;
                          });
                        },
                        onEditTap: () async {
                          print("edit");
                          await menuController.dataMenuClear();
                          print(
                              "description 1 ${menuController.descriptionTextController.value.text}");
                          await menuController.getListCategoryName();
                          print(
                              "dropdown => ${menuController.dropDownvalue.value}");
                          menuController.foodCategoryEdit.value =
                              categoryController.listFoodCategory[index];
                          await menuController.foodMenuEdit(
                              categoryController.categoryName.value);
                          print("sebelum pindah");
                          print(
                              "foodCategoryEdit ${menuController.foodCategoryEdit.value.toMap()}");
                          menuController.isEditMenu.value = true;
                          menuController.isNeedReload.value = true;
                          print(
                              "description 2 ${menuController.descriptionTextController.value.text}");
                          var result = await Get.to(() => AddMenu(),
                              arguments: menuController.isEditMenu.value);
                          print("result $result");
                          if (result == "reload") {
                            await categoryController
                                .listFoodOfCategory(widget.category.id);
                            print(
                                "telah reload data category ${widget.category.id}");
                          }
                          menuController.isEditMenu.value = false;
                          menuController.isNeedReload.value = false;
                          imageController.isOldImage.value = false;
                          print(
                              "isEditMenu ${menuController.isEditMenu.value}");
                        },
                        onDeleteTap: () async {
                          print("didelete");
                          print(
                              "id ${categoryController.listFoodCategory[index].id}");
                          await menuController.deleteMenu(
                              categoryController.listFoodCategory[index].id,
                              widget.category.id);
                        },
                      );
                    },
                  )
            : SpinKitChasingDots(color: Colors.black38, size: h * 0.1),
      ),
    );
  }
}
