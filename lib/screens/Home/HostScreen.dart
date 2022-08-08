// screen_b.dart
import 'package:flutter/material.dart';

class HostScreen extends StatelessWidget {
  const HostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Host Section',
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}