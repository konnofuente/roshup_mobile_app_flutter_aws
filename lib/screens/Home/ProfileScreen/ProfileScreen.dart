// screen_a.dart
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roshup_mobile_app_flutter_aws/screens/Home/ProfileScreen/UserInfo/UserInfo.dart';
import 'package:roshup_mobile_app_flutter_aws/services/auth.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../../blocs/bloc/user_state.dart';
import '../../../blocs/bloc_export.dart';
import '../../../services/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return Scaffold(
          body: ListView(
            children: [
              // User card
              SmallUserCard(
                cardColor: Color.fromARGB(255, 255, 254, 254),
                userName: state.allUsers[0].name,
                userProfilePic: const AssetImage("assets/images/IMG_2127.JPG"),
                userMoreInfo: const Text(
                  'Click To Modify User info',
                  style: TextStyle(fontSize: 10),
                  textAlign: TextAlign.left,
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfilePage()));
                },
                // cardActionWidget: SettingsItem(
                //   icons: Icons.edit,
                //   iconStyle: IconStyle(
                //     withBackground: true,
                //     // borderRadius: 50,
                //     backgroundColor: Colors.yellow[600],
                //   ),
                //   title: "Modify",
                //   subtitle: "Tap to change your data",
                //   onTap: () {
                //     print("OK");
                //   },
                // ),
              ),
              SettingsGroup(
                items: [
                  SettingsItem(
                    onTap: () {
                      // fetchAuthSession();
                      UserInfor();
                    },
                    icons: Icons.person_pin_circle,
                    iconStyle: IconStyle(),
                    title: 'Services',
                    subtitle: "Manage the Service you want to offer",
                  ),
                  SettingsItem(
                    onTap: () {},
                    icons: Icons.dark_mode_rounded,
                    iconStyle: IconStyle(
                      iconsColor: Colors.white,
                      withBackground: true,
                      backgroundColor: Colors.red,
                    ),
                    title: 'Dark mode',
                    subtitle: "Automatic",
                    trailing: Switch.adaptive(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
              SettingsGroup(
                items: [
                  SettingsItem(
                    onTap: () {},
                    icons: Icons.info_rounded,
                    iconStyle: IconStyle(
                      backgroundColor: Colors.purple,
                    ),
                    title: 'Payment Methode',
                    subtitle: "Manage your OM/MOMO payment methode",
                  ),
                ],
              ),
              // You can add a settings title
              SettingsGroup(
                items: [
                  SettingsItem(
                    onTap: () {
                      print('let try');
                      AuthServices().signOutCurrentUser(context);
                      Provider.of<UserLoginStatus>(context, listen: false)
                          .changeUserStatus(false);
                    },
                    icons: Icons.exit_to_app_rounded,
                    title: "Sign Out",
                  ),
                  SettingsItem(
                    onTap: () {},
                    icons: Icons.abc,
                    title: "Delete account",
                    titleStyle: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> UserInfor() async {
    List<String> value = [];
    int i = 0;
    try {
      print('userinfo');
      final result = await Amplify.Auth.fetchUserAttributes();
      for (final element in result) {
        print('key: ${element.userAttributeKey}; value: ${element.value}');
        element.value.contains('true') || element.value.contains('false')
            ? null
            : value.addAll([element.value]);
      }
      print(value);
    } on AuthException catch (e) {
      print(e.message);
    }
  }

  Future<void> fetchAuthSession() async {
    try {
      final result = await Amplify.Auth.fetchAuthSession(
        options: CognitoSessionOptions(getAWSCredentials: true),
      );
      String identityId = (result as CognitoAuthSession).identityId!;
      // String email = (result as CognitoUserAttributeKey.email);
      print('identityId: $identityId');
      // print('email: $email');
    } on AuthException catch (e) {
      print(e.message);
    }
  }
}


    //     SingleChildScrollView(
    //   child: ElevatedButton(
    //     child: Text('LOGIN'),
    //     onPressed: () async {
    //       print('let try');
    //       AuthServices().signOutCurrentUser(context);
    //        Provider.of<UserLoginStatus>(context, listen: false)
    //       .changeUserStatus(fal);
    //     },
    //   ),
    // )
    