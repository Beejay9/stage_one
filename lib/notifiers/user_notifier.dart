import 'package:flutter/material.dart';
import 'package:stage_one/app/constants/shared.dart';

class User extends ChangeNotifier {
  String firstname = '';
  String lastname = '';
  String email = '';
  String number = '';
  String address = '';
  
  Future<void> setUserDetails() async {
    firstname = await Shared.getUserFirstname();
    lastname = await Shared.getUserLastname();
    email = await Shared.getUserEmail();
    number = await Shared.getUserPhone();
    address = await Shared.getUserCity();
  }
}
