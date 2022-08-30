import 'package:inventory_management/Utility/CONSTANT.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  String authorizationToken = "";
  String fcmToken = "";
  SharedPreferenceHelper._privateConstructor();
  static final SharedPreferenceHelper _instance =
      SharedPreferenceHelper._privateConstructor();

  factory SharedPreferenceHelper() {
    return _instance;
  }

  void setPref(String Prefname, String value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(Prefname, value);
    // print(await getAuthToken() + "Token added to shared preferences");
  }

  Future<String> getPref(String Prefname) async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    return sharedPreference.getString(Prefname);
  }

  //  void setAuthToken(String authToken) async {
  //    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //    sharedPreferences.setString(sharedPrefID, authToken);
  //    // print(await getAuthToken() + "Token added to shared preferences");
  //  }
  //
  // static Future<String> getAuthToken() async {
  //    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
  //    return sharedPreference.getString(sharedPrefID);
  //  }

  // void logout() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   sharedPreferences.remove(sharedPrefID);
  // }

  // String getSessionId() {
  //   return authorizationToken;
  // }
  //
  // void setSessionId(String sessionId) {
  //   authorizationToken = sessionId;
  // }
}
