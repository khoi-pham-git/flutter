import 'package:flutter/material.dart';
import 'package:fooddelivery/base/custom_loader.dart';
import 'package:fooddelivery/base/show_custom_snackbar.dart';
import 'package:fooddelivery/controllers/auth_controller.dart';
import 'package:fooddelivery/controllers/cart_controller.dart';
import 'package:fooddelivery/controllers/user_controller.dart';
import 'package:fooddelivery/routes/route_helper.dart';
import 'package:fooddelivery/utils/colors.dart';
import 'package:fooddelivery/utils/dimensions.dart';
import 'package:fooddelivery/widgets/account_widget.dart';
import 'package:fooddelivery/widgets/app_icon.dart';
import 'package:fooddelivery/widgets/big_text.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if(_userLoggedIn){
      Get.find<UserController>().getUserInfo();
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.mainColor,
        automaticallyImplyLeading: false,
        title: BigText(
          text: "Profile",
          size: 24,
          color: Colors.white,
        ),
      ),
      body: GetBuilder<UserController>(builder: (userController){
        return _userLoggedIn
          ? (
            userController.isLoading
            ? Container(
              width: double.maxFinite,
              margin: EdgeInsets.only(top: Dimensions.height20),
              child: Column(
                children: [
                  //Profile icon
                  AppIcon(
                    icon: Icons.person,
                    backgroundColor: AppColors.mainColor,
                    iconColor: Colors.white,
                    iconSize: Dimensions.height15*5,
                    size: Dimensions.height15*10,
                  ),
                  SizedBox(height: Dimensions.height30,),
                  Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            //Name
                            AccountWidget(
                                appIcon: AppIcon(
                                  icon: Icons.person,
                                  backgroundColor: AppColors.mainColor,
                                  iconColor: Colors.white,
                                  iconSize: Dimensions.height10*5/2,
                                  size: Dimensions.height10*5,
                                ),
                                bigText: BigText(text: userController.userModel.name)
                            ),
                            SizedBox(height: Dimensions.height20,),
                            //Phone
                            AccountWidget(
                                appIcon: AppIcon(
                                  icon: Icons.phone,
                                  backgroundColor: AppColors.yellowColor,
                                  iconColor: Colors.white,
                                  iconSize: Dimensions.height10*5/2,
                                  size: Dimensions.height10*5,
                                ),
                                bigText: BigText(text: userController.userModel.phone)
                            ),
                            SizedBox(height: Dimensions.height20,),
                            //Email
                            AccountWidget(
                                appIcon: AppIcon(
                                  icon: Icons.email,
                                  backgroundColor: AppColors.yellowColor,
                                  iconColor: Colors.white,
                                  iconSize: Dimensions.height10*5/2,
                                  size: Dimensions.height10*5,
                                ),
                                bigText: BigText(text: userController.userModel.email)
                            ),
                            SizedBox(height: Dimensions.height20,),
                            //Address
                            AccountWidget(
                                appIcon: AppIcon(
                                  icon: Icons.location_on,
                                  backgroundColor: AppColors.yellowColor,
                                  iconColor: Colors.white,
                                  iconSize: Dimensions.height10*5/2,
                                  size: Dimensions.height10*5,
                                ),
                                bigText: BigText(text: "Fill in your address")
                            ),
                            SizedBox(height: Dimensions.height20,),
                            //Message
                            AccountWidget(
                                appIcon: AppIcon(
                                  icon: Icons.message_outlined,
                                  backgroundColor: Colors.redAccent,
                                  iconColor: Colors.white,
                                  iconSize: Dimensions.height10*5/2,
                                  size: Dimensions.height10*5,
                                ),
                                bigText: BigText(text: "HQ Group")
                            ),
                            SizedBox(height: Dimensions.height20,),
                            //Name
                            GestureDetector(
                              onTap: (){
                                if(Get.find<AuthController>().userLoggedIn()){
                                  Get.find<AuthController>().clearSharedData();
                                  Get.find<CartController>().clear();
                                  Get.find<CartController>().clearCartHistory();
                                  Get.offNamed(RouteHelper.getSignInPage());
                                }else{
                                  showCustomSnackBar("You logged out",title: "Error");
                                }
                              },
                              child: AccountWidget(
                                  appIcon: AppIcon(
                                    icon: Icons.logout_outlined,
                                    backgroundColor: Colors.redAccent,
                                    iconColor: Colors.white,
                                    iconSize: Dimensions.height10*5/2,
                                    size: Dimensions.height10*5,
                                  ),
                                  bigText: BigText(text: "Logout")
                              ),
                            ),
                            SizedBox(height: Dimensions.height20,),
                          ],
                        ),
                      )
                  )
                ],
              ),
            )
            : CustomLoader()
          )
          : Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.maxFinite,
                  height: Dimensions.height20*10,
                  margin: EdgeInsets.only(
                      left: Dimensions.width20,
                      right: Dimensions.width20
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "assets/image/signintocontinue.png"
                          )
                      )
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Get.toNamed(RouteHelper.getSignInPage());
                  },
                  child: Container(
                    width: double.maxFinite,
                    height: Dimensions.height20*5,
                    margin: EdgeInsets.only(
                        left: Dimensions.width20,
                        right: Dimensions.width20
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                    ),
                    child: Center(
                      child: BigText(
                        text: "Sign in",
                        color: Colors.white,
                        size: Dimensions.font26,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
