import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roshup_mobile_app_flutter_aws/services/auth.dart';
import '../../../blocs/bloc/user_state.dart';
import '../../../blocs/bloc_export.dart';
import '../../../services/provider.dart';
import 'UserInfo/UserInfo.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {


  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return Scaffold(
            body: ListView(
              children: [
                // User card
                SmallUserCard(
                  cardColor: const Color.fromARGB(255, 255, 254, 254),
                  userName: state.allUsers[0].firstName,
                  userProfilePic:
                      const AssetImage("assets/images/IMG_2127.JPG"),
                  userMoreInfo: const Text(
                    'Click To Modify User info',
                    style: TextStyle(fontSize: 10),
                    textAlign: TextAlign.left,
                  ),
                  onTap: () {
                    
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => UserInfo()));
                  },
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
                        Provider.of<UserBloc>(context, listen: false)
                        .add( ClearLocalInfo());
                        print('let try');
                        AuthServices().signOutCurrentUser(context);
                        Provider.of<AppStatus>(context, listen: false)
                            .changeUserStatus(false);
                      },
                      icons: Icons.exit_to_app_rounded,
                      title: "Sign Out",
                    ),
                    SettingsItem(
                      onTap: () {},
                      icons: Icons.abc,
                      title: "Delete account",
                      titleStyle: const TextStyle(
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
      ),
    );
  }
}
