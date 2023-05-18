import 'package:flutter_pricing_ui/Screens/page_pricing.dart';
import 'package:flutter_pricing_ui/Screens/page_pricing_detail.dart';
import 'package:flutter_pricing_ui/Screens/page_thanks.dart';
import 'package:get/get.dart';

class AppRoute {
  static String home = '/';
  static String thanksPage = '/thanks';
  static String pricingDetailPage = '/pricingDetails';

  static String getHomeRoute() => home;
  static String getThanksRoute() => thanksPage;
  static String getpricingDetailsRoute() => pricingDetailPage;

  static List<GetPage> getPage = [
    GetPage(name: home, page: (() => const PricingScreen())),
    GetPage(name: thanksPage, page: (() => const ThanksPage())),
    GetPage(
        name: pricingDetailPage,
        page: (() {
          PricingDetails pricingDetails = Get.arguments;
          return pricingDetails;
        })),
  ];
}
