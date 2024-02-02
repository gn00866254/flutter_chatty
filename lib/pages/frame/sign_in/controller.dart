import 'dart:convert';

import 'package:chatty/common/apis/apis.dart';
import 'package:chatty/common/entities/entities.dart';
import 'package:chatty/common/store/store.dart';
import 'package:chatty/common/widgets/toast.dart';
import 'package:chatty/pages/frame/sign_in/index.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../common/routes/routes.dart';

class SignInController extends GetxController {
  SignInController();
  final state = SignInState();

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['openid']);

  void handleSignIn(String type) async {
    //1:email 2:google 3:facebook 4:apple 5:phone
    try {
      if (type == 'phone number') {
        if (kDebugMode) {
          print('...you are loggin in with phone number...');
        }
      } else if (type == 'google') {
        var user = await _googleSignIn.signIn();
        if (user != null) {
          print(user);
          String? displayName = user.displayName;
          String email = user.email;
          String id = user.id;
          String photoUrl = user.photoUrl ?? 'assets/icons/google.png';
          LoginRequestEntity loginPanelListRequestEntity = LoginRequestEntity();
          loginPanelListRequestEntity.avatar = photoUrl;
          loginPanelListRequestEntity.name = displayName;
          loginPanelListRequestEntity.email = email;
          loginPanelListRequestEntity.open_id = id;
          loginPanelListRequestEntity.type = 2;
          print(jsonEncode(loginPanelListRequestEntity));
          await asyncPostAllData(loginPanelListRequestEntity);
        }
      } else {
        if (kDebugMode) {
          print('...login type not sure...');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('...error with login $e');
      }
    }
  }
  // バックエンドへのAPI
  asyncPostAllData(LoginRequestEntity loginRequestEntity) async {
    // HttpUtil().get(path)
    // UserStore.to.setIsLogin=true;
    // ロード
    EasyLoading.show(
      indicator: const CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear, dismissOnTap: true
    );
    var result = await UserAPI.Login(params: loginRequestEntity);
    if (result.code==0){
      await UserStore.to.saveProfile(result.data!);
      EasyLoading.dismiss();
    }else{
      EasyLoading.dismiss();
      toastInfo(msg: "Internet error");
    }
    Get.offAllNamed(AppRoutes.Message);
  }

}