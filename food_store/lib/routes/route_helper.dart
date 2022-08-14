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

  static String getPopularFoodRoute(int pageId) =>
      "$popularFood?pageId=$pageId";

  static String getRecommendedFoodRoute(int pageId) =>
      "$recommendedFood?pageId=$pageId";

  static String getCartRoute() => "$cart";

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => MainFoodPage()),
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters["pageId"];
          return PopularFoodDetail(pageId: int.parse(pageId!));
        }),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters["pageId"];
          return RecommendedFoodDetail(pageId: int.parse(pageId!));
        }),
    GetPage(name: cart, page: (){
      // var pageId = Get.parameters["pageId"];
      return CartPage();
    })
  ];
}
