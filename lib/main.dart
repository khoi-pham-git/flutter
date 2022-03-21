import 'package:flutter/material.dart';
import 'package:fooddelivery/controllers/popular_product_controller.dart';
import 'package:fooddelivery/controllers/recommended_product_controller.dart';
import 'package:fooddelivery/pages/auth/sign_in_page.dart';
import 'package:fooddelivery/pages/auth/sign_up_page.dart';
import 'package:fooddelivery/routes/route_helper.dart';
import 'package:get/get.dart';
import 'controllers/cart_controller.dart';
import 'helper/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();
    return GetBuilder<PopularProductController>(builder: (_){
      return GetBuilder<RecommendedProductController>(builder: (_){
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Food Delivery',
          //home: SignInPage(),
          // home: SplashScreen(),
          initialRoute: RouteHelper.getSplashScreen(),
          getPages: RouteHelper.routes,
        );
      });
    });
  }
}

