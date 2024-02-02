import 'package:chatty/pages/message/controller.dart';
import 'package:get/get.dart';

class MessageBinding implements Bindings{
  // use this to binding
  // what is binding? => have value in the memory.
  // when the app work, this binding would get called from routing.
  // and WelcomeController would get called

  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<MessageController>(() => MessageController());
  }
}