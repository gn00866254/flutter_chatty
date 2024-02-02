import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
// it's also a kind of controller
// controller every time you go to a new page, that instance get initialized.
// and if leave page, instance gets removed.
// get X service while this gets initialized as app  bootstrap, installed, restarted.
// we want it to be in the memory all the time.
class StorageService extends GetxService {
  // created and it returns an instance of this class itself.
  // if we want to access this properties, just use StorageService to
  static StorageService get to => Get.find();
  // use SharedPreferences to store data.
  late final SharedPreferences _prefs;

  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  Future<bool> setList(String key, List<String> value) async {
    return await _prefs.setStringList(key, value);
  }

  String getString(String key) {
    return _prefs.getString(key) ?? '';
  }

  bool getBool(String key) {
    return _prefs.getBool(key) ?? false;
  }

  List<String> getList(String key) {
    return _prefs.getStringList(key) ?? [];
  }

  Future<bool> remove(String key) async {
    return await _prefs.remove(key);
  }
}
