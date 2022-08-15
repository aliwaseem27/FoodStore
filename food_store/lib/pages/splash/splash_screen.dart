import 'dart:async';
import 'package:food_store/controllers/cart_controller.dart';
import 'package:food_store/controllers/popular_product_controller.dart';
import 'package:food_store/controllers/recommended_product_controller.dart';
import 'package:food_store/routes/route_helper.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:food_store/utils/dimensions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.elasticInOut,
    );
    _loadResources();
    Timer(Duration(seconds: 3), () {
      Get.offNamed(RouteHelper.getInitialRoute());
    });
  }

  Future<void> _loadResources() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
    await Get.find<CartController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ScaleTransition(
          scale: animation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/image/logo part 1.png",
                width: Dimensions.splashImageWidth,
              ),
              Image.asset(
                "assets/image/logo part 2.png",
                width: Dimensions.splashImageWidth,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
