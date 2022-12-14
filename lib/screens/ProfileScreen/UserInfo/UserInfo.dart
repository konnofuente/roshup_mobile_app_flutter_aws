import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../blocs/bloc/user_state.dart';
import '../../../../blocs/bloc_export.dart';
import '../../../../widgets/display_image_widget.dart';
import 'EditScreens/edit_email.dart';
import 'EditScreens/edit_image.dart';
import 'EditScreens/edit_name.dart';
import 'EditScreens/edit_phone.dart';

// This class handles the Page to dispaly the user's info on the "Edit Profile" Screen
class UserInfo extends StatefulWidget {
  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {

    String image = "assets/images/IMG_2127.JPG";

    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                toolbarHeight: 10,
              ),
              const Center(
                  child: Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text(
                        'Edit Profile',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(64, 105, 225, 1),
                        ),
                      ))),
              InkWell(
                  onTap: () {
                    navigateSecondPage(const EditImagePage());
                  },
                  child: DisplayImage(
                    imagePath: image,
                    onPressed: () {},
                  )),
              buildUserInfoDisplay(state.allUsers[0].firstName ,'Name', const EditNameFormPage()),
              buildUserInfoDisplay(state.allUsers[0].phoneNumber, 'Phone', const EditPhoneFormPage()),
              buildUserInfoDisplay(state.allUsers[0].email, 'Email', const EditEmailFormPage()),
            ],
          ),
        );
      },
    );
  }

  // Widget builds the display item with the proper formatting to display the user's info
  Widget buildUserInfoDisplay(
          String? getValue, String title, Widget editPage) =>
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
                              navigateSecondPage(editPage);
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

  // Refrshes the Page after updating user info.
  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  // Handles navigation and prompts refresh.
  void navigateSecondPage(Widget editForm) {
    Route route = MaterialPageRoute(builder: (context) => editForm);
    Navigator.push(context, route).then(onGoBack);
  }
}
