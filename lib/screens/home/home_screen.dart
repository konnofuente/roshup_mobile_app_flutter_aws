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
  int selectedPage = 0;
  final pages = [ServiceScreen(), ActivityScreen(), ChatScreen(),ProfileScreen()];
  bool isBottomDrawer = true;

  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;
    screenView = ServiceScreen();
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
                isBottomDrawer = false;
                //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
              },
              screenView: isBottomDrawer ? pages[selectedPage] : screenView,
              //we replace screen view as we need on navigate starting screens like MyHomeScreen, HelpScreen, FeedbackScreen, etc...
            ),
            bottomNavigationBar: getBottomTab()),
      ),
    );
  }

  Widget getBottomTab() {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedPage,
        fixedColor: Colors.blueAccent,
        unselectedItemColor: Color(0xFF757575),
        onTap: (position) {
          setState(() {
            isBottomDrawer = true;
            selectedPage = position;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.supervisor_account_rounded), label: "Activity"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings")
        ]);
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
