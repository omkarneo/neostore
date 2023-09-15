import 'package:shared_preferences/shared_preferences.dart';

class LocalPreference {
  static SharedPreferences? _preferences;

  static const _keyprofile = "Profile";
  //----------------------------------
  static Future clearAllPreference() => _preferences!.clear();

  //----------------------------------
  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();
  //--------------------------------------------------------------
  static Future setProfile(String? val) async =>
      await _preferences!.setString(_keyprofile, val!);
  static String? getProfile() => _preferences?.getString(_keyprofile);
  static Future<bool>? deleteProfile() => _preferences?.remove(_keyprofile);

  //--------------------------------------------------------------
}
