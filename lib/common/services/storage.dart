import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task1/common/entity/user.dart';

class SharePreference {
  static late SharedPreferences prefs;

  factory SharePreference() => SharePreference._singleton();
  SharePreference._singleton();

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> setUser({
    String? name,
    String? desc,
    required int age,
    required int id,
  }) async {
    await prefs
        .setStringList(id.toString(), [name ?? "", desc ?? "", age.toString()]);

    final List<String> keys = [];
    final List<String>? prefsKeys = prefs.getStringList("keys");
    if (prefsKeys != null) {
      keys.addAll(prefsKeys);
    }
    keys.add(id.toString());
    await prefs.setStringList("keys", keys);
    debugPrint(prefs.getStringList("keys").toString());
  }

  User? getUser(String key) {
    debugPrint(prefs.getStringList(key).toString());
    final userList = prefs.getStringList(key);
    if (userList != null) {
      final User user = User(
          username: userList[0],
          description: userList[1],
          age: int.parse(userList[2]),
          userId: int.parse(key));
      return user;
    }
    return null;
  }

  List<User?>? getUsers() {
    final List<String>? keys = prefs.getStringList("keys");
    debugPrint(keys.toString());

    final List<User?>? users = keys?.map((e) {
      return getUser(e);
    }).toList();
    return users;
  }

  Future<void> clearStorage() async {
    await prefs.clear();
  }
}

final sharePreference = SharePreference();
