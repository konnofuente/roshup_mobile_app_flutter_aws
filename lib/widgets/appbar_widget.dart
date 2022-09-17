import 'package:flutter/material.dart';
import '../screens/home/app_theme.dart';


AppBar buildAppBar(String Title) {
  return AppBar(
    backgroundColor: AppTheme.nearlyWhite,
            elevation: 0,
            title: Text(
                  Title,
                  style: TextStyle(
                    fontSize: 22,
                    color:AppTheme.darkText ,
                    // color: AppTheme.darkText ,
                    fontWeight: FontWeight.w700,
                  ),
                ),
  );
}
