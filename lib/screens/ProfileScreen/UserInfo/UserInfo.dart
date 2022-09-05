import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../blocs/bloc/user_state.dart';
import '../../../../blocs/bloc_export.dart';
import '../../../../widgets/display_image_widget.dart';
import '../../../widgets/buildInfoDisplay.dart';
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
                    navigateSecondPage(const EditImagePage(),context);
                  },
                  child: DisplayImage(
                    imagePath: image,
                    onPressed: () {},
                  )),
              buildInfoDisplay(state.allUsers[0].firstName ,'Name', const EditNameFormPage(),context),
              buildInfoDisplay(state.allUsers[0].phoneNumber, 'Phone', const EditPhoneFormPage(),context),
              buildInfoDisplay(state.allUsers[0].email, 'Email', const EditEmailFormPage(),context),
            ],
          ),
        );
      },
    );
  }

}
