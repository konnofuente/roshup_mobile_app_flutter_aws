// main.dart
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:roshup_mobile_app_flutter_aws/blocs/bloc_export.dart';
import 'package:roshup_mobile_app_flutter_aws/screens/Home/ActivityScreen.dart';
import 'package:roshup_mobile_app_flutter_aws/screens/Home/ChatScreen.dart';
import 'package:roshup_mobile_app_flutter_aws/screens/Home/HostScreen/HostScreen.dart';
import 'package:roshup_mobile_app_flutter_aws/screens/Home/ProfileScreen/ProfileScreen.dart';

import '../../models/User.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  int _selectedScreenIndex = 0;
  final List _screens = [
    {"screen": const HostScreen(), "title": "HostScreen"},
    {"screen": const ActivityScreen(), "title": "ActivityScreen"},
    {"screen": const ChatScreen(), "title": "ChatScreen"},
    {"screen": const ProfileScreen(), "title": "ProfileScreen"}
  ];

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedScreenIndex]["title"]),
      ),
      body: _screens[_selectedScreenIndex]["screen"],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedScreenIndex,
        onTap: _selectScreen,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Host',
              backgroundColor: Color.fromARGB(255, 10, 153, 254)),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_activity), label: 'Activity'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Profile")
        ],
      ),
    );
  }
}
