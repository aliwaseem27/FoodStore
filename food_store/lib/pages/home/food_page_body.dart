import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_store/controllers/popular_product_controller.dart';
import 'package:food_store/controllers/recommended_product_controller.dart';
import 'package:food_store/routes/route_helper.dart';
import 'package:food_store/utils/app_constants.dart';
import 'package:food_store/utils/colors.dart';
import 'package:food_store/widgets/big_text.dart';
import 'package:food_store/widgets/icon_and_text_widget.dart';
import 'package:food_store/widgets/info_column.dart';
import 'package:food_store/widgets/small_text.dart';
import 'package:food_store/utils/dimensions.dart';
import 'package:get/get.dart';

import 'package:food_store/models/products_model.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // slider
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return popularProducts.isLoaded
              ? Container(
                  height: Dimensions.pageView,
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: popularProducts.popularProductList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _buildPageView(
                          index, popularProducts.popularProductList[index]);
                    },
                  ),
                )
              : CircularProgressIndicator(
                  color: AppColors.mainColor,
                );
        }),
        // dots
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return DotsIndicator(
            dotsCount: popularProducts.popularProductList.isEmpty
                ? 1
                : popularProducts.popularProductList.length,
            position: _currentPageValue,
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),
        // spacer
        SizedBox(height: Dimensions.height30),
        // Recommended text
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Recommended"),
              SizedBox(width: Dimensions.width10),
              Container(
                margin: EdgeInsets.only(bottom: 3),
                child: BigText(text: ".", color: Colors.black26),
              ),
              SizedBox(width: Dimensions.width10),
              SmallText(text: "Food pairing"),
            ],
          ),
        ),
        // List of food and images
        GetBuilder<RecommendedProductController>(builder: (recommendedProduct) {
          return recommendedProduct.isLoaded
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: recommendedProduct.recommendedProductList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getRecommendedFoodRoute(index, "home"));
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: Dimensions.width20,
                            right: Dimensions.width20,
                            bottom: Dimensions.height10),
                        child: Row(
                          children: [
                            Container(
                              height: Dimensions.listViewImageSize,
                              width: Dimensions.listViewImageSize,
                              decoration: BoxDecoration(
                                color: Colors.white38,
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius20),
                                image: DecorationImage(
                                  image: NetworkImage(AppConstants.kBaseURI +
                                      AppConstants.kUploadsURL +
                                      recommendedProduct
                                          .recommendedProductList[index].img),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding:
                                    EdgeInsets.only(left: Dimensions.width10),
                                height: Dimensions.listViewTextContainerSize,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topRight:
                                        Radius.circular(Dimensions.radius20),
                                    bottomRight:
                                        Radius.circular(Dimensions.radius20),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    BigText(
                                        text: recommendedProduct
                                            .recommendedProductList[index].name),
                                    SizedBox(
                                      height: Dimensions.height10,
                                    ),
                                    SmallText(
                                      text: recommendedProduct
                                          .recommendedProductList[index]
                                          .description,
                                      maxLines: 2,
                                    ),
                                    SizedBox(
                                      height: Dimensions.height10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconAndTextWidget(
                                          icon: Icons.circle,
                                          text: "Normal",
                                          iconColor: AppColors.iconColor1,
                                        ),
                                        IconAndTextWidget(
                                          icon: Icons.location_on,
                                          text: "1.7km",
                                          iconColor: AppColors.mainColor,
                                        ),
                                        IconAndTextWidget(
                                          icon: Icons.access_time_rounded,
                                          text: "32min",
                                          iconColor: AppColors.iconColor2,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              : CircularProgressIndicator(
                  color: AppColors.mainColor,
                );
        }),
      ],
    );
  }

  Widget _buildPageView(int index, ProductModel popularProduct) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 1);
    }

    return Transform(
      transform: matrix,
      child: GestureDetector(
        onTap: () {
          Get.toNamed(RouteHelper.getPopularFoodRoute(index, "home"));
        },
        child: Stack(
          children: [
            Container(
              height: _height,
              margin: EdgeInsets.only(
                  left: Dimensions.width10, right: Dimensions.width10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                image: DecorationImage(
                  image: NetworkImage(AppConstants.kBaseURI +
                      AppConstants.kUploadsURL +
                      popularProduct.img!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: Dimensions.pageViewTextContainer,
                margin: EdgeInsets.only(
                    left: Dimensions.width30,
                    right: Dimensions.width30,
                    bottom: Dimensions.height30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, 0),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(5, 0),
                    ),
                  ],
                ),
                child: Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height15,
                      left: Dimensions.width15,
                      right: Dimensions.width15),
                  child: InfoColumn(
                    text: popularProduct.name!,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
