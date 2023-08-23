class UtilString {
  // Notification Title - ALL PAGES
  static String notifErrorTitle = "Error";
  static String notifInfoTitle = "Information";
  static String notifRejectOrderTitle = "Reject Order";
  static String notifCancelOrderTitle = "Cancel Order";
  // Connection Error notification message
  static String notifInfoConnectionError =
      "Network Error, Check your connection";
  // Login notification message
  static String notifLoginInfoCountryCode = "Please enter your country code";
  static String notifLoginErrorInputNumber = "Please correct your number";
  // OTP notification message
  static String notifOTPInfoEmptyForm = "Please input your OTP to proceed";
  static String notifOTPErrorIncorrectOTP =
      "The OTP you've entered is incorrect.\nPlease try again";
  // Reject/Cancel Order notification message
  static String notifRejectOrderValidation =
      "Please select why\nyou want to reject this order";
  static String notifCancelOrderValidation =
      "Please select why\nyou want to cancel this order";
  static String notifRejectOrderConfirm = "Are you sure to reject this order?";
  static String notifCancelOrderConfirm = "Are you sure to cancel this order?";
  // Summary notification message
  static String notifSummaryInfoEmptyForm =
      "Please input the amount you want to withdraw";
  static String notifSummaryInfoWDSuccess = "Withdrawal success";
  static String notifSummaryErrorInputNumber =
      "Please enter the numbers correctly";

  // Login page
  static String loginFormLabelTitle = "Enter your phone number";
  static String loginFormLabelSubtitle =
      "We will send you 6 digit verification code";
  static String loginFormValidation = "* please input your phone number";
  static String loginFormHint = "Enter phone number";
  static String loginButton = "LOGIN";

  static double fontSizeLoginFormLabelTitle = 15;
  static double fontSizeLoginFormLabelSubtitle = 10;
  static double fontSizeLoginFormValidation = 10;
  static double fontSizeLoginFormHint = 15;
  static double fontSizeLoginFormInput = 15;
  static double fontSizeLoginButton = 17;

  // OTP page
  static String otpTitle = "Phone Verification";
  static String otpSendToNumber1 = "We have sent verification code";
  static String otpSendToNumber2 = "to  ";
  static String otpDidntReceive = "Didn't receive OTP ?";
  static String otpResend = "Resend";
  static String otpVerifyButton = "Verify";

  static double fontSizeOTPTitle = 20;
  static double fontSizeOTPResendText = 17;
  static double fontSizeOTPVerifyButton = 13;
  static double fontSizeOTPInputNumber = 30;

  // Home page (bottom navigation) - Order Menu page (new order - on preparation - completed)
  // Home page
  static String homeMenuOrder = "Orders";
  static String homeMenuSummary = "Summary";
  static String homeMenuMenu = "Menu";
  static String homeMenuSetting = "Settings";

  static double fontSizeHomeMenuLabelIcon = 10;
  //
  // Order Menu page
  static String homeOrderMenuTitle = "Orders";
  static String homeOrderMenuHeaderMenu_1 = "New Order";
  static String homeOrderMenuHeaderMenu_2 = "On Preparation";
  static String homeOrderMenuHeaderMenu_3 = "Completed";
  static String homeOrderMenuHeaderMenu_4 = "Canceled";
  static String homeOrderMenuAccept = "Accept";
  static String homeOrderMenuReject = "Reject";
  static String homeOrderMenuCall = "Call";
  //
  static double fontSizeHomeOrderMenuTitle = 20;
  static double fontSizeHomeOrderMenuHeaderMenu = 15;
  static double fontSizeHomeOrderMenuCardText = 13;
  static double fontSizeHomeOrderMenuCardButton = 15;
  //
  // Order Menu Search page
  static String orderMenuSearchFormHint = "Enter Order Reference No";
  static String orderMenuSearchButton = "Search";
  //
  static double fontSizeOrderMenuSearchFormHint = 15;
  static double fontSizeOrderMenuSearchFormInput = 15;
  static double fontSizeOrderMenuSearchButton = 13;
  static double fontSizeOrderMenuSearchResult = 13;

  // Order Details page
  static String orderDetailsTitle = "Order Details";
  static String orderDetailsOrderAmount = "Order Amount";
  static String orderDetailsDiscount = "Discount";
  static String orderDetailsSubtotal = "Subtotal";
  static String orderDetailsTax = "Tax";
  static String orderDetailsTaxExplain = "2.5% State GST + 2.5% Centre GST";
  static String orderDetailsFees = "Fees";
  static String orderDetailsFeesExplain = "8% from Subtotal";
  static String orderDetailsTotal = "Total";
  static String orderDetailsTotalExplain = "Receivable Amount";
  static String orderDetailsAcceptButton = "Accept";
  static String orderDetailsRejectButton = "Reject";
  static String orderDetailsFoodReadyButton = "Food is Ready";
  static String orderDetailsCancelOrderButton = "Cancel Order";

  static double fontSizeOrderDetailsTitle = 20;
  static double fontSizeOrderDetailsHeaderName = 18;
  static double fontSizeOrderDetailsHeaderTitleText = 15;
  static double fontSizeOrderDetailsHeaderText = 13;
  static double fontSizeOrderDetailsOrderListProduct = 15;
  static double fontSizeOrderDetailsOrderListRegular = 13;
  static double fontSizeOrderDetailsOrderListSmall = 9;
  static double fontSizeOrderDetailsOrderListTotal = 20;
  static double fontSizeOrderDetailsButton = 13;

  // Reject / Cancel Order string
  static String rejectOrderTitle = "Reject Order";
  static String cancelOrderTitle = "Cancel Order";
  static String rejectCancelOrderDate = "Order Date";
  static String rejectCancelOrderRefNo = "Reference No";
  static String rejectCancelOrderTotalAmount = "Total Amount";
  static String rejectOrderRadioButtonTitle =
      "Why you want to reject this order?";
  static String cancelOrderRadioButtonTitle =
      "Why you want to cancel this order?";
  static String rejectOrderButton = "Reject Order";
  static String cancelOrderButton = "Cancel Order";
  static String rejectCancelOrderBackButton = "Back";
  static String rejectCancelOrderYesDialogButton = "Yes";
  static String rejectCancelOrderNoDialogButton = "No";

  static double fontSizeRejectCancelOrderTitle = 20;
  static double fontSizeRejectCancelOrderRegularText = 13;
  static double fontSizeRejectCancelOrderRefNoDetail = 15;
  static double fontSizeRejectCancelOrderButtonText = 13;

  // Summary Page
  static String summaryTitle = "Summary";
  static String summarySecretRecipe = "Secret Recipe Restaurant";
  static String summaryTotalOrders = "TOTAL ORDERS";
  static String summaryTotalSales = "TOTAL SALES";
  static String summaryMonthSales = "MONTH SALES";
  static String summaryBalance = "BALANCE";
  static String summaryWithdraw = "Withdraw";
  static String summaryRecentTransc = "Recent Transactions";
  static String summaryAllTransaction = "All Transactions";

  static double fontSizeSummaryHeaderTitle = 20;
  static double fontSizeSummaryHeaderSecretRecipeTitle = 18;
  static double fontSizeSummaryHeaderSecretRecipeDetail = 15;
  static double fontSizeSummaryHeaderValueTitle = 12;
  static double fontSizeSummaryHeaderValueDetail = 25;
  static double fontSizeSummaryWithDraw = 17;
  static double fontSizeSummaryAllTransaction = 17;
  static double fontSizeSummaryBodyRecentTransc = 17;
  static double fontSizeSummaryBodyDescription = 18;
  static double fontSizeSummaryBodySmallText = 13;

  // Withdrawal Request page
  static String wdReqTitle = "Withdrawal Request";
  static String wdReqYourBalanceLabel = "Your balance";
  static String wdReqAvailableBalanceLabel = "Available balance";
  static String wdReqAmountToWDLabel = "Amount you want to withdraw";
  static String wdReqHint = "Amount";
  static String wdReqSendButton = "Send Request";
  static String wdReqCancelButton = "Cancel";

  static double fontSizeWDReqTitle = 20;
  static double fontSizeWDReqFormLabel = 15;
  static double fontSizeWDReqFormHint = 25;
  static double fontSizeWDReqFormInput = 25;
  static double fontSizeWDReqButton = 13;

  // MenuItemsByCategory Page
  static String menuItemAppBarTitle = "Meals";
  static String menuItemButtonText = "Add Menu Item";

  static double fontSizeMenuItemAppBarTitle = 20;
  static double fontSizeMenuItemButtonText = 13;
  static double fontSizeMenuItemCardTitle = 16;
  static double fontSizeMenuItemCardPrice = 18;
  static double fontSizeMenuItemCardDesc = 13;

  // Categories Menu page
  static String categoriesMenuTitle = "Categories";
  static String categoriesAddCategoryButton = "Add Category";
  static String categoriesAddMenuItemButton = "Add Menu Item";

  static double fontSizeCategoriesMenuTitle = 20;
  static double fontSizeCategoriesMenuList = 18;
  static double fontSizeCategoriesMenuButton = 13;

  // Add Category page
  static String addCategoryTitle = "Add Category";
  static String addCategoryEditTitle = "Edit Category";
  static String addCategoryLabel = "Category";
  static String addCategoryHint = "Enter category name";
  static String addCategorySaveButton = "Save";
  static String addCategoryEditButton = "Edit";
  static String addCategoryCancelButton = "Cancel";

  static double fontSizeAddCategoryTitle = 20;
  static double fontSizeAddCategoryLabel = 15;
  static double fontSizeAddCategoryHint = 15;
  static double fontSizeAddCategoryInputText = 15;
  static double fontSizeAddCategoryButton = 13;

  // Add Menu page
  static String addMenuTitle = "Add Menu";
  static String addMenuNameLabel = "Menu Name";
  static String addMenuNameHint = "Enter menu name";
  static String addMenuCategoryLabel = "Category";
  static String addMenuCategoryHint = "Select category";
  static String addMenuPriceLabel = "Price";
  static String addMenuPriceHint = "Enter price";
  static String addMenuSalePriceLabel = "Sale Price";
  static String addMenuSalePriceHint = "Enter sale price";
  static String addMenuVegetarianLabel = "Vegetarian Friendly";
  static String addMenuAvailableLabel = "Available";
  static String addMenuDescriptionLabel = "Description";
  static String addMenuDescriptionHint = "Enter description";
  static String addMenuSaveButton = "Save";
  static String addMenuCancelButton = "Cancel";

  static double fontSizeAddMenuTitle = 20;
  static double fontSizeAddMenuLabel = 15;
  static double fontSizeAddMenuHint = 15;
  static double fontSizeAddMenuInputText = 15;
  static double fontSizeAddMenuButton = 13;

  // Transaction Detail (Order and Withdrawal) page string => GERO
  static String transactionDetailTitle = "Transaction Detail";
  static String transactionDate = "Transaction Date";
  static String transactionDateDetail = "21/03/2021 08:33:01";
  static String transactionRefNo = "Reference No";
  static String transactionOrderRefNoDetail = "#ABCD1234";
  static String transactionWDRefNoDetail = "#W0001234";
  static String transactionType = "Transaction Type";
  static String transactionTypeDetail = "Order";
  static String transactionStatus = "Transaction Status";
  static String transactionStatusDetail = "Successful";
  static String transactionAmount = "Amount";
  static String transactionAmountDetail = "+Rs 30.00";
  static String transactionFees = "Fees";
  static String transactionFeesDetail = "-Rs 5.00";
  static String transactionTotalAmount = "Total Amount";
  static String transactionTotalAmountDetail = "+Rs 25.00";
  static String transactionOrderDetail = "+Rs 25.00";
  static String transactionWDDetail = "-Rs 2,000.00";

  static double fontSizeTransactionDetailTitle = 20;
  static double fontSizeTransactionDetailText1 = 13;
  static double fontSizeTransactionDetailText2 = 15;
  static double fontSizeTransactionDetailText3 = 18;
  static double fontSizeTransactionDetailText4 = 40;

  // Transaction History page string
  // static String transactionHistoryTitle = "Transaction History";
  // static String transactionHistoryDate = "21 Mar 2021";
  // static String transactionHistoryOrderRefNo = "Order #ABCD1234";
  // static String transactionHistoryOrderItems = "3 items";
  // static String transactionHistoryOrderAmount = "+Rs 24.00";
  // static String transactionHistoryWDText = "Withdrawal";
  // static String transactionHistoryWDRefNo = "#W0123456";
  // static String transactionHistoryWDAmount = "-Rs 300.00";

  // static double fontSizeTransactionHistoryTitle = 20;
  // static double fontSizeTransactionHistoryDate = 17;
  // static double fontSizeTransactionHistoryText1 = 18;
  // static double fontSizeTransactionHistoryText2 = 13;

  // Transaction History page string
  static String transactionHistoryTitle = "Transaction History";

  static double fontSizeTransactionHistoryTitle = 20;
  static double fontSizeTransactionHistoryDateBarFilter = 17;
  static double fontSizeTransactionHistoryListTitle = 18;
  static double fontSizeTransactionHistoryListSubtitle = 13;
  static double fontSizeTransactionHistoryListTrailing = 13;

  // // Transaction History bottom sheet string
  // static String botSheetTitle = "Filter";
  // static String botSheetButton1 = "Today";
  // static String botSheetButton2 = "Yesterday";
  // static String botSheetButton3 = "This Month";
  // static String botSheetButton4 = "Last 60 days";
  // static String botSheetButton5 = "Start Date";
  // static String botSheetButton6 = "End Date";

  // static double fontSizeBotSheetTitle = 20;
  // static double fontSizeBotSheetButton = 22;

  // Transaction History bottom sheet string
  static String botSheetHistoryTitle = "Filter";
  static String botSheetHistoryButton1 = "Today";
  static String botSheetHistoryButton2 = "Yesterday";
  static String botSheetHistoryButton3 = "This Month";
  static String botSheetHistoryButton4 = "Last 60 days";
  static String botSheetHistoryStartLabel = "Start Date";
  static String botSheetHistoryEndLabel = "End Date";

  static double fontSizeBotSheetHistoryTitle = 20;
  static double fontSizeBotSheetHistoryButton = 22;
  static double fontSizeBotSheetHistoryInputText = 18;
  static double fontSizeBotSheetHistoryLabelText = 15;

  // Add Menu bottom sheet string
  static String botSheetAddMenuCamera = "Camera";
  static String botSheetAddMenuGallery = "Gallery";
  static String botSheetAddMenuCameraPermissionTitle =
      "Dinethru needs access to your device camera";
  static String botSheetAddMenuStoragePermissionTitle =
      "Dinethru needs access to your device storage";
  static String botSheetAddMenuDeny = "DENY";
  static String botSheetAddMenuSetting = "SETTING";

  static double fontSizeBotSheetAddMenuTitle = 17;
  static double fontSizeBotSheetAddMenuText = 18;
  static double fontSizeBotSheetAddMenuButtonText = 22;

  // Calendar string
  static double calendarHeaderText = 24;
  static double calendarMonthBarText = 18;
  static double calendarDaysOfWeekText = 15;
  static double calendarSelectedDays = 18;
  static double calendarDays = 15;
  static double calendarYearBarText = 18;
  static double calendarMonthYearText = 15;

  // Update App string
  static String updateAvailableTitle = "New updates available";
  static String updateAvailableBody1 = "There is new version available";
  static String updateAvailableBody2 =
      "of Dinethru Shop app. Please update for";
  static String updateAvailableBody3 = "better experience";
  static String updateButtonUpdate = "Update";
  static String updateAvailableCancelButton = "Maybe later";
  static String updateRequiredTitle = "Update required";
  static String updateRequiredBody1 = "This version of Dinethru Shop app is";
  static String updateRequiredBody2 = "no longer supported.";
  static String updateRequiredBody3 = "To continue using this app,";
  static String updateRequiredBody4 = "please update to the latest version";
  static String updateRequiredCancelButton = "Close app";

  static double fontSizeUpdateTitle = 25;
  static double fontSizeUpdateBody = 15;
  static double fontSizeUpdateButton = 15;

  // Settings page
  static String settingsMenuTitle = "Settings";
  static String settingsMenuAvailableLabel = "Available";
  static String settingMenuLogoutLabel = "Log out";

  static double fontSizeSettingsMenuTitle = 20;
  static double fontSizeSettingsMenuLabel = 15;
}
