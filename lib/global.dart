import 'package:chatty/common/services/services.dart';
import 'package:chatty/common/store/user.dart';
import 'package:chatty/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Global {
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
    );
    // what difference? "put" can inject controller
    // and that controller would be always ready to be used.
    // it's always in memory.
    // lazyPut: we get instance only when we want to use.
    // Instance would be created too, but not in the memory.
    // putAsync: used to load data that happens with future.
    await Get.putAsync<StorageService>(() => StorageService().init());
    Get.put<UserStore>(UserStore());
  }
}