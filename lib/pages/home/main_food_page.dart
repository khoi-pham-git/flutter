import 'package:flutter/material.dart';
import 'package:fooddelivery/controllers/popular_product_controller.dart';
import 'package:fooddelivery/controllers/recommended_product_controller.dart';
import 'package:fooddelivery/utils/colors.dart';
import 'package:fooddelivery/utils/dimensions.dart';
import 'package:fooddelivery/widgets/big_text.dart';
import 'package:fooddelivery/widgets/small_text.dart';
import 'package:get/get.dart';
import 'food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  _MainFoodPageState createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  Future<void> _loadResource() async{
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }
  @override
  Widget build(BuildContext context) {
    print("current height is " + MediaQuery.of(context).size.height.toString());
    return RefreshIndicator(
        child: Column(
          children: [
            //showing the header
            Container(

              child: Container(
                margin: EdgeInsets.only(top: Dimensions.height70,bottom: Dimensions.height15),
                padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        BigText(text: "Việt Nam",color: AppColors.mainColor),
                        Row(
                          children: [
                            SmallText(text: "Hà Nội", color: Colors.black54,),
                            Icon(Icons.arrow_drop_down_rounded)
                          ],
                        ),
                      ],
                    ),
                    Center(
                      child: Container(
                        width: Dimensions.width45,
                        height: Dimensions.height45,
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: Dimensions.iconsize24,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius15),
                          color: AppColors.mainColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            //showing the body
            Expanded(
                child: SingleChildScrollView(
                  child: FoodPageBody(),
                )
            ),
          ],
        ),
        onRefresh: _loadResource
    );
  }
}
