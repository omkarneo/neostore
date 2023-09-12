import 'package:shared_preferences/shared_preferences.dart';

class LocalPreference {
  static SharedPreferences? _preferences;

  static const _keytoken = 'Token';
  static const _keypropic = 'ProfilePic';
  static const _keyname = 'Name';
  static const _keymail = 'Mail';
  //----------------------------------
  static Future clearAllPreference() => _preferences!.clear();

  //----------------------------------
  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();
  //--------------------------------------------------------------
  static Future setToken(String? val) async =>
      await _preferences!.setString(_keytoken, val!);
  static String? getToken() => _preferences?.getString(_keytoken);
  static Future<bool>? deleteToken() => _preferences?.remove(_keytoken);
  //--------------------------------------------------------------
  static Future setphoto(String? val) async =>
      await _preferences!.setString(_keypropic, val!);
  static String? getphoto() => _preferences?.getString(_keypropic);
  static Future<bool>? deletephoto() => _preferences?.remove(_keypropic);
  //--------------------------------------------------------------
  static Future setname(String? val) async =>
      await _preferences!.setString(_keyname, val!);
  static String? getname() => _preferences?.getString(_keyname);
  static Future<bool>? deletename() => _preferences?.remove(_keyname);
  //--------------------------------------------------------------
  static Future setmail(String? val) async =>
      await _preferences!.setString(_keymail, val!);
  static String? getmail() => _preferences?.getString(_keymail);
  static Future<bool>? deletemail() => _preferences?.remove(_keymail);
  //--------------------------------------------------------------
}
