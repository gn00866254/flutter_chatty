import 'package:chatty/pages/frame/welcome/state.dart';
import 'package:get/get.dart';

import '../../../common/routes/names.dart';

class WelcomeController extends GetxController {
  // construct
  WelcomeController();
  // 不変なため、ここに記述する。
  final title = "Chatty .";
  final state = WelcomeState();

  // Getx既存のonReady関数
  @override
  void onReady(){
    super.onReady();
    Future.delayed(
        const Duration(seconds: 3), ()=>Get.offAllNamed(AppRoutes.Message));
  }
}