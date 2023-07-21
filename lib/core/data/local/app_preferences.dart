import 'package:bloc_skeleton/core/utils/pref_extension.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  Future<bool> setToken(String? token) {
    return _sharedPreferences.setStringOrClear(_keyToken, token);
  }

  String? getToken() {
    return _sharedPreferences.getString(_keyToken);
  }

  Future<bool> setRefreshToken(String? token) {
    return _sharedPreferences.setStringOrClear(_keyRefreshToken, token);
  }

  String? getRefreshToken() {
    return _sharedPreferences.getString(_keyRefreshToken);
  }

  Future<bool> setFingerId(String? fingerId) {
    return _sharedPreferences.setStringOrClear(_fingerId, fingerId);
  }

  Future<bool> setWelcomingShow(bool? hasShow) {
    return _sharedPreferences.setBoolOrClear(_welcomingPopup, hasShow);
  }

  bool? getWelcomingShow() {
    return _sharedPreferences.getBool(_welcomingPopup) ?? false;
  }

  Future<bool> setOfflineMode(bool? isOffline) {
    return _sharedPreferences.setBoolOrClear(_isOfflineMode, isOffline);
  }

  bool? getOfflineMode() {
    return _sharedPreferences.getBool(_isOfflineMode) ?? false;
  }

  Future<bool> setUserId(String? nik) {
    return _sharedPreferences.setStringOrClear(_userId, nik);
  }

  String? getUserId() {
    return _sharedPreferences.getString(_userId);
  }

  Future<bool> setDeviceId(String? deviceId) {
    return _sharedPreferences.setStringOrClear(_deviceIdentifier, deviceId);
  }

  String? getDeviceId() {
    return _sharedPreferences.getString(_deviceIdentifier);
  }

  String? getFingerId() {
    return _sharedPreferences.getString(_fingerId);
  }

  //TODO saveOnLocalDb
  Future<bool> setName(String? username) {
    return _sharedPreferences.setStringOrClear(_keyName, username);
  }

  Future<bool> setNik(String? username) {
    return _sharedPreferences.setStringOrClear(_keyNik, username);
  }

  Future<bool> setProjectSite(String? username) {
    return _sharedPreferences.setStringOrClear(_projectSite, username);
  }

  String? getName() {
    return _sharedPreferences.getString(_keyName);
  }

  String? getNik() {
    return _sharedPreferences.getString(_keyNik);
  }

  String? getProjectSite() {
    return _sharedPreferences.getString(_projectSite);
  }

  //TODO Credential Save

  Future<bool> setUsername(String? username) {
    return _sharedPreferences.setStringOrClear(_username, username);
  }

  Future<bool> setPassword(String? password) {
    return _sharedPreferences.setStringOrClear(_password, password);
  }

  String? getUsername() {
    return _sharedPreferences.getString(_username);
  }

  String? getPassword() {
    return _sharedPreferences.getString(_password);
  }

  Future<bool> setRoleId(int? roleId) {
    return _sharedPreferences.setIntOrClear(_roleId, roleId);
  }

  int? getRoleId() {
    return _sharedPreferences.getInt(_roleId);
  }

  Future<bool> setVersion(String? version) {
    return _sharedPreferences.setStringOrClear(_version, version);
  }

  String? getVersion() {
    return _sharedPreferences.getString(_version);
  }

  /// Preferences Keys
  static const String _keyToken = 'token';
  static const String _keyRefreshToken = 'refresh_token';
  static const String _fingerId = 'fingerId';
  static const String _username = 'username';
  static const String _password = 'password';
  static const String _welcomingPopup = 'welcoming';
  static const String _userId = 'user_id';
  static const String _roleId = 'role_id';
  static const String _isOfflineMode = 'is_offline';
  static const String _deviceIdentifier = 'device_identifier';
  static const String _version = 'version';

  /// Profile Keys
  static const String _keyName = 'name';
  static const String _keyNik = 'nik';
  static const String _projectSite = 'project_site';
}
