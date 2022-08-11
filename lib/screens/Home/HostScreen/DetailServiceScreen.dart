import 'package:flutter/material.dart';
import 'package:roshup_mobile_app_flutter_aws/models/ModelProvider.dart';

class DetailServiceScreen extends StatefulWidget {
  final SERVICE service;
  const DetailServiceScreen({Key? key, required this.service})
      : super(key: key);

  @override
  State<DetailServiceScreen> createState() => _DetailServiceScreenState();
}

class _DetailServiceScreenState extends State<DetailServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.service.name} Service')),
    );
  }
}
