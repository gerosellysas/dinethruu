import 'package:dinethruu/utils/utilColors.dart';
import 'package:dinethruu/utils/utilString.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatefulWidget {
  final Function onRejectTap;
  final Function onCallTap;
  final Function onAcceptTap;
  final Function onTap;
  final bool isAcceptVisible;
  final bool isRejectVisible;
  final bool isCallVisible;
  final String referenceNo;
  final String orderDate;
  final String orderType;
  final String customerName;
  final String tripCompany;
  final String tripVehicleNo;
  final int totalQty;
  final double totalAmount;

  const OrderCard({
    Key key,
    this.onRejectTap,
    this.onCallTap,
    this.onAcceptTap,
    this.isAcceptVisible = true,
    this.isRejectVisible = true,
    this.isCallVisible = true,
    this.onTap,
    this.orderType = "",
    this.referenceNo = "",
    this.orderDate = "",
    this.customerName = "",
    this.tripCompany = "",
    this.tripVehicleNo = "",
    this.totalQty = 0,
    this.totalAmount = 0.00,
  }) : super(key: key);
  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  double cardHeight = 170;
  double widthRightRow = 100;
  double radius = 5;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      height: cardHeight,
      width: double.maxFinite,
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: UtilColors.bgWhite,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.17),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                GestureDetector(
                  child: Container(
                    width: double.maxFinite,
                    height: cardHeight * 0.75,
                    padding:
                        EdgeInsets.fromLTRB(w * 0.032, w * 0.032, w * 0.032, 5),
                    color: UtilColors.bgWhite,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text.rich(
                                TextSpan(
                                  style: TextStyle(
                                    fontSize: UtilString
                                        .fontSizeHomeOrderMenuCardText,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "${widget.referenceNo}\n",
                                      style: TextStyle(
                                          color:
                                              UtilColors.homeOrderMenuCardTitle,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    TextSpan(
                                      text: "${widget.orderDate}",
                                      style: TextStyle(
                                          color:
                                              UtilColors.homeOrderMenuCardText,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                                width: widthRightRow,
                                alignment: Alignment.center,
                                color: UtilColors.bgWhite,
                                child: Text(
                                  "${widget.orderType}",
                                  style: TextStyle(
                                      color: UtilColors.homeOrderMenuCardText,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w400),
                                )),
                          ],
                        ),
                        SizedBox(height: cardHeight * 0.04),
                        Container(
                          width: double.maxFinite,
                          alignment: Alignment.centerLeft,
                          color: UtilColors.bgWhite,
                          child: Text(
                            "${widget.customerName}",
                            style: TextStyle(
                                color: UtilColors.homeOrderMenuCardTitle,
                                fontSize:
                                    UtilString.fontSizeHomeOrderMenuCardText,
                                fontWeight: FontWeight.w400),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                width: double.maxFinite,
                                alignment: Alignment.centerLeft,
                                color: UtilColors.bgWhite,
                                child: Text(
                                  "${widget.tripCompany}",
                                  style: TextStyle(
                                      color: UtilColors.homeOrderMenuCardTitle,
                                      fontSize: UtilString
                                          .fontSizeHomeOrderMenuCardText,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            Container(
                              width: widthRightRow,
                              alignment: Alignment.center,
                              color: UtilColors.bgWhite,
                              child: Text(
                                "${widget.tripVehicleNo}",
                                style: TextStyle(
                                    color: UtilColors.homeOrderMenuCardTitle,
                                    fontSize: UtilString
                                        .fontSizeHomeOrderMenuCardText,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Container(
                            height: double.maxFinite,
                            width: double.maxFinite,
                            alignment: Alignment.bottomLeft,
                            color: UtilColors.bgWhite,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    width: double.maxFinite,
                                    alignment: Alignment.centerLeft,
                                    color: UtilColors.bgWhite,
                                    child: Text(
                                      "${widget.totalQty} items",
                                      style: TextStyle(
                                          color:
                                              UtilColors.homeOrderMenuCardTitle,
                                          fontSize: UtilString
                                              .fontSizeHomeOrderMenuCardText,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: widthRightRow,
                                  alignment: Alignment.center,
                                  color: UtilColors.bgWhite,
                                  child: Text(
                                    "Rs ${widget.totalAmount}",
                                    style: TextStyle(
                                        color: UtilColors.homeOrderMenuPrice,
                                        fontSize: UtilString
                                            .fontSizeHomeOrderMenuCardText,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: widget.onTap,
                ),
                Expanded(
                  child: Container(
                    height: double.maxFinite,
                    width: double.maxFinite,
                    color: UtilColors.bgWhite,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Material(
                            color: UtilColors.bgWhite,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(radius)),
                            child: InkWell(
                              splashColor: Colors.grey,
                              customBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(radius)),
                              ),
                              child: Container(
                                height: double.maxFinite,
                                width: double.maxFinite,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: UtilColors.bgWhite,
                                  border: Border(
                                    top: BorderSide(
                                        width: 1,
                                        color: UtilColors.homeLineBorder),
                                    right: BorderSide(
                                        width: 1,
                                        color: UtilColors.homeLineBorder),
                                  ),
                                ),
                                child: Text(
                                  UtilString.homeOrderMenuAccept,
                                  style: TextStyle(
                                      color: widget.isAcceptVisible
                                          ? UtilColors.homeOrderMenuAccept
                                          : UtilColors
                                              .homeOrderMenuCardInactiveButtonText,
                                      fontSize: UtilString
                                          .fontSizeHomeOrderMenuCardButton,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              onTap: widget.onAcceptTap,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Material(
                            color: UtilColors.bgWhite,
                            child: InkWell(
                              splashColor: Colors.grey,
                              child: Container(
                                height: double.maxFinite,
                                width: double.maxFinite,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: UtilColors.bgWhite,
                                  border: Border(
                                    top: BorderSide(
                                        width: 1,
                                        color: UtilColors.homeLineBorder),
                                    right: BorderSide(
                                        width: 1,
                                        color: UtilColors.homeLineBorder),
                                  ),
                                ),
                                child: Text(
                                  UtilString.homeOrderMenuReject,
                                  style: TextStyle(
                                      color: widget.isRejectVisible
                                          ? UtilColors.homeOrderMenuReject
                                          : UtilColors
                                              .homeOrderMenuCardInactiveButtonText,
                                      fontSize: UtilString
                                          .fontSizeHomeOrderMenuCardButton,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              onTap: widget.onRejectTap,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Material(
                            color: UtilColors.bgWhite,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(radius)),
                            child: InkWell(
                              splashColor: Colors.grey,
                              customBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(radius)),
                              ),
                              child: Container(
                                height: double.maxFinite,
                                width: double.maxFinite,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: UtilColors.bgWhite,
                                  border: Border(
                                    top: BorderSide(
                                        width: 1,
                                        color: UtilColors.homeLineBorder),
                                  ),
                                ),
                                child: Text(
                                  UtilString.homeOrderMenuCall,
                                  style: TextStyle(
                                      color: widget.isCallVisible
                                          ? UtilColors.homeOrderMenuCall
                                          : UtilColors
                                              .homeOrderMenuCardInactiveButtonText,
                                      fontSize: UtilString
                                          .fontSizeHomeOrderMenuCardButton,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              onTap: widget.onCallTap,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
