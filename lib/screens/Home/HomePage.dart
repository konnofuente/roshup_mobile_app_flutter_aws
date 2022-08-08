// main.dart
import 'package:flutter/material.dart';
import 'package:roshup_mobile_app_flutter_aws/screens/Home/ActivityScreen.dart';
import 'package:roshup_mobile_app_flutter_aws/screens/Home/ChatScreen.dart';
import 'package:roshup_mobile_app_flutter_aws/screens/Home/HostScreen.dart';
import 'package:roshup_mobile_app_flutter_aws/screens/Home/ProfileScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Host',backgroundColor: Color.fromARGB(255, 10, 153, 254)),
          BottomNavigationBarItem(icon: Icon(Icons.local_activity), label: 'Activity'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Profile")
        ],
      ),
    );
  }

}