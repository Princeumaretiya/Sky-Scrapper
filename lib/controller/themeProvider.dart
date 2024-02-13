import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';

class MyThemePreferences {
  static const THEME_KEY = "theme_key";

  static const PLATFORM_KEY = "Platform_key";
  static const IMAGEPATH = "Image_path";
  static const PROFILENAME = "Profile_name";
  static const PROFILEBIO = "Profile_bio";

  setImagePath(String? value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(IMAGEPATH, value!);
  }

  setProfieName(String? value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(PROFILENAME, value!);
  }

  setProfileBio(String? value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(PROFILEBIO, value!);
  }

  getImagePath() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? stringValue = sharedPreferences.getString(IMAGEPATH);
    return stringValue ?? '';
  }

  getProfileName() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? stringValue = sharedPreferences.getString(PROFILENAME);
    return stringValue ?? '';
  }

  getProfileBio() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? stringValue = sharedPreferences.getString(PROFILEBIO);
    return stringValue ?? '';
  }

  setPlatform(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(PLATFORM_KEY, value);
  }

  getPlatform() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(PLATFORM_KEY) ?? false;
  }

  setTheme(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(THEME_KEY, value);
  }

  getTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(THEME_KEY) ?? false;
  }
}

class ModelTheme extends ChangeNotifier {
  late bool _isDark;
  late MyThemePreferences _preferences;

  bool get isDark => _isDark;

  late bool _isAndroid;
  late MyThemePreferences _preferencesPlatform;

  bool get isAndroid => _isAndroid;

  bool _isShowProfile = true;

  bool get isShowProfile => _isShowProfile;

  String? ImageFile;
  String? profileName;
  String? profileBio;

  String? get getImageFile => ImageFile;

  String? get getProfileName => profileName;

  String? get getProfileBio => profileBio;

  ModelTheme() {
    _isDark = false;
    _preferences = MyThemePreferences();
    _isAndroid = false;
    ImageFile = '';
    profileName = '';
    profileBio = '';

    getPreferences();
  }

  set isShowProfile(bool value) {
    _isShowProfile = value;
    notifyListeners();
  }

  set isDark(bool value) {
    _isDark = value;
    _preferences.setTheme(value);
    notifyListeners();
  }

  set isPlatform(bool value) {
    _isAndroid = value;
    _preferences.setPlatform(value);
    notifyListeners();
  }

  set isImagePath(String? value) {
    ImageFile = value;
    _preferences.setImagePath(value);
    notifyListeners();
  }

  set isProfile(String? value) {
    profileName = value;

    _preferences.setProfieName(value);
    notifyListeners();
  }

  set isBio(String? value) {
    profileBio = value;
    _preferences.setProfileBio(value);

    notifyListeners();
  }

  getPreferences() async {
    _isDark = await _preferences.getTheme();
    _isAndroid = await _preferences.getPlatform();
    ImageFile = await _preferences.getImagePath();
    profileName = await _preferences.getProfileName();
    profileBio = await _preferences.getProfileBio();
    notifyListeners();
  }
}
