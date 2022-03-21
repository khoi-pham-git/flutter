import 'package:get/get.dart';
class Dimensions{
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;
  // 938.6666666666666 / 320 = 2.9333
  // 938.6666666666666 / 220 = 4.267
  // 938.6666666666666 / 130 = 7.22
  static double pageView = screenHeight/2.9333;
  static double pageViewContainer = screenHeight/4.2667;
  static double pageViewTextContainer = screenHeight/7.2205;

//  dynamic height and margin
  static double height10 = screenHeight/93.8667;
  static double height15 = screenHeight/62.57778;
  static double height20 = screenHeight/46.9333;
  static double height30 = screenHeight/31.28889;
  static double height45 = screenHeight/20.85926;
  static double height50 = screenHeight/18.77333;
  static double height70 = screenHeight/13.40952;
//  dynamic width padding and margin
  static double width10 = screenHeight/93.8667;
  static double width15 = screenHeight/62.57778;
  static double width20 = screenHeight/46.9333;
  static double width30 = screenHeight/31.28889;
  static double width40 = screenHeight/23.46667;
  static double width45 = screenHeight/20.85926;

  //font size
  static double font16 = screenHeight/58.66667;
  static double font24 = screenHeight/39.11111;
  static double font26 = screenHeight/36.10256;
  //Radius
  static double radius20 = screenHeight/46.9333;
  static double radius15 = screenHeight/62.57778;
  static double radius30 = screenHeight/31.28889;

//  Icon Size
  static double iconsize24 = screenHeight/39.11111;
  static double iconsize16 = screenHeight/58.66667;

//  List view size
  static double listViewImgSize = screenWidth/3.61;
  static double listViewTextContSize = screenWidth/4.366;


//  popular food

  static double popularFoodImgSize = screenHeight/2.682;

//  bottom height
  static double bottomHeightBar = screenHeight/7.8222;

//  splash screen dimensions
  static double splashImg = screenHeight/3.6;
}