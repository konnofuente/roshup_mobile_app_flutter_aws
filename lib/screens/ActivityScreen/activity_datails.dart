import 'package:flutter/material.dart';

class ActivityDetail extends StatefulWidget {
  const ActivityDetail({Key? key}) : super(key: key);

  @override
  State<ActivityDetail> createState() => _ActivityDetailState();
}

class _ActivityDetailState extends State<ActivityDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      child: Text(
        ' Activity Details',
        style: TextStyle(fontSize: 30),
      ),
    ),
    );
  }
}
