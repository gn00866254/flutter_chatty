import 'package:chatty/pages/frame/sign_in/controller.dart';
import 'package:get/get.dart';

class SignInBinding implements Bindings{
  // use this to binding
  // what is binding? => have value in the memory.
  // when the app work, this binding would get called from routing.
  // and WelcomeController would get called

  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<SignInController>(() => SignInController());
  }
}