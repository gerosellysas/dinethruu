import 'package:dinethruu/components/CustomButton.dart';
import 'package:dinethruu/controllers/menuController.dart';
import 'package:dinethruu/utils/utilColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/customTextField.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final MenuController menuController = Get.put(MenuController());

  @override
  Widget build(BuildContext context) {
    // double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    double topPaddingScreen = MediaQuery.of(context).padding.top;
    double headHeight = 60 + topPaddingScreen;
    return Scaffold(
        body: Column(
      children: [
        Container(
          height: headHeight,
          width: double.maxFinite,
          padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
          // color: Colors.pink,
          child: Column(
            children: [
              Expanded(
                child: Container(),
              ),
              Container(
                height: 60,
                width: double.maxFinite,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 50,
                      // color: Colors.red,

                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_outlined,
                          color: UtilColors.wdReqTitle,
                        ),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ),
                    Expanded(
                      child: CustomSearchTextField(
                        controller: menuController.searchTextController.value,
                        onChanged: (value) {
                          menuController.searchResultVisible.value = true;
                          menuController.filterSearch(value);
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    CustomButton(
                      width: 80,
                      height: 40,
                      radius: 7,
                      bgColor: UtilColors.orderMenuSearchButtonBg,
                      child: Text("Search"),
                      onTap: () {
                        Get.back(
                            result:
                                menuController.searchTextController.value.text);
                        // Get.back();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Expanded(
          child: Obx(
            () => menuController.searchResultVisible.value
                ? ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: menuController.searchResult.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: ListTile(
                          leading:
                              Text("${menuController.searchResult[index]}"),
                        ),
                        onTap: () {
                          menuController.searchTextController.value.text =
                              menuController.searchResult[index];
                        },
                      );
                    },
                  )
                : Container(),
          ),
        ),
      ],
    ));
  }
}
