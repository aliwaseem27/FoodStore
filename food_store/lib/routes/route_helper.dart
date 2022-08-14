import 'package:food_store/pages/cart/cart_page.dart';
import 'package:food_store/pages/food/popular_food_detail.dart';
import 'package:food_store/pages/food/recommended_food_detail.dart';
import 'package:food_store/pages/home/main_food_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cart = "/cart";

  static String getInitialRoute() => "$initial";

  static String getPopularFoodRoute(int pageId, String page) =>
      "$popularFood?pageId=$pageId&page=$page";

  static String getRecommendedFoodRoute(int pageId, String page) =>
      "$recommendedFood?pageId=$pageId&page=$page";

  static String getCartRoute() => "$cart";

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => MainFoodPage()),
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters["pageId"];
          var page = Get.parameters["page"];
          return PopularFoodDetail(pageId: int.parse(pageId!), page:page!);
        }),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters["pageId"];
          var page = Get.parameters["page"];
          return RecommendedFoodDetail(pageId: int.parse(pageId!), page:page!);
        }),
    GetPage(name: cart, page: (){
      return CartPage();
    })
  ];
}
