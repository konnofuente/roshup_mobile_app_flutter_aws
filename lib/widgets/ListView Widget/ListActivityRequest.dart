// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:roshup_mobile_app_flutter_aws/screens/ActivityScreen/activity_datails.dart';
import 'package:roshup_mobile_app_flutter_aws/screens/ProfileScreen/ServiceInfo/service_edit.dart';

import '../../models/Request.dart';



class ListActivityScreen extends StatelessWidget {
  final Request? request;
  const ListActivityScreen({Key? key, required this.request}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 0,
        color: Color.fromARGB(255, 88, 169, 210),
        shadowColor: Color.fromARGB(31, 8, 8, 8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
          onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ActivityDetail(),
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
          request!.title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        
        subtitle: Row(
          children: <Widget>[
            Text("Service:", style: TextStyle(color: Color.fromARGB(255, 247, 247, 95),fontWeight:FontWeight.w500)),
            request!.service !=null ?
            Text(request!.service!.title, style: TextStyle(color: Colors.white)) :Container()
          ],
        ),
        // trailing:
        //     Column(
        //       children: [
        //         Icon(Icons.edit, color: Colors.white, size: 35.0),
        //       ],
        //     )
            )
        ),
      ),
    );
  }
}