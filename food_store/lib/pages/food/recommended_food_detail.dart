import 'package:flutter/material.dart';
import 'package:food_store/utils/colors.dart';
import 'package:food_store/widgets/app_icon.dart';
import 'package:food_store/widgets/big_text.dart';

import 'package:food_store/utils/dimensions.dart';
import 'package:food_store/widgets/expandable_text_widget.dart';

class RecommendedFoodDetail extends StatefulWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  State<RecommendedFoodDetail> createState() => _RecommendedFoodDetailState();
}

class _RecommendedFoodDetailState extends State<RecommendedFoodDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(Dimensions.height45),
              child: Container(
                padding: EdgeInsets.only(top: 5, bottom: 10),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius20),
                    topLeft: Radius.circular(Dimensions.radius20),
                  ),
                ),
                child: Center(
                  child: BigText(
                    text: "Chinese Side",
                    fontSize: Dimensions.font26,
                  ),
                ),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/image/food0.png",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(
                  left: Dimensions.width20, right: Dimensions.width20),
              child: ExpandableTextWidget(
                  text:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec diam sapien, sodales et risus ut, consequat pulvinar ipsum. Suspendisse sagittis arcu augue, sed bibendum arcu mattis vel. Morbi congue sit amet lacus vel tincidunt. Integer at molestie magna. Duis massa ex, elementum vitae mauris vitae, placerat consectetur orci. Donec vel velit vitae nulla gravida congue non non neque. Praesent a cursus orci. Donec porta tellus a mauris semper, a maximus urna dapibus.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec diam sapien, sodales et risus ut, consequat pulvinar ipsum. Suspendisse sagittis arcu augue, sed bibendum arcu mattis vel. Morbi congue sit amet lacus vel tincidunt. Integer at molestie magna. Duis massa ex, elementum vitae mauris vitae, placerat consectetur orci. Donec vel velit vitae nulla gravida congue non non neque. Praesent a cursus orci. Donec porta tellus a mauris semper, a maximus urna dapibus.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec diam sapien, sodales et risus ut, consequat pulvinar ipsum. Suspendisse sagittis arcu augue, sed bibendum arcu mattis vel. Morbi congue sit amet lacus vel tincidunt. Integer at molestie magna. Duis massa ex, elementum vitae mauris vitae, placerat consectetur orci. Donec vel velit vitae nulla gravida congue non non neque. Praesent a cursus orci. Donec porta tellus a mauris semper, a maximus urna dapibus.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec diam sapien, sodales et risus ut, consequat pulvinar ipsum. Suspendisse sagittis arcu augue, sed bibendum arcu mattis vel. Morbi congue sit amet lacus vel tincidunt. Integer at molestie magna. Duis massa ex, elementum vitae mauris vitae, placerat consectetur orci. Donec vel velit vitae nulla gravida congue non non neque. Praesent a cursus orci. Donec porta tellus a mauris semper, a maximus urna dapibus.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec diam sapien, sodales et risus ut, consequat pulvinar ipsum. Suspendisse sagittis arcu augue, sed bibendum arcu mattis vel. Morbi congue sit amet lacus vel tincidunt. Integer at molestie magna. Duis massa ex, elementum vitae mauris vitae, placerat consectetur orci. Donec vel velit vitae nulla gravida congue non non neque. Praesent a cursus orci. Donec porta tellus a mauris semper, a maximus urna dapibus.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec diam sapien, sodales et risus ut, consequat pulvinar ipsum. Suspendisse sagittis arcu augue, sed bibendum arcu mattis vel. Morbi congue sit amet lacus vel tincidunt. Integer at molestie magna. Duis massa ex, elementum vitae mauris vitae, placerat consectetur orci. Donec vel velit vitae nulla gravida congue non non neque. Praesent a cursus orci. Donec porta tellus a mauris semper, a maximus urna dapibus."),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.width20 * 2.5,
              right: Dimensions.width20 * 2.5,
              bottom: Dimensions.height10,
              top: Dimensions.height10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppIcon(
                  icon: Icons.remove,
                  iconSize: Dimensions.iconSize24,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                ),
                BigText(
                  text: "   \$12.88 X 0   ",
                  color: AppColors.mainBlackColor,
                  fontSize: Dimensions.font26,
                ),
                AppIcon(
                  icon: Icons.add,
                  iconSize: Dimensions.iconSize24,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                )
              ],
            ),
          ),
          Container(
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
                      right: Dimensions.width20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                  ),
                  child: Icon(Icons.favorite, color: AppColors.mainColor,),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      bottom: Dimensions.height20,
                      left: Dimensions.width20,
                      right: Dimensions.width20),
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                  ),
                  child:
                      BigText(text: '\$10 | Add to cart', color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
