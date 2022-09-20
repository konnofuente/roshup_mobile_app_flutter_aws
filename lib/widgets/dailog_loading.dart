import 'package:flutter/material.dart';

Widget showLoading(BuildContext context, String text) {
  return SimpleDialog(
    backgroundColor: Colors.transparent, //here set the color to transparent
    elevation: 0,
    children: <Widget>[
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(height: 10),
          Text(text, textAlign: TextAlign.center),
        ],
      ),
    ],
  );
}
