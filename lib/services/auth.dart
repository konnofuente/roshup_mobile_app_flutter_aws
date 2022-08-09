import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roshup_mobile_app_flutter_aws/screens/Login/UserVerification.dart';
import 'package:roshup_mobile_app_flutter_aws/services/provider.dart';

class AuthServices {
  Future<void> userSignUp(uname, pwd, phno, email, context) async {
    var attributes = {'email': '$email', 'name': '$uname'};
    try {
      SignUpResult res = await Amplify.Auth.signUp(
          username: phno,
          password: pwd,
          options: CognitoSignUpOptions(
            userAttributes: <CognitoUserAttributeKey, String>{
              CognitoUserAttributeKey.name: uname,
              CognitoUserAttributeKey.email: email,
              CognitoUserAttributeKey.phoneNumber: phno,
            },
          ));
      if (res.isSignUpComplete) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => UserVerification(phno: phno)));
      }
    } on AuthException catch (e) {
      print(e.message);
    }
  }

  Future<void> confUser(phno, confcode, context) async {
    try {
      var res = await Amplify.Auth.confirmSignUp(
          username: phno, confirmationCode: confcode);
      if (res.isSignUpComplete) {
        Navigator.pop(context);
        Navigator.pop(context);
      }
    } on AuthException catch (e) {
      print('the user:${phno} has not ' + e.message);
    }
  }

  Future<void> userSignIn(phno, pwd, context) async {
    try {
      SignInResult res =
          await Amplify.Auth.signIn(username: phno, password: pwd);
      Provider.of<UserLoginStatus>(context, listen: false)
          .changeUserStatus(res.isSignedIn);
    } on AuthException catch (e) {
      print(e.message);
    }
  }

  Future<void> signOutCurrentUser(context) async {
    try {
      Amplify.Auth.signOut();
      Provider.of<UserLoginStatus>(context, listen: false).changeUserStatus(false);
      print('logout complete');
    } on AuthException catch (e) {
      print(e.message);
    }
  }
}
