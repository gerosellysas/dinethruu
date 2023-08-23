import 'package:flutter/material.dart';

class UtilColors {
  static Color bgWhite = Color(0xffFFFFFF);
  // Login page
  static Color loginBgForm = Color(0xffFFFFFF);
  static Color loginBgTransparant = Colors.white.withOpacity(0.7);
  static Color loginFormBorder = Color(0xffD4DCE4);
  static Color loginFormLabelTitle = Color(0xff394B56);
  static Color loginFormLabelSubtitle = Color(0xff394B56);
  static Color loginFormInput = Color(0xff394B56);
  static Color loginFormValidation = Color(0xffFF0000);
  static Color loginFormHint = Color(0xffE3E5F2);
  static Color loginButtonText = Color(0xff93D466);

  // OTP page
  static Color otpTextColor = Color(0xff4F5D73);
  static Color otpResendColor = Color(0xffFF8800);
  static Color otpVerifyButtonBg = Color(0xff93D466);
  static Color otpVerifyButtonText = Color(0xffFFFFFF);
  static Color otpInputNumberUnderlineColor = Color(0xff4F5D73);

  // Home page (bottom navigation) - Order Menu page (new order - on preparation - completed)
  // Home page
  static Color homeMenuBg = Color(0xffFDFDFD);
  static Color homeLineBorder = Color(0xffEBEBEB);
  static Color homeInactiveIconMenu = Color(0xffB0B0B0);
  static Color homeActiveIconMenu = Color(0xff93D466);
  //
  // Order Menu page
  static Color homeOrderMenuTitle = Color(0xff394B56);
  static Color homeOrderMenuHeaderMenu = Color(0xff4F5D73);
  static Color homeOrderMenuHeaderBar = Color(0xff93D466);
  static Color homeOrderMenuCardTitle = Color(0xff394B56);
  static Color homeOrderMenuCardText = Color(0xff4F5D73);
  static Color homeOrderMenuPrice = Color(0xff2EAF7D);
  static Color homeOrderMenuAccept = Color(0xff93D466);
  static Color homeOrderMenuReject = Color(0xffF44336);
  static Color homeOrderMenuCall = Color(0xff19C5F2);
  static Color homeOrderMenuCardInactiveButtonText = Color(0xffEBEBEB);
  //
  // Order Menu Search page
  static Color orderMenuSearchTitle = Color(0xff394B56);
  static Color orderMenuSearchFormBg = Color(0xffFFFFFF);
  static Color orderMenuSearchFormBorder = Color(0xffBEC6CF);
  static Color orderMenuSearchFormHint = Color(0xffD5D6DC);
  static Color orderMenuSearchFormInput = Color(0xff394B56);
  static Color orderMenuSearchButtonBg = Color(0xff93D466);
  static Color orderMenuSearchButtonText = Color(0xffFFFFFF);
  static Color orderMenuSearchResult = Color(0xff394B56);

  // Order Details page
  static Color orderDetailsHeaderBg = Color(0xff93D466);
  static Color orderDetailsHeaderText = Color(0xff393939);
  static Color orderDetailsCardBg = Color(0xffFFFFFF);
  static Color orderDetailsBase = Color(0xFFEFEFEF);
  static Color orderDetailsLineBorder = Color(0xffEBEBEB);
  static Color orderDetailStatusOrder = Color(0xffFF8800);
  static Color orderDetailsBodyBoldText = Color(0xff4F5D73);
  static Color orderDetailsBodyRegularText = Color(0xff6E6E6E);
  static Color orderDetailsTotal = Color(0xff4F5D73);
  static Color orderDetailDiscAndFees = Color(0xffFF8800);
  static Color orderDetailsGreenButtonBg = Color(0xff93D466);
  static Color orderDetailsRedButtonBg = Color(0xffF44336);
  static Color orderDetailsButtonText = Color(0xffFFFFFF);

  // Reject/Cancel Order
  static Color rejectCancelOrderAppBarBg = Color(0xff93D466);
  static Color rejectCancelOrderTitle = Color(0xff393939);
  static Color rejectCancelOrderBgColor = Color(0xffEFEFEF);
  static Color rejectCancelOrderCardBg = Color(0xffFFFFFF);
  static Color rejectCancelOrderListDivider = Color(0xffA4A4A4);
  static Color rejectCancelOrderradioButtonBorder = Color(0xff000000);
  static Color rejectCancelOrderRegularText = Color(0xff394B56);
  static Color rejectCancelOrderRefNoDetail = Color(0xff4F5D73);
  static Color rejectCancelOrderButtonBg = Color(0xffF44336);
  static Color rejectCancelOrderButtonText = Color(0xffFFFFFF);
  static Color rejectCancelOrderBackButtonBg = Color(0xffDEDEDE);
  static Color rejectCancelOrderBackButtonText = Color(0xff484848);

  // Summary page
  static Color summaryHeaderBg = Color(0xff93D466);
  static Color summaryHeaderText = Color(0xff394B56);
  static Color summaryHeaderCardBg = Color(0xffFFFFFF);
  static Color summaryHeaderBalanceValue = Color(0xffADDD8C);
  static Color summaryListTileBg = Color(0xffFFFFFF);
  static Color summaryListTileDivider = Color(0xffA4A4A4);
  static Color summaryBodySmallText = Color(0xffABABAB);
  static Color summaryBodyRegularText = Color(0xff394B56);
  static Color summaryBodyWithdrawText = Color(0xffFF0000);
  static Color summaryBodyWithdrawAllTransc = Color(0xff93D466);

  // Withdrawal Request page
  static Color wdReqAppBarBg = Color(0xff93D466);
  static Color wdReqTitle = Color(0xff393939);
  static Color wdReqBalanceDisplayBg = Color(0xffF6F6F6);
  static Color wdReqBalanceDisplayBorder = Color(0xff394B56);
  static Color wdReqFormBg = Color(0xffFFFFFF);
  static Color wdReqFormBorder = Color(0xff394B56);
  static Color wdReqFormLabel = Color(0xff394B56);
  static Color wdReqFormHint = Color(0xffD5D6DC);
  static Color wdReqFormInput = Color(0xff394B56);
  static Color wdReqSendButtonBg = Color(0xff93D466);
  static Color wdReqSendButtonText = Color(0xffFFFFFF);
  static Color wdReqCancelButtonBg = Color(0xffDEDEDE);
  static Color wdReqCancelButtonText = Color(0xff484848);

  // MenuItemsByCategory Page
  static Color menuItemAppBarbgColor = Color(0xff93D466);
  static Color menuItemAppBarTitle = Color(0xff393939);
  static Color menuItemButtonText = Color(0xffFFFFFF);
  static Color menuItemCardTitle = Color(0xff394B56);
  static Color menuItemCardDesc = Color(0xffABABAB);
  static Color menuItemCardLeftPrice = Color(0xff394B56);
  static Color menuItemCardRightPrice = Color(0xffFF4E4E);

  // Categories Menu page
  static Color categoriesMenuTitle = Color(0xff394B56);
  static Color categoriesMenuListText = Color(0xff394B56);
  static Color categoriesMenuListDivider = Color(0xffA4A4A4);
  static Color categoriesMenuEditIcon = Color(0xff93D466);
  static Color categoriesMenuDeleteIcon = Color(0xffEE5253);
  static Color categoriesMenuButtonBg = Color(0xff93D466);
  static Color categoriesMenuButtonText = Color(0xffFFFFFF);

  // Add Category page
  static Color addCategoryAppBarBg = Color(0xff93D466);
  static Color addCategoryTitle = Color(0xff393939);
  static Color addCategoryLabelText = Color(0xff394B56);
  static Color addCategoryHintText = Color(0xffD5D6DC);
  static Color addCategoryInputText = Color(0xff394B56);
  static Color addCategoryTextFieldBg = Color(0xffFFFFFF);
  static Color addCategoryTextFieldBorder = Color(0xffBEC6CF);
  static Color addCategorySaveButtonBg = Color(0xff93D466);
  static Color addCategorySaveButtonText = Color(0xffFFFFFF);
  static Color addCategoryCancelButtonBg = Color(0xffDEDEDE);
  static Color addCategoryCancelButtonText = Color(0xff484848);

  // Add Menu page
  static Color addMenuAppBarBg = Color(0xff93D466);
  static Color addMenuTitle = Color(0xff393939);
  static Color addMenuImgBg = Color(0xffD8D8D8);
  static Color addMenuNoImgIcon = Color(0xff9E9E9E);
  static Color addMenuLabelText = Color(0xff394B56);
  static Color addMenuHintText = Color(0xffD5D6DC);
  static Color addMenuInputText = Color(0xff394B56);
  static Color addMenuTextFieldBg = Color(0xffFFFFFF);
  static Color addMenuTextFieldBorder = Color(0xffBEC6CF);
  static Color addMenuToggleActiveButton = Color(0xff93D466);
  static Color addMenuToggleInactiveButton = Color(0xFFDEDEDE);
  static Color addMenuSaveButtonBg = Color(0xff93D466);
  static Color addMenuSaveButtonText = Color(0xffFFFFFF);
  static Color addMenuCancelButtonBg = Color(0xffDEDEDE);
  static Color addMenuCancelButtonText = Color(0xff484848);

  // //Transaction Detail page
  // static Color transactionDetailPageBg = Color(0xffF5F5F5);
  // static Color transactionDetailAppBarBg = Color(0xff93D466);
  // static Color transactionDetailTitle = Color(0xff393939);
  // static Color transactionDetailListBg = Color(0xffFFFFFF);
  // static Color transactionDetailListBorder = Color(0xffA4A4A4);
  // static Color transactionDetailText = Color(0xff394B56);
  // static Color transactionDetailGreenText = Color(0xff93D466);
  // static Color transactionDetailRedText = Color(0xffFF0000);
  // static Color transactionDetailRefNoText = Color(0xff4F5D73);
  // static Color transactionDetailTotalAmountText = Color(0xff5B6A73);

  //Transaction Detail (Order and Withdrawal) page colors => GERO
  static Color transactionDetailPageBg = Color(0xffF5F5F5);
  static Color transactionDetailAppBarBg = Color(0xff93D466);
  static Color transactionDetailTitle = Color(0xff393939);
  static Color transactionDetailListBg = Color(0xffFFFFFF);
  static Color transactionDetailListDivider = Color(0xffA4A4A4);
  static Color transactionDetailText = Color(0xff394B56);
  static Color transactionDetailGreenText = Color(0xff93D466);
  static Color transactionDetailRedText = Color(0xffFF0000);
  static Color transactionDetailRefNoText = Color(0xff4F5D73);
  static Color transactionDetailTotalAmountText = Color(0xff5B6A73);

  //Transaction History page
  static Color transactionHistoryAppBarBg = Color(0xff93D466);
  static Color transactionHistoryTitle = Color(0xff393939);
  static Color transactionHistoryDateBarFilterBg = Color(0xffFFFFFF);
  static Color transactionDateBarFilterBorder = Color(0xff393939);
  static Color transactionHistoryDateBarBg = Color(0xffEFEFEF);
  static Color transactionHistoryDateBarText = Color(0xff394B56);
  static Color transactionHistoryListDivider = Color(0xffA4A4A4);
  static Color transactionHistoryListTitle = Color(0xff394B56);
  static Color transactionHistoryListSubtitle = Color(0xffABABAB);
  static Color transactionHistoryGreenText = Color(0xff93D466);
  static Color transactionHistoryRedText = Color(0xffFF0000);

  //Transaction History bottom sheet
  static Color botSheetBgWhite = Color(0xffFFFFFF);
  static Color botSheetTitleTxt = Color(0xff393939);
  static Color botSheetIcon = Color(0xff000000);
  static Color botSheetActiveButtonText = Color(0xffFFFFFF);
  static Color botSheetInactiveButtonText = Color(0xff394B56);
  static Color botSheetActiveButtonBg = Color(0xff48B6FF);
  static Color botSheetInactiveButtonBg = Color(0xffFFFFFF);
  static Color botSheetActiveButtonBorder = Color(0xff85CEFF);
  static Color botSheetInactiveButtonBorder = Color(0xff394B56);
  static Color botSheetTextFieldBg = Color(0xffE9E9E9);

  //Add Menu bottom sheet
  static Color botSheetAddMenuBg = Color(0xffFFFFFF);
  static Color botSheetAddMenuIcon = Color(0xff394B56);
  static Color botSheetAddMenuText = Color(0xff394B56);
  static Color botSheetAddMenuButtonBg = Color(0xffE9E9E9);
  static Color botSheetAddMenuButtonBorder = Color(0xff394B56);

  //Add Menu edit photo page
  static Color editPhotoAppBarBg = Color(0xff93D466);
  static Color editPhotoAppBarText = Color(0xff393939);
  static Color editPhotoStatusBarColor = Color(0xff93D466);
  static Color editPhotbgColor = Color(0xff000000);
  static Color editPhotoLayer = Color(0xff000000);
  static Color editPhotoActiveControl = Color(0xff93D466);

  //Transaction History bottom sheet
  static Color botSheetHistoryBg = Color(0xffFFFFFF);
  static Color botSheetHistoryTitle = Color(0xff393939);
  static Color botSheetHistoryIcon = Color(0xff000000);
  static Color botSheetHistoryActiveButtonText = Color(0xffFFFFFF);
  static Color botSheetHistoryInactiveButtonText = Color(0xff394B56);
  static Color botSheetHistoryActiveButtonBg = Color(0xff48B6FF);
  static Color botSheetHistoryInactiveButtonBg = Color(0xffFFFFFF);
  static Color botSheetHistoryActiveButtonBorder = Color(0xff85CEFF);
  static Color botSheetHistoryInactiveButtonBorder = Color(0xff394B56);
  static Color botSheetHistoryTextFieldBg = Color(0xffE9E9E9);
  static Color botSheetHistoryTextFieldBorder = Color(0xff394B56);
  static Color botSheetHistoryTextFieldText = Color(0xff394B56);

  // Calendar
  static Color calendarBg = Color(0xffFFFFFF);
  static Color calendarHeaderBg = Color(0xff93D466);
  static Color calendarHeaderText = Color(0xff393939);
  static Color calendarMonthBarText = Color(0xff394B56);
  static Color calendarDaysOfWeek = Color(0xff394B56);
  static Color calendarDowDivider = Color(0xffBDBDBD);
  static Color calendarTodayBorder = Color(0xff93D466);
  static Color calendarSelectedDay = Color(0xffFFFFFF);
  static Color calendarSelectedDayBg = Color(0xff93D466);
  static Color calendarWeekEnd = Color(0xffFF0000);
  static Color calendarActiveDays = Color(0xff394B56);
  static Color calendarInactiveDays = Color(0xffBDBDBD);
  static Color calendarYearBarText = Color(0xff394B56);
  static Color calendarSelectedMonthBg = Color(0xff93D466);
  static Color calendarSelectedMonth = Color(0xffFFFFFF);
  static Color calendarActiveMonth = Color(0xff394B56);

  // Update App
  static Color updateBgColor = Color(0xffFFFFFF);
  static Color updateCloseIcon = Color(0xff000000);
  static Color updateTitleText = Color(0xff4F5D73);
  static Color updateBodyText = Color(0xff4F5D73);
  static Color updateButtonBgColor = Color(0xff93D466);
  static Color updateCancelButtonBgColor = Color(0xffFFFFFF);
  static Color updateButtonText = Color(0xffFFFFFF);
  static Color updateCancelButtontext = Color(0xff4F5D73);

  // Setting page
  static Color settingsMenuHeaderBg = Color(0xffFFFFFF);
  static Color settingsMenuPageBg = Color(0xffF5F5F5);
  static Color settingsMenuCardBg = Color(0xffFFFFFF);
  static Color settingsMenuText = Color(0xff394B56);
  static Color settingsMenuToggleActiveButton = Color(0xff93D466);
  static Color settingsMenuToggleInactiveButton = Color(0xffD8D8D8);
}
