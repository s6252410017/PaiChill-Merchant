import 'dart:convert';

import 'listid.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  static late SharedPreferences _preferences;
  static const _keyUser = 'user';

  static ListId myUser = ListId(
    image:
        "https://upload.wikimedia.org/wikipedia/en/0/0b/Darth_Vader_in_The_Empire_Strikes_Back.jpg",
    name: 'Test Test',
    email: 'test.test@gmail.com',
    password: '0000',
    phonenum: '0655151577',
    gmap: 'https://goo.gl/maps/EF3dpTnMVEvjtQAEA',
    district: 'BangKhae',
    province: 'Bangkok',
    facebook: 'https://www.facebook.com/Cafe-Amazon-%E0%B9%80%E0%B8%9E%E0%B8%8A%E0%B8%A3%E0%B9%80%E0%B8%81%E0%B8%A9%E0%B8%A177-103034398080547/',
  );

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(ListId user) async {
    final json = jsonEncode(user.toJson());

    await _preferences.setString(_keyUser, json);
  }

  static ListId getUser() {
    final json = _preferences.getString(_keyUser);

    return json == null ? myUser : ListId.fromJson(jsonDecode(json));
  }
}
