import 'package:flutter/material.dart';

import '../models/Service.dart';

class ListWidget extends StatelessWidget {
  final Service? service;
  const ListWidget({Key? key, required this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 0,
        color: Colors.cyan,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image.asset("assets/design_course/interFace1.png",
              height: 90,
              width: 90,
            ),
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text(service!.title, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18))),
            ),
            subtitle: Center(child: Text(service!.content!, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15))),
            trailing: Text(
              "${service!.priceRange!.price}",
              style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}