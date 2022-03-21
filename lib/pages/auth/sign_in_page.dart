import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/base/custom_loader.dart';
import 'package:fooddelivery/base/show_custom_snackbar.dart';
import 'package:fooddelivery/controllers/auth_controller.dart';
import 'package:fooddelivery/pages/auth/sign_up_page.dart';
import 'package:fooddelivery/routes/route_helper.dart';
import 'package:fooddelivery/utils/colors.dart';
import 'package:fooddelivery/utils/dimensions.dart';
import 'package:fooddelivery/widgets/app_text_field.dart';
import 'package:fooddelivery/widgets/big_text.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var phoneController = TextEditingController();
    var passwordController = TextEditingController();

    void _login(AuthController authController){

      String phone = phoneController.text.trim();
      String password = passwordController.text.trim();

      if(phone.isEmpty){
        showCustomSnackBar("Type in your email address",title: "Email address");
      }else if(password.isEmpty){
        showCustomSnackBar("Type in your password",title: "Password");
      }else if(password.length < 6){
        showCustomSnackBar("Password can not be less than six characters",title: "Password");
      }else{

        authController.login(phone,password).then((status){
          if(status.isSuccess){
            Get.toNamed(RouteHelper.getInitial());
          }else{
            showCustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(builder: (authController){
        return !authController.isLoading
          ? SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: Dimensions.screenHeight*0.03,),
              Container(
                height: Dimensions.screenHeight*0.25,
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 80,
                    backgroundImage: AssetImage(
                        "assets/image/logo part 1.png"
                    ),
                  ),
                ),
              ),
              Container(
                width: double.maxFinite,
                margin: EdgeInsets.only(left: Dimensions.width20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello",
                      style: TextStyle(
                          fontSize: Dimensions.font24*3 + Dimensions.font24/2,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      "Sign into your account",
                      style: TextStyle(
                          fontSize: Dimensions.font24,
                          color: Colors.grey[500]
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Dimensions.height20,),
              //Email
              AppTextField(
                  textController: phoneController,
                  hintText: "Phone",
                  icon: Icons.phone
              ),
              SizedBox(height: Dimensions.height15,),
              //Password
              AppTextField(
                textController: passwordController,
                hintText: "Password",
                icon: Icons.password_sharp,
                isObscure: true,
              ),
              SizedBox(height: Dimensions.height30,),
              Row(
                children: [
                  Expanded(child: Container()),
                  RichText(
                      text: TextSpan(
                          text: "Sing into your account",
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: Dimensions.font24
                          )
                      )
                  ),
                  SizedBox(width: Dimensions.width20,)
                ],
              ),
              SizedBox(height: Dimensions.screenHeight*0.05,),
              GestureDetector(
                onTap: (){
                  _login(authController);
                },
                child: Container(
                  width: Dimensions.screenWidth/2,
                  height: Dimensions.screenHeight/13,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius30),
                      color: AppColors.mainColor
                  ),
                  child: Center(
                    child: BigText(
                      text: "Sign up",
                      size: Dimensions.font24 + Dimensions.font24/2,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: Dimensions.screenHeight*0.05,),
              RichText(
                text: TextSpan(
                  text: "Don\'t have an account?",
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: Dimensions.font24
                  ),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()..onTap=()=>Get.toNamed(RouteHelper.getSignUpPage()),
                      text: " Create",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.mainBlackColor,
                          fontSize: Dimensions.font24
                      ),
                    )
                  ],
                ),
              ),
              // SizedBox(height: Dimensions.height10,),
            ],
          ),
        )
          : CustomLoader();
      }),
    );
  }
}
