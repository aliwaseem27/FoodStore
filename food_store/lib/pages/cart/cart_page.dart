import 'package:flutter/material.dart';
import 'package:food_store/controllers/cart_controller.dart';
import 'package:food_store/controllers/popular_product_controller.dart';
import 'package:food_store/controllers/recommended_product_controller.dart';
import 'package:food_store/routes/route_helper.dart';
import 'package:food_store/utils/app_constants.dart';
import 'package:food_store/utils/colors.dart';
import 'package:food_store/utils/dimensions.dart';
import 'package:food_store/widgets/app_icon.dart';
import 'package:food_store/widgets/big_text.dart';
import 'package:food_store/widgets/small_text.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  // final int pageId;
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Upper Buttons
          Positioned(
            top: Dimensions.height20 * 3,
            right: Dimensions.width20,
            left: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: AppIcon(
                    icon: Icons.arrow_back_ios,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                  ),
                ),
                SizedBox(width: Dimensions.width20 * 5),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getInitialRoute());
                  },
                  child: AppIcon(
                    icon: Icons.home_outlined,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_cart_outlined,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),
              ],
            ),
          ),
          // Cart Items
          Positioned(
            top: Dimensions.height20 * 6,
            left: Dimensions.width20,
            right: Dimensions.width20,
            bottom: 0,
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: GetBuilder<CartController>(
                builder: (productsInCart) {
                  var cartList = productsInCart.getItems;
                  return ListView.builder(
                    itemCount: cartList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: Dimensions.height20 * 5,
                        width: double.maxFinite,
                        margin: EdgeInsets.only(
                          bottom: Dimensions.height10,
                        ),
                        decoration: BoxDecoration(
                          // color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                        ),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                var productIndex =
                                    Get.find<PopularProductController>()
                                        .popularProductList
                                        .indexOf(cartList[index].product);
                                if (productIndex >= 0) {
                                  Get.toNamed(RouteHelper.getPopularFoodRoute(
                                      productIndex, "cart"));
                                } else {
                                  productIndex =
                                      Get.find<RecommendedProductController>()
                                          .recommendedProductList
                                          .indexOf(cartList[index].product);
                                  Get.toNamed(
                                      RouteHelper.getRecommendedFoodRoute(
                                          productIndex, "cart"));
                                }
                              },
                              child: Container(
                                width: Dimensions.width20 * 5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius20),
                                  color: Colors.lightBlue,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(AppConstants.kBaseURI +
                                        AppConstants.kUploadsURL +
                                        cartList[index].img!),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: Dimensions.width15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  BigText(
                                    text: cartList[index].name!,
                                    color: Colors.black54,
                                  ),
                                  SmallText(text: "Spicy"),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      BigText(
                                        text: "\$ ${cartList[index].price!}",
                                        color: Colors.redAccent,
                                      ),
                                      // Quantity Buttons
                                      Container(
                                        padding: EdgeInsets.all(
                                            Dimensions.height10 / 2),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.radius20),
                                        ),
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                                onTap: () {
                                                  productsInCart.addItem(
                                                      cartList[index].product!,
                                                      -1);
                                                },
                                                child: Icon(Icons.remove,
                                                    color:
                                                        AppColors.signColor)),
                                            SizedBox(width: Dimensions.width10),
                                            BigText(
                                                text: cartList[index]
                                                    .quantity
                                                    .toString()),
                                            SizedBox(width: Dimensions.width10),
                                            GestureDetector(
                                                onTap: () {
                                                  productsInCart.addItem(
                                                      cartList[index].product!,
                                                      1);
                                                },
                                                child: Icon(Icons.add,
                                                    color:
                                                        AppColors.signColor)),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (cartController) {
          return Container(
            height: Dimensions.bottomHeightBar,
            decoration: BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(Dimensions.radius20 * 2),
                topLeft: Radius.circular(Dimensions.radius20 * 2),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: Dimensions.height20,
                    bottom: Dimensions.height20,
                    left: Dimensions.width20,
                    right: Dimensions.width20,),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                  ),
                  child: Row(
                    children: [
                      BigText(text: "\$ ${cartController.totalAmount}"),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.only(
                        top: Dimensions.height20,
                        bottom: Dimensions.height20,
                        left: Dimensions.width20,
                        right: Dimensions.width20),
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                    ),
                    child: BigText(
                        text: 'Check out',
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
