class Api {
  static const baseUrl = 'https://drivethruu-api-dev.azurewebsites.net/api';

  // profile ====================================
  static String profile() {
    return "$baseUrl/Profile";
  }

  static String profileDevice() {
    return "$baseUrl/Profile/device";
  }

  // statusShop ====================================
  static String statusShop() {
    return "$baseUrl/shop/settings";
  }

  // Order API ==================================
  static String shopOrders() {
    return "$baseUrl/shop/orders";
  }

  static String acceptOrder(int id) {
    return "$baseUrl/shop/orders/$id/accept";
  }

  static String rejectOrder(int id, int reasonId) {
    return "$baseUrl/shop/orders/$id/reject?reasonId=$reasonId";
  }

  static String cancelOrder(int id, int reasonId) {
    return "$baseUrl/shop/orders/$id/cancel?reasonId=$reasonId";
  }

  static String readyOrder(int id) {
    return "$baseUrl/shop/orders/$id/ready";
  }

  // Category API ==================================
  static String shopMenusCategory() {
    return "$baseUrl/shop/categories";
  }

  static String editShopMenusCategory() {
    return "$baseUrl/shop/categories";
  }

  static String deleteShopMenusCategory(int id) {
    return "$baseUrl/shop/categories/?id=$id";
  }

  static String listFoodOfCategory(int id) {
    return "$baseUrl/shop/categories/$id/menus";
  }

  // Food Menu ==================================
  static String shopMenuAddFoodMenu() {
    return "$baseUrl/shop/menus";
  }

  static String shopMenuEditFoodMenu() {
    return "$baseUrl/shop/menus";
  }

  static String shopMenuDeleteFoodMenu(int id) {
    return "$baseUrl/shop/menus/$id";
  }

  // Summary API ==================================
  static String wallet() {
    return "$baseUrl/shop/wallet";
  }

  static String allTransaction() {
    return "$baseUrl/shop/wallet/transactions";
  }

  static String recentTransaction() {
    return "$baseUrl/shop/wallet/recenttransactions";
  }

  static String transactionDetail(int id) {
    return "$baseUrl/shop/wallet/transactions/$id";
  }

  static String withdrawalRequest() {
    return "$baseUrl/shop/wallet/withdraw";
  }

  // Check Version ===============================
  static String checkVersion() {
    return "$baseUrl/configs/checkVersion";
  }
}
