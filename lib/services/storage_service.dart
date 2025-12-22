import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String _userKey = '';

  Future<void> saveUser(String id, String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userKey, jsonEncode({'id': id, 'name': name}));
  }

  Future<dynamic> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString(_userKey);

    if (userData != null) {
      return jsonDecode(userData);
    }

    return null;
  }
}
