import 'package:flutter/material.dart';

class UserLoginStatus with ChangeNotifier {
  UserLoginStatus({
    required this.userLoggedIn,
    required this.isActExist,
    });

  bool userLoggedIn;
  bool isActExist;

  changeUserStatus(bool changeState) {
    userLoggedIn = changeState;
    notifyListeners();
    // printNewSelection();
  }
}
