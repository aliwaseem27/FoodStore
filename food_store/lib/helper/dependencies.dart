import 'package:food_store/controllers/popular_product_controller.dart';
import 'package:food_store/controllers/recommended_product_controller.dart';
import 'package:food_store/data/api/api_client.dart';
import 'package:food_store/data/repository/popular_product_repo.dart';
import 'package:food_store/data/repository/recommended_product_repo.dart';
import 'package:food_store/utils/app_constants.dart';
import 'package:get/get.dart';

Future<void> init() async {
  // ApiClients
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.kBaseURI));

  //Repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));

  // Controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
}