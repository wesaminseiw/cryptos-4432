import 'package:cryptos/data/models/coin_data.dart';
import 'package:cryptos/presentation/screens/details_screen.dart';

import 'utils/constants.dart';
import '../presentation/screens/home_screen.dart';
import 'package:get/get.dart';

class AppRouter {
  //* routes defining
  static final List<GetPage> routes = [
    GetPage(
      name: homeRoute,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: detailsScreenRoute,
      page: () => DetailsScreen(),
    ),
  ];

  //* navigators
  static void toHome() {
    Get.toNamed(homeRoute);
  }

  static void toDetailsScreen(CoinData coinData) {
    Get.toNamed(detailsScreenRoute, arguments: coinData);
  }

  static void back() {
    Get.back();
  }
}
