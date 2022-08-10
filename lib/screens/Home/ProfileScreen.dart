// screen_a.dart
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roshup_mobile_app_flutter_aws/services/auth.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../services/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
     
      body:  ListView(
    children: [
      // User card
      BigUserCard(
        cardColor: Color.fromARGB(255, 255, 254, 254),
        userName: "Babacar Ndong",
        userProfilePic: AssetImage(" "),
        cardActionWidget: SettingsItem(
          icons: Icons.edit,
          iconStyle: IconStyle(
            withBackground: true,
            // borderRadius: 50,
            backgroundColor: Colors.yellow[600],
          ),
          title: "Modify",
          subtitle: "Tap to change your data",
          onTap: () {
            print("OK");
          },
        ),
      ),
      SettingsGroup(
        items: [
          SettingsItem(
            onTap: () {},
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
    