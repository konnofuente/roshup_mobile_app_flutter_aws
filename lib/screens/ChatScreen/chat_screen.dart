// screen_b.dart
import 'package:flutter/material.dart';

import '../home/app_theme.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.nearlyWhite,
        elevation: 0,
        title: Text(
              'Chats',
              style: TextStyle(
                fontSize: 22,
                color:AppTheme.darkText ,
                // color: AppTheme.darkText ,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
      body: Center(
        child: Text(
          ' Chatting',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}