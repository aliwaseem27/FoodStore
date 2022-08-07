import 'package:flutter/material.dart';
import 'package:food_store/pages/home/food_page_body.dart';
import 'package:food_store/utils/colors.dart';
import 'package:food_store/utils/dimensions.dart';
import 'package:food_store/widgets/big_text.dart';
import 'package:food_store/widgets/small_text.dart';

class MainFoodPage extends StatelessWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(

            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height45, bottom: Dimensions.height15),
              padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: "Iraq", color: AppColors.mainColor,),
                      Row(
                        children: [
                          SmallText(text: "Karbala", color: Colors.black45,),
                          Icon(Icons.arrow_drop_down_rounded),
                        ],
                      ),
                    ],
                  ),
                  Center(child: Container(
                    width: Dimensions.height45,
                    height: Dimensions.width45,
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                    ),
                    child: Icon(Icons.search, color: Colors.white,),
                  ),),
                ],
              ),
            ),
          ),
          Expanded(child: SingleChildScrollView(
            child: FoodPageBody(),
          ),),
        ],
      ),
    );
  }
}
