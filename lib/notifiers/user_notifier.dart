import 'package:flutter/material.dart';
import 'package:stage_one/app/constants/shared.dart';

class User extends ChangeNotifier {
  String firstname = '';
  String lastname = '';
  String email = '';
  String number = '';
  String address = '';
  
  Future<void> setUserDetails() async {
    firstname = await Shared.getUserFirstname() ?? 'Dummy';
    lastname = await Shared.getUserLastname()  ?? 'Name';
    email = await Shared.getUserEmail() ?? 'test@test.com';
    number = await Shared.getUserPhone() ?? '08012345678';
    address = await Shared.getUserCity() ?? ',Middle, Nowhere';
  }
}
