import 'package:flutter/material.dart';

Widget buildInfoDisplay(String? getValue, String title, Widget editPage,BuildContext context) =>
    Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 1,
            ),
            Container(
                width: 350,
                height: 40,
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: Colors.grey,
                  width: 1,
                ))),
                child: Row(children: [
                  Expanded(
                      child: TextButton(
                          onPressed: () {
                            navigateSecondPage(editPage,context);
                          },
                          child: Text(
                            getValue!,
                            style: const TextStyle(fontSize: 16, height: 1.4),
                          ))),
                  const Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey,
                    size: 40.0,
                  )
                ]))
          ],
        ));

// Handles navigation and prompts refresh.
void navigateSecondPage(Widget editForm,BuildContext context) {
  Route route = MaterialPageRoute(builder: (context) => editForm);
  Navigator.push(context, route);
}
