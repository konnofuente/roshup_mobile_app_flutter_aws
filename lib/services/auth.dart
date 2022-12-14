import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roshup_mobile_app_flutter_aws/screens/Login/UserVerification.dart';
import 'package:roshup_mobile_app_flutter_aws/services/provider.dart';

import '../blocs/bloc_export.dart';
import '../models/User.dart';

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
              CognitoUserAttributeKey.picture: ' ',
            },
          ));
      if (res.isSignUpComplete) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => UserVerification(phno: phno)));
      }
    } on AuthException catch (e) {
      print("could not signUp user "+e.message);
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
      //     Future<void> showalertDialogue() async {
      //   Widget okButton = FlatButton(
      //     child: Text("OK"),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   );

      //   AlertDialog alert = AlertDialog(
      //     title: Text("LOGIN ERROR"),
      //     content: Text("Credential Enter are Invalid "),
      //     actions: [
      //       okButton,
      //     ],
      //   );
      //   showDialog(
      //     context: context,
      //     builder: (BuildContext context) {
      //       return alert;
      //     },
      //   );
      // }
      
    try {

      // bool alertDia = res.isSignedIn;
      // alertDia ? '' : showalertDialogue();
      // print('the alert box is ${alertDia}   !!!!!!!!!!!!!!!!!!');

      SignInResult res =
          await Amplify.Auth.signIn(username: phno, password: pwd);

      Provider.of<AppStatus>(context, listen: false)
          .changeUserStatus(res.isSignedIn);
      Provider.of<AppStatus>(context, listen: false)
          .changeActExist(res.isSignedIn);

    } on AuthException catch (e) {
      print(e.message);
    }
  }

  Future<void> signOutCurrentUser(context) async {
    try {
      Amplify.Auth.signOut();
      Provider.of<AppStatus>(context, listen: false)
          .changeUserStatus(false);
      print('logout complete');
    } on AuthException catch (e) {
      print(e.message);
    }
  }


   Future<void> fetchUserInfo(BuildContext context, List<String> value,User user) async {
    try {
      print('userinfo');
      final result = await Amplify.Auth.fetchUserAttributes();
      for (final element in result) {
        print('key: ${element.userAttributeKey}; value: ${element.value}');
        element.value.contains('true') || element.value.contains('false')
            ? null
            : value.addAll([element.value]);
      }
      // if (value.length > 3) {
      //   user = User(
      //       id: value[0],
      //       name: value[1],
      //       phone_number: value[2],
      //       email: value[3],
      //       image: '');

      //   context.read<UserBloc>()..add(AddUsers(users: user));
      // } else {
      //   print('Not enought parameters fetch to create local user');
      // }
      // print(user);
    } on AuthException catch (e) {
      print(e.message);
    }
  }

  

}
