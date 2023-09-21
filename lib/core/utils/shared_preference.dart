import 'package:shared_preferences/shared_preferences.dart';

class LocalPreference {
  static SharedPreferences? _preferences;

  static const _keyprofile = "Profile";
  static const _keyaddress = "address";
  static const _keytoken = "Token";
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
  static Future setToken(String? val) async =>
      await _preferences!.setString(_keytoken, val!);
  static String? getToken() => _preferences?.getString(_keytoken);
  static Future<bool>? deleteToken() => _preferences?.remove(_keytoken);

  //--------------------------------------------------------------
  //--------------------------------------------------------------
  static Future setaddress(String? val) async =>
      await _preferences!.setString(_keyaddress, val!);
  static String? getaddress() => _preferences?.getString(_keyaddress);
  static Future<bool>? deleteaddress() => _preferences?.remove(_keyaddress);

  //--------------------------------------------------------------
}
