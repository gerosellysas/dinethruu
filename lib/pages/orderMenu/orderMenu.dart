import 'package:dinethruu/controllers/orderController.dart';
import 'package:dinethruu/utils/utilColors.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/header.dart';
import 'components/headerMenuTitle.dart';
import 'subMenu/canceled.dart';
import 'subMenu/completed.dart';
import 'subMenu/newOrder.dart';
import 'subMenu/onPreparation.dart';
import 'subMenu/search.dart';

class OrderMenu extends StatefulWidget {
  const OrderMenu({
    Key key,
  }) : super(key: key);

  @override
  _OrderMenuState createState() => _OrderMenuState();
}

class _OrderMenuState extends State<OrderMenu> {
  final OrderController orderController = Get.put(OrderController());
  final PageController _pageController = PageController(initialPage: 0);
  List<bool> isTitleTap = [false, false, false, false];

  @override
  void initState() {
    super.initState();
    isTitleTap[0] = true;
    print("get data shop orders");
    orderController.isGetDataComplete.value = false;
    Future.delayed(
        Duration(milliseconds: 1000), () => orderController.getShopOrders());
  }

  _onTap(int index) {
    setState(() {
      orderController.isModeSearchView.value = false;
      isTitleTap = [false, false, false, false];
      isTitleTap[index] = true;
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 300), curve: Curves.easeOut);
      orderController.orderMenuIndex.value = index;

      if (index == 0) {
        orderController.orderSubMenuTitle.value = "Order";
      } else if (index == 1) {
        orderController.orderSubMenuTitle.value = "OnPreparation";
      } else if (index == 2) {
        orderController.orderSubMenuTitle.value = "Completed";
      } else {
        orderController.orderSubMenuTitle.value = "Canceled";
      }
      print("# index subMenu ${index}");
      print("# orderSubMenuTitle ${orderController.orderSubMenuTitle.value}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      color: UtilColors.bgWhite,
      child: Column(
        children: [
          Header(
            onSearchPressed: () async {
              orderController.searchResultVisible.value = false;
              orderController.searchTextController.value.text = "";
              var result = await Get.to(() => Search());
              print("result $result");
              if (result != null && orderController.orderMenuIndex.value == 0) {
                await orderController.newOrderSearchFilter(result);
                setState(() {});
              } else if (result != null &&
                  orderController.orderMenuIndex.value == 1) {
                await orderController.onPreparationSearchFilter(result);
                setState(() {});
              } else if (result != null &&
                  orderController.orderMenuIndex.value == 2) {
                await orderController.completedSearchFilter(result);
                setState(() {});
              }
            },
          ),
          Container(
            height: 35,
            width: double.maxFinite,
            color: UtilColors.bgWhite,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  HeaderMenuTitle(
                    title: UtilString.homeOrderMenuHeaderMenu_1,
                    isTitleTap: isTitleTap[0],
                    onTap: () {
                      _onTap(0);
                    },
                  ),
                  HeaderMenuTitle(
                    title: UtilString.homeOrderMenuHeaderMenu_2,
                    isTitleTap: isTitleTap[1],
                    onTap: () {
                      _onTap(1);
                    },
                  ),
                  HeaderMenuTitle(
                    title: UtilString.homeOrderMenuHeaderMenu_3,
                    isTitleTap: isTitleTap[2],
                    onTap: () {
                      _onTap(2);
                    },
                  ),
                  HeaderMenuTitle(
                    title: UtilString.homeOrderMenuHeaderMenu_4,
                    isTitleTap: isTitleTap[3],
                    onTap: () {
                      _onTap(3);
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: PageView(
                controller: _pageController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  NewOrder(),
                  OnPreparation(),
                  Completed(),
                  Canceled(),
                ]),
          ),
        ],
      ),
    );
  }
}
