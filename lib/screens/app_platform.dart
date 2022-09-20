// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:io';
import 'package:amplify_api/model_queries.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:roshup_mobile_app_flutter_aws/blocs/bloc/services_bloc.dart';
import '../blocs/bloc/user_bloc.dart';
import '../blocs/request_export.dart';
import '../models/Request.dart';
import '../models/Service.dart';
import '../models/User.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'home/app_theme.dart';
import 'home/home_screen.dart';

class AppPlatform extends StatefulWidget {
  @override
  State<AppPlatform> createState() => _AppPlatformState();
}

class _AppPlatformState extends State<AppPlatform> {
  late List<String> value = [];
  late User user;
  @override
  void initState() {
    loadAppConfig();
    super.initState();
  }

  Future<void> loadAppConfig() async {
    await fetchUserInfo();
    rememberCurrentDevice();
  }

  Future<void> rememberCurrentDevice() async {
    try {
      await Amplify.Auth.rememberDevice();
      print('Remember device succeeded');
    } on Exception catch (e) {
      print('Remember device failed with error: $e');
    }
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
          firstName: value[1],
          phoneNumber: value[2],
          email: value[3],
        );

        context.read<UserBloc>().add(AddUsers(users: user));
      } else {
        print('Not enought parameters fetch to create local user');
      }
      // print(user);
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
      home: HomeScreen(),
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
