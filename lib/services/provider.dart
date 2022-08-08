import 'package:flutter/material.dart';

class UserLoginStatus with ChangeNotifier {
  UserLoginStatus({required this.userLoggedIn});

  bool userLoggedIn;

  changeUserStatus(bool changeState) {
    userLoggedIn = changeState;
    notifyListeners();
    // printNewSelection();
  }
}
