
import 'package:flutter/material.dart';
import 'package:chatty/common/middlewares/middlewares.dart';

import 'package:get/get.dart';

import '../../pages/contact/index.dart';
import '../../pages/frame/sign_in/index.dart';
import '../../pages/frame/welcome/index.dart';
import '../../pages/message/index.dart';
import '../../pages/message/chat/index.dart';
import '../../pages/profile/index.dart';
import 'routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.INITIAL;
  static List<String> history = [];

  static final List<GetPage> routes = [
    // 免登陆
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => const WelcomePage(),
      binding: WelcomeBinding(),
    ),

    GetPage(
      name: AppRoutes.SIGN_IN,
      page: () => const SignInPage(),
      binding: SignInBinding(),
    ),

    // 首页 */
    GetPage(name: AppRoutes.Contact,
        page: () => const ContactPage(),
        binding: ContactBinding()
    ),
     //消息
    GetPage(
      name: AppRoutes.Message,
      page: () => const MessagePage(),
      binding: MessageBinding(),middlewares: [
       RouteAuthMiddleware(priority: 1),
     ],),
    //我的
    GetPage(name: AppRoutes.Profile, page: () => const ProfilePage(),
        binding: ProfileBinding()),

    //聊天详情
    GetPage(name: AppRoutes.Chat,
        page: () => const ChatPage(),
        binding: ChatBinding()),
  ];






}
