import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  Future<SharedPreferences> pref = SharedPreferences.getInstance();
  void setinsharedString(key, value) async {
    SharedPreferences pref2 = await pref;
    pref2.setString(key, value);
  }

  void setinsharedbool(key, value) async {
    SharedPreferences pref2 = await pref;
    pref2.setBool(key, value);
  }

  Future<dynamic> getfromshared(key) async {
    SharedPreferences pref2 = await pref;
    return pref2.get(key);
  }
}
