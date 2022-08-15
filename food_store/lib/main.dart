import 'package:flutter/material.dart';
import 'package:food_store/controllers/cart_controller.dart';
import 'package:food_store/controllers/popular_product_controller.dart';
import 'package:food_store/pages/cart/cart_page.dart';
import 'package:food_store/pages/food/popular_food_detail.dart';
import 'package:food_store/pages/food/recommended_food_detail.dart';
import 'package:food_store/pages/home/main_food_page.dart';
import 'package:food_store/pages/splash/splash_screen.dart';
import 'package:food_store/routes/route_helper.dart';
import 'package:get/get.dart';
import 'controllers/recommended_product_controller.dart';
import 'helper/dependencies.dart' as dep;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PopularProductController>(
      builder: (_) {
        return GetBuilder<RecommendedProductController>(
          builder: (_) {
            return GetBuilder<CartController>(
              builder: (_) {
                return GetMaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Best Restaurant',
                  // home: SplashScreen(),
                  initialRoute: RouteHelper.getSplashScreen(),
                  getPages: RouteHelper.routes,
                );
              }
            );
          }
        );
      }
    );
  }
}
