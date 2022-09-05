import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:provider/provider.dart';
import '../../../../../blocs/bloc/user_state.dart';
import '../../../../../blocs/bloc_export.dart';
import '../../../../../widgets/appbar_widget.dart';

// This class handles the Page to edit the Email Section of the User Profile.
class EditEmailFormPage extends StatefulWidget {
  const EditEmailFormPage({Key? key}) : super(key: key);

  @override
  EditEmailFormPageState createState() {
    return EditEmailFormPageState();
  }
}

class EditEmailFormPageState extends State<EditEmailFormPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  late String Useremail;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return Scaffold(
            appBar: buildAppBar(context),
            body: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                        width: 320,
                        child: const Text(
                          "What's your email?",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: 40),
                        child: SizedBox(
                            height: 100,
                            width: 320,
                            child: TextFormField(
                              // Handles Form Validation
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email.';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                  labelText: 'Your email address'),
                              controller: emailController,
                            ))),
                    Padding(
                        padding: EdgeInsets.only(top: 150),
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              width: 320,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Validate returns true if the form is valid, or false otherwise.
                                  if (_formKey.currentState!.validate() &&
                                      EmailValidator.validate(
                                          emailController.text)) {
                                    Provider.of<UserBloc>(context,
                                            listen: false)
                                        .add(UpdateUserEmail(
                                      email: emailController.text,
                                      users: state.allUsers[0],
                                      context: context,
                                    ));
                                    // Navigator.pop(context);
                                  }
                                },
                                child: const Text(
                                  'Update',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            )))
                  ]),
            ));
      },
    );
  }
}
