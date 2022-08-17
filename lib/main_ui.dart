import 'dart:io';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/bloc/user_bloc.dart';
import 'models/User.dart';
import 'screen_ui/home/app_theme.dart';
import 'screen_ui/home/navigation_home_screen.dart';
import 'package:flutter/foundation.dart' show kIsWeb;



class main_ui extends StatefulWidget {
  @override
  State<main_ui> createState() => _main_uiState();
}

class _main_uiState extends State<main_ui> {
  late List<String> value = [];
  late User user;
  @override
  void initState() {
    loadAppConfig();
    super.initState();
  }

  Future<void> loadAppConfig() async {
    await fetchUserInfo();
  }

    Future<void> fetchUserInfo() async {
    try {
      print('userinfo');
      final result = await Amplify.Auth.fetchUserAttributes();
      for (final element in result) {
        print('key: ${element.userAttributeKey}; value: ${element.value}');
        element.value.contains('true') || element.value.contains('false')
            ? null
            : value.addAll([element.value]);
      }
      if (value.length > 3) {
        user = User(
            id: value[0],
            name: value[1],
            phone_number: value[2],
            email: value[3],
            image: '');

        context.read<UserBloc>()..add(AddUsers(users: user));
      } else {
        print('Not enought parameters fetch to create local user');
      }
      print(user);
    } on AuthException catch (e) {
      print(e.message);
    }
  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
          !kIsWeb && Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      title: 'Flutter UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: AppTheme.textTheme,
        platform: TargetPlatform.iOS,
      ),
      home: NavigationHomeScreen(),
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
