import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:string_validator/string_validator.dart';
import '../../../../../blocs/bloc/user_state.dart';
import '../../../../../blocs/bloc_export.dart';
import '../../../../../widgets/appbar_widget.dart';

// This class handles the Page to edit the Name Section of the User Profile.
class EditNameFormPage extends StatefulWidget {
  const EditNameFormPage({Key? key}) : super(key: key);

  @override
  EditNameFormPageState createState() {
    return EditNameFormPageState();
  }
}

class EditNameFormPageState extends State<EditNameFormPage> {
  final _formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final secondNameController = TextEditingController();
  late String Username;

  @override
  void dispose() {
    firstNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return Scaffold(
            appBar: buildAppBar("Edit Email"),
            body: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                      width: 330,
                      child: Text(
                        "What's Your Name?",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 40, 16, 0),
                          child: SizedBox(
                              height: 100,
                              width: 150,
                              child: TextFormField(
                                // Handles Form Validation for First Name
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your first name';
                                  } else if (!isAlpha(value)) {
                                    return 'Only Letters Please';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                    labelText: 'First Name'),
                                controller: firstNameController,
                              ))),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 40, 16, 0),
                          child: SizedBox(
                              height: 100,
                              width: 150,
                              child: TextFormField(
                                // Handles Form Validation for Last Name
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your last name';
                                  } else if (!isAlpha(value)) {
                                    return 'Only Letters Please';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                    labelText: 'Last Name'),
                                controller: secondNameController,
                              )))
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 150),
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            width: 330,
                            height: 50,
                            child: TextButton(
                              onPressed: () {
                                // Validate returns true if the form is valid, or false otherwise.
                                if (isAlpha(firstNameController.text) ||
                                    isAlpha(secondNameController.text)) {
                                  // Username =
                                  //     '${firstNameController.text} ${secondNameController.text}';

                                  Provider.of<UserBloc>(context, listen: false)
                                      .add(UpdateUsersName(
                                    firstName: firstNameController.text,
                                    lastName: secondNameController.text,
                                    users: state.allUsers[0],
                                  ));
                                } else {
                                  AlertBox(context, "Edit Alert", "Please Enter atleast to update");
                                }
                              },
                              child: const Text(
                                'Update',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          )))
                ],
              ),
            ));
      },
    );
  }
}

void AlertBox(BuildContext context, String title, String message) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    ),
  );
}
