import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsManager {
  static late SharedPreferences prefs;

  static Future<void> initializeSharedPrefs() async {
     prefs = await SharedPreferences.getInstance();
  }

  static void setUser(String user) {
    prefs.setString("userId", user);
  }

  static String getUser() {
    return prefs.getString("userId") ?? "none";
  }
  
  static bool didSeeStartScreen() {
    return prefs.getBool("startScreen") ?? false;
  }

  static void setStartScreen() {
    prefs.setBool("startScreen", true);
  }
  
}
