import 'package:flutter/material.dart';
import '../../screens/ActivityScreen/activity_screen.dart';
import '../../screens/ChatScreen/chat_screen.dart';
import '../../screens/ProfileScreen/profile_screen.dart';
import '../../screens/ServiceScreen/service_screen.dart';

import '../../widgets/custom_drawer/drawer_user_controller.dart';
import '../../widgets/custom_drawer/home_drawer.dart';
import 'app_theme.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget? screenView;
  DrawerIndex? drawerIndex;

  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;
    screenView =  ServiceScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.white,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 24, 156, 232),
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
              //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
            },
            screenView: screenView,
            //we replace screen view as we need on navigate starting screens like MyHomeScreen, HelpScreen, FeedbackScreen, etc...
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      switch (drawerIndex) {
        case DrawerIndex.HOME:
          setState(() {
            screenView = ServiceScreen();
          });
          break;
        case DrawerIndex.Help:
          setState(() {
            screenView = ActivityScreen();
          });
          break;
        case DrawerIndex.FeedBack:
          setState(() {
            screenView = ChatScreen();
          });
          break;
        case DrawerIndex.Invite:
          setState(() {
            screenView = ProfileScreen();
          });
          break;
        default:
          break;
      }
    }
  }
}
