import 'package:shared_preferences/shared_preferences.dart';

import '../model/UserDataModel.dart';

class SharedPreferencesHelper {
  late SharedPreferences _prefs;

  Future<void> initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> saveValues(String name, String email, String image, String date) async {
    await _prefs.setString('name', name);
    await _prefs.setString('email', email);
    await _prefs.setString('image', image);
    await _prefs.setString('date', date);
  }

  Future<UserData> loadStoredValues() async {
    final String name = _prefs.getString('name') ?? "";
    final String email = _prefs.getString('email') ?? "";
    final String image = _prefs.getString('image') ?? "";
    final String date = _prefs.getString('date') ?? "";

    return UserData(name: name, email: email, image: image, date: date);
  }
}
