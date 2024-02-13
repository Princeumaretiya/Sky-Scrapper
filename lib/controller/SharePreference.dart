import 'package:shared_preferences/shared_preferences.dart';

const listSharedPreference = "list shared preferences";
class  SharedPref {
  static Future setListString(
      { required List<String> token}) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(listSharedPreference, token);
  }

  static Future<List<String>> getListString() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(listSharedPreference) ?? [];
  }
}