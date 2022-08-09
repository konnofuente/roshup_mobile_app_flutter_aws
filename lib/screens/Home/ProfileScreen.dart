// screen_a.dart
import 'package:flutter/material.dart';
import 'package:roshup_mobile_app_flutter_aws/services/auth.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: ElevatedButton(
        child: Text('LOGIN'),
        onPressed: () async {
          print('let try');
          AuthServices().signOutCurrentUser(context);
        },
      ),
    ));
  }
}
