import 'package:chatty/common/values/colors.dart';
import 'package:chatty/pages/frame/sign_in/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({Key? key}) : super(key: key);

  // ロゴ
  Widget _buildLogo(){
    return Container(
      margin: EdgeInsets.only(top: 100.h, bottom: 80.w),
      child: Text(
        "Chatty .",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.primaryText,
          fontWeight: FontWeight.bold,
          fontSize: 34.sp
        ),
      ),
    );
  }
  // サードパーティログインボタン
  Widget _buildThirdPartyLogin(String loginType, String logo){
    return GestureDetector(
      child: Container(
        width: 295.w,
        height: 44.h,
        padding: EdgeInsets.all(12.h),
        margin: EdgeInsets.only(bottom: 15.h),
        decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0,1)
            )
          ]
        ),
        child: Row(
          mainAxisAlignment: logo == "" ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            logo == "" ? Container() : Container(
              padding: EdgeInsets.only(left: 40.w, right: 30.w),
              child: Image.asset("assets/icons/$logo.png"),
            ),
            Container(
              child: Text(
                "Sign in with $loginType",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontWeight: FontWeight.normal,
                  fontSize: 14.sp
                ),
              ),
            )
          ],
        ),
      ),
      onTap: (){
        // Googleのみ
        controller.handleSignIn("google");
      },
    );
  }
  // or ウィジェット
  Widget _buildOrWidget(){
    return Container(
      margin: EdgeInsets.only(top:20.h, bottom: 35.h),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              indent: 50,
              height: 2.h,
              color: AppColors.primarySecondaryElementText,
            ),
          ),
          const Text(" or "),
          Expanded(
            child: Divider(
              endIndent: 50,
              height: 2.h,
              color: AppColors.primarySecondaryElementText,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignUpWidget(){
    return GestureDetector(
      child: Column(
        children: [
          Text(
            "Already have an account",
            style: TextStyle(
              color: AppColors.primaryText,
              fontWeight: FontWeight.normal,
              fontSize: 12.sp,
            ),
          ),
          GestureDetector(
            child: Text(
              "Sign up here",
              style: TextStyle(
                color: AppColors.primaryElement,
                fontWeight: FontWeight.normal,
                fontSize: 12.sp,
              ),
            ),
          )
        ],
      ),
      onTap: (){},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primarySecondaryBackground,
      body: Center(
        child: Column(
          children: [
            _buildLogo(),
            _buildThirdPartyLogin("Google", "google"),
            _buildThirdPartyLogin("Facebook", "facebook"),
            _buildThirdPartyLogin("Apple", "apple"),
            _buildOrWidget(),
            _buildThirdPartyLogin("Phone number", ""),
            SizedBox(height: 40.h,),
            _buildSignUpWidget()
          ],
        ),
      ),
    );
  }
}
