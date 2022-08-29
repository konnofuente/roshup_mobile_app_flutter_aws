import 'package:flutter/material.dart';

class AppStatus with ChangeNotifier {
  AppStatus({
    required this.userLoggedIn,
    required this.isActExist,
    required this.isLoading,
  });

  bool userLoggedIn;
  bool isActExist;
  bool isLoading;

  changeUserStatus(bool changeState) {
    userLoggedIn = changeState;
    notifyListeners();
  }

  changeActExist(bool changeState) {
    isActExist = changeState;
    notifyListeners();
  }
  changeLoading(bool changeState) {
    isLoading= changeState;
    notifyListeners();
  }
}
