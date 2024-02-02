import 'package:chatty/pages/profile/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/values/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  AppBar _buildAppbar(){
    return AppBar(
      title: Text(
        "Profile",
        style: TextStyle(
            color: AppColors.primaryText,
            fontSize: 16.sp,
            fontWeight: FontWeight.normal
        ),
      ),
    );
  }

  Widget _buildProfilePhoto(){
    return Stack(
      alignment: Alignment.center,
      children: [
        // 写真
        Container(
          width: 120.w,
          height: 120.w,
          decoration: BoxDecoration(
            color: AppColors.primarySecondaryBackground,
            borderRadius: BorderRadius.all(Radius.circular(60.w)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 1)
              )
            ]
          ),
          child:  Image(
            width: 120.w,
            height: 120.h,
            fit: BoxFit.cover,
            image: AssetImage(
              "assets/images/account_header.png"
            ),
          ),
        ),
        // 編集ボタン
        Positioned(
            bottom: 0.w,
            right: 0.w,
            height: 35.w,
            child: GestureDetector(
              child: Container(
                height: 35.w,
                width: 35.w,
                padding: EdgeInsets.all(7.w),
                decoration: BoxDecoration(
                  color: AppColors.primaryElement,
                  borderRadius: BorderRadius.all(Radius.circular(40.w))
                ),
                child: Image.asset("assets/icons/edit.png"),
              ),
            )
        )
      ],
    );
  }
  // 完成したボタン、まだ機能しない
  Widget _buildCompleteBtn(){
    return GestureDetector(
      child: Container(
        width: 295.w,
        height: 44.w,
        margin: EdgeInsets.only(top: 60.h, bottom: 30.h),
        decoration: BoxDecoration(
            color: AppColors.primaryElement,
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 1)
              )
            ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Complete",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.primaryElementText,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal
              ),
            ),
          ],
        ),
      ),
    );
  }
  // ログアウトボタン
  Widget _buildLogoutBtn(){
    return GestureDetector(
      child: Container(
        width: 295.w,
        height: 44.w,
        margin: EdgeInsets.only(top: 0.h, bottom: 30.h),
        decoration: BoxDecoration(
          color: AppColors.primarySecondaryElementText,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 1)
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Logout",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.primaryElementText,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal
              ),
            ),
          ],
        ),
      ),
      onTap: (){
        Get.defaultDialog(
          title: "Are you sure to log out ?",
          content: Container(),
          onConfirm: (){
            controller.goLogout();
          },
          onCancel: (){},
          textConfirm: "Confirm",
          textCancel: "Cancel"
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: SafeArea(
          child: CustomScrollView(
            slivers: [
              // if I want to put col or container to here directly
              // what i need is use this slivertoboxAdapter
              SliverToBoxAdapter(
                child: Container(
                  child: Column(
                    children: [
                      _buildProfilePhoto(),
                      _buildCompleteBtn(),
                      _buildLogoutBtn(),
                    ],
                  ),
                ),
              )
            ],
          )
      ),
    );
  }
}
