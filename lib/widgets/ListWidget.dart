import 'package:flutter/material.dart';
import 'package:roshup_mobile_app_flutter_aws/screens/ProfileScreen/ServiceInfo/service_edit.dart';

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
        shadowColor: Color.fromARGB(31, 8, 8, 8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
          onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ServiceEdit(service: service!,),
                    ),),
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        leading: Container(
          padding: EdgeInsets.only(right: 12.0),
          decoration: new BoxDecoration(
              border: new Border(
                  right: new BorderSide(width: 1.0, color: Colors.white24))),
          child: Image.asset(
               "assets/design_course/interFace1.png",
            ),
        ),
        title: Text(
          service!.title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

        subtitle: Row(
          children: <Widget>[
            Text("Price:", style: TextStyle(color: Color.fromARGB(255, 247, 247, 95),fontWeight:FontWeight.w500)),
            Text(service!.priceRange!.price.toString(), style: TextStyle(color: Colors.white))
          ],
        ),
        trailing:
            Column(
              children: [
                Icon(Icons.edit, color: Colors.white, size: 35.0),
              ],
            ))
        ),
      ),
    );
  }
}