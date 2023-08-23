import 'package:dinethruu/controllers/categoryController.dart';
import 'package:dinethruu/controllers/imagePickerController.dart';
import 'package:dinethruu/controllers/menuController.dart';
import 'package:dinethruu/pages/addMenu/components/customDropDownField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../../utils/utilString.dart';
import 'customBottomNav.dart';
import 'customTextField.dart';
import 'cutomToggleSwitch.dart';
import 'imageDispayEdit.dart';
import 'imageDisplay.dart';

class Body extends StatefulWidget {
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final menuController = Get.put(MenuController());
  final imagePickerController = Get.put(ImagePickerCtrl());
  String category;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Obx(
      () => menuController.isGetDataComplete.value
          ? SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  left: w * 0.049,
                  top: w * 0.025,
                  right: w * 0.049,
                  // 20, 10, 20, 20/441.43
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(
                      () => imagePickerController.isOldImage.value
                          ? ImageDisplayEdit(
                              onTap: () async {
                                print("edit image");
                                imagePickerController.compressImgPath.value =
                                    "";
                                await imagePickerController.getPermission();
                              },
                              image: (menuController.oldImageNetwork.value ==
                                          "" ||
                                      menuController.oldImageNetwork.value ==
                                          null)
                                  ? ""
                                  : menuController.oldImageNetwork.value,
                            )
                          : ImageDisplay(
                              onTap: () async {
                                print("new image");
                                await imagePickerController.getPermission();
                              },
                              image:
                                  imagePickerController.compressImgPath.value,
                            ),
                    ),
                    Obx(
                      () => CustomTextField(
                        labelText: UtilString.addMenuNameLabel,
                        hintText: UtilString.addMenuNameHint,
                        controller: menuController.menuTextController.value,
                      ),
                    ),
                    Obx(
                      () => CustomDropDownField(
                        labelText: UtilString.addMenuCategoryLabel,
                        hintText: UtilString.addMenuCategoryHint,
                        items: menuController.listCategoryName,
                        onChanged: (value) {
                          menuController.dropDownvalue.value = value;
                          // print(category);
                        },
                        dropDownValue: menuController.dropDownvalue.value,
                      ),
                    ),
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: CustomTextField(
                              labelText: UtilString.addMenuPriceLabel,
                              hintText: UtilString.addMenuPriceHint,
                              controller: menuController.priceController.value,
                              keyboardType: TextInputType.phone,
                            ),
                          ),
                          SizedBox(width: w * 0.073
                              // 30/441.43
                              ),
                          Expanded(
                            child: CustomTextField(
                              labelText: UtilString.addMenuSalePriceLabel,
                              hintText: UtilString.addMenuSalePriceHint,
                              controller:
                                  menuController.salePriceController.value,
                              keyboardType: TextInputType.phone,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Obx(
                      () => ToggleSwitchDisplay(
                          vegetarianToggleValue: menuController.isVegan.value,
                          vegetarianToggle: (val) {
                            menuController.isVegan.value =
                                !menuController.isVegan.value;
                          },
                          availableToggleValue:
                              menuController.isAvailable.value,
                          availableToggle: (val) {
                            menuController.isAvailable.value =
                                !menuController.isAvailable.value;
                          }),
                    ),
                    Obx(
                      () => CustomTextField(
                        height: w * 0.22, //90/441.43
                        labelText: UtilString.addMenuDescriptionLabel,
                        hintText: UtilString.addMenuDescriptionHint,
                        containerBottomMargin: w * 0.012, //5/441.43
                        maxLines: 3,
                        controller:
                            menuController.descriptionTextController.value,
                      ),
                    ),
                    CustomBottomNav(
                      onSaveTap: () {
                        if (menuController.isEditMenu.value) {
                          print("update data di server");
                          menuController.updateMenu();
                        } else {
                          print("new data di server");
                          menuController.createMenu();
                        }
                      },
                      onCancelTap: () {
                        Get.back();
                      },
                    ),
                  ],
                ),
              ),
            )
          : SpinKitChasingDots(color: Colors.black38, size: h * 0.1),
    );
  }
}
