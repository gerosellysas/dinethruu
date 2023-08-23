import 'package:dinethruu/components/CustomButton.dart';
import 'package:dinethruu/controllers/orderController.dart';
import 'package:dinethruu/pages/orderMenu/components/customTextField.dart';
import 'package:dinethruu/utils/utilColors.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final OrderController orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    double topPaddingScreen = MediaQuery.of(context).padding.top;
    double headHeight = 60 + topPaddingScreen;
    return Scaffold(
      backgroundColor: UtilColors.bgWhite,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
            height: headHeight,
            width: double.maxFinite,
            color: UtilColors.bgWhite,
            child: Column(
              children: [
                Expanded(
                  child: Container(),
                ),
                Container(
                  height: 60,
                  width: double.maxFinite,
                  color: UtilColors.bgWhite,
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        color: UtilColors.bgWhite,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios_outlined,
                            color: UtilColors.orderMenuSearchTitle,
                          ),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                      ),
                      Expanded(
                        child: CustomTextField(
                          controller:
                              orderController.searchTextController.value,
                          onChanged: (value) {
                            orderController.searchResultVisible.value = true;
                            orderController.filterSearch(
                                value, orderController.orderMenuIndex.value);
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      CustomButton(
                        width: 80,
                        height: 40,
                        radius: 5,
                        bgColor: UtilColors.orderMenuSearchButtonBg,
                        child: Text(
                          UtilString.orderMenuSearchButton,
                          style: TextStyle(
                            color: UtilColors.orderMenuSearchButtonText,
                            fontSize: UtilString.fontSizeOrderMenuSearchButton,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        onTap: () {
                          Get.back(
                              result: orderController
                                  .searchTextController.value.text);
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
              () => orderController.searchResultVisible.value
                  ? ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: orderController.searchResult.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: ListTile(
                            leading: Text(
                              "${orderController.searchResult[index]}",
                              style: TextStyle(
                                  color: UtilColors.orderMenuSearchResult,
                                  fontSize:
                                      UtilString.fontSizeOrderMenuSearchResult,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          onTap: () {
                            orderController.searchTextController.value.text =
                                orderController.searchResult[index];
                          },
                        );
                      },
                    )
                  : Container(),
            ),
          ),
        ],
      ),
    );
  }
}
