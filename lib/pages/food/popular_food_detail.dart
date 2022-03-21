import 'package:flutter/material.dart';
import 'package:fooddelivery/controllers/cart_controller.dart';
import 'package:fooddelivery/controllers/popular_product_controller.dart';
import 'package:fooddelivery/data/repository/popular_product_repo.dart';
import 'package:fooddelivery/pages/cart/cart_page.dart';
import 'package:fooddelivery/pages/home/main_food_page.dart';
import 'package:fooddelivery/routes/route_helper.dart';
import 'package:fooddelivery/utils/app_constants.dart';
import 'package:fooddelivery/utils/colors.dart';
import 'package:fooddelivery/utils/dimensions.dart';
import 'package:fooddelivery/widgets/app_column.dart';
import 'package:fooddelivery/widgets/app_icon.dart';
import 'package:fooddelivery/widgets/big_text.dart';
import 'package:fooddelivery/widgets/exandable_text_widget.dart';
import 'package:get/get.dart';

class PopularFoodDetail extends StatelessWidget {
  int pageId;
  final String page;
  PopularFoodDetail({Key? key, required this.pageId, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>().initProduct(product,Get.find<CartController>());
    // print("page is id " + pageId.toString());
    // print("product name id " + product.name.toString());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImgSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                    image: NetworkImage(
                        AppConstants.BASE_URL + AppConstants.UPLOAD_URL + product.img!
                    )
                )
              ),
            )
          ),
          //icon widgets
          Positioned(
            top: Dimensions.height70,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    if(page == "cartpage"){
                      Get.toNamed(RouteHelper.getCartPage());
                    }else{
                      Get.toNamed(RouteHelper.getInitial());
                    }
                  },
                  child: AppIcon(icon: Icons.arrow_back_ios)
                ),
                GetBuilder<PopularProductController>(builder: (controller){
                  return GestureDetector(
                    onTap: (){
                      if(controller.totalItems >= 1)
                        Get.toNamed(RouteHelper.getCartPage());
                    },
                    child: Stack(
                      children: [
                        AppIcon(icon: Icons.shopping_cart_outlined,),
                        controller.totalItems >= 1 ?
                        Positioned(
                          right:0,
                          top:0,
                          child: AppIcon(icon: Icons.circle, size: 20, iconColor: Colors.transparent,backgroundColor: AppColors.mainColor,)
                        ) :
                        Container(),
                        controller.totalItems >= 1 ?
                        Positioned(
                            right:5,
                            top:2,
                            child: BigText(
                              text: controller.totalItems.toString(),
                              size: 14,
                              color: Colors.white,
                            ),
                        ) :
                        Container(),
                      ],
                    ),
                  );
                }),
              ],
            )
          ),
          //introduction of food
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularFoodImgSize - 20,
            child: Container(
              padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,top: Dimensions.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius20),
                  topLeft: Radius.circular(Dimensions.radius20),
                ),
                color: Colors.white
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(
                    text: "${product.name!}",
                    rate: 5,
                    comment: 9696,
                  ),
                  SizedBox(height: Dimensions.height20,),
                  BigText(text: "Introduce"),
                  SizedBox(height: Dimensions.height20,),
                  Expanded(
                      child: SingleChildScrollView(
                        child: ExandableTextWidget(
                            text: "${product.description!}"
                        ),
                      ),
                  ),
                ],
              ),
            )
          ),
        //  expandable text widget
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (popularProduct){
        return Container(
          height: Dimensions.bottomHeightBar,
          padding: EdgeInsets.only(top: Dimensions.height30,bottom: Dimensions.height30,left: Dimensions.width20,right: Dimensions.width20),
          decoration: BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20*2),
                topRight: Radius.circular(Dimensions.radius20*2),
              )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(top: Dimensions.height15,bottom: Dimensions.height15,left: Dimensions.width20,right: Dimensions.width20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        popularProduct.setQuantity(false);
                      },
                      child: Icon(
                        Icons.remove,
                        color: AppColors.signColor,
                      ),
                    ),
                    SizedBox(width: Dimensions.width10/2,),
                    BigText(text: popularProduct.inCartItems.toString()),
                    SizedBox(width: Dimensions.width10/2,),
                    GestureDetector(
                      onTap: (){
                        popularProduct.setQuantity(true);
                      },
                      child: Icon(
                        Icons.add,
                        color: AppColors.signColor,
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  popularProduct.addItem(product);
                },
                child: Container(
                  padding: EdgeInsets.only(top: Dimensions.height15,bottom: Dimensions.height15,left: Dimensions.width20,right: Dimensions.width20),
                  child: BigText(text: "\$${product.price!} | Add to cart", color: Colors.white,),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: AppColors.mainColor
                  ),
                ),
              ),
            ],
          ),
        );
      },),
    );
  }
}
