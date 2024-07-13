import 'package:shared_preferences/shared_preferences.dart';

class Shared {
  static Future<bool> setSeenIntro(bool seenIntro) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool('seenIntro', seenIntro);
  }

  static getSeenIntro() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('seenIntro');
  }

  static Future<bool> setUserEmail(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('email', email);
  }

  static getUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('email');
  }

  static Future<bool> setUserFirstname(String firstname) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('firstname', firstname);
  }

  static getUserFirstname() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('firstname');
  }

  static Future<bool> setUserLastname(String lastname) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('lastname', lastname);
  }

  static getUserLastname() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('lastname');
  }

  static Future<bool> setUserCity(String city) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('city', city);
  }

  static getUserCity() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('city');
  }

  static Future<bool> setUserphone(String phone) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('phone', phone);
  }

  static getUserPhone() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('phone');
  }
}
