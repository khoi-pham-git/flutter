import 'package:flutter/cupertino.dart';
import 'package:fooddelivery/pages/auth/sign_in_page.dart';
import 'package:fooddelivery/pages/auth/sign_up_page.dart';
import 'package:fooddelivery/pages/cart/cart_page.dart';
import 'package:fooddelivery/pages/food/popular_food_detail.dart';
import 'package:fooddelivery/pages/food/recommended_food_detail.dart';
import 'package:fooddelivery/pages/home/home_page.dart';
import 'package:fooddelivery/pages/home/main_food_page.dart';
import 'package:fooddelivery/pages/splash/splash_screen.dart';
import 'package:get/get.dart';
class RouteHelper{
  static const String splashScreen = "/splash-screen";
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = '/cart-page';
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';

  static String getSplashScreen ()=> '$splashScreen';
  static String getInitial()=> '$initial';
  static String getPopularFood(int pageId,String page)=> '$popularFood?pageId=$pageId&page=$page';
  static String getRecommendedFood(int pageId,String page)=> '$recommendedFood?pageId=$pageId&page=$page';
  static String getCartPage()=>'$cartPage';
  static String getSignInPage()=>'$signIn';
  static String getSignUpPage()=>'$signUp';

  static List<GetPage> routes = [
    GetPage(name: splashScreen, page: ()=>SplashScreen()),
    GetPage(name: initial, page: ()=> HomePage()),
    GetPage(name: signIn, page: ()=> SignInPage(),transition: Transition.fadeIn),
    GetPage(name: signUp, page: ()=> SignUpPage(),transition: Transition.fadeIn),
    GetPage(name: popularFood, page: (){
      var pageId = Get.parameters['pageId'];
      var page = Get.parameters["page"];
      return PopularFoodDetail(pageId: int.parse(pageId!),page: page!);
    },
      transition: Transition.circularReveal
    ),
    GetPage(name: recommendedFood, page: (){
      var pageId = Get.parameters['pageId'];
      var page = Get.parameters["page"];
      return RecommenedFoodDetail(pageId: int.parse(pageId!),page: page!);
    },
        transition: Transition.fadeIn
    ),
    GetPage(name: cartPage, page: (){
      return CartPage();
    },
      transition: Transition.fadeIn
    ),
  ];
}