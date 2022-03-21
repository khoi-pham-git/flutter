import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fooddelivery/controllers/popular_product_controller.dart';
import 'package:fooddelivery/controllers/recommended_product_controller.dart';
import 'package:fooddelivery/routes/route_helper.dart';
import 'package:fooddelivery/utils/dimensions.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  /*
    AnyClass(){
      newObject(){
      return ...;
      }
    }

    var x = AnyClass();
    x = x.newObject();
    hay viet theo..
    var x = AnyClass()..newObject();
   */
  late Animation<double> animaton;
  late AnimationController controller;

  Future<void> _loadResource() async{
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadResource();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 2
      )
    )..forward();

    animaton = CurvedAnimation(
      parent: controller,
      curve: Curves.linear
    );
    
    Timer(
      const Duration(seconds: 3),
      ()=> Get.toNamed(RouteHelper.getInitial())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animaton,
            child: Center(
              child: Image.asset(
                "assets/image/logo part 1.png",
                width: Dimensions.splashImg,
              ),
            ),
          ),
          Center(
            child: Image.asset(
              "assets/image/logo part 2.png",
              width: Dimensions.splashImg,
            ),
          ),
        ],
      ),
    );
  }
}
