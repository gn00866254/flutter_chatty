import 'package:chatty/pages/profile/index.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../common/store/user.dart';

class ProfileController extends GetxController {
  // construct
  ProfileController();
  // 不変なため、ここに記述する。
  final title = "Chatty .";
  final state = ProfileState();

  // ログアウト
  Future<void> goLogout() async {
    await GoogleSignIn().signOut();
    await UserStore.to.onLogout();
  }

}