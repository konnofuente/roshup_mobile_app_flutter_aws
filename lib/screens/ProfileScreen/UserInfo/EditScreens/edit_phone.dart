import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import 'package:string_validator/string_validator.dart';
import '../../../../../blocs/bloc/user_state.dart';
import '../../../../../blocs/bloc_export.dart';
import '../../../../../widgets/appbar_widget.dart';

// This class handles the Page to edit the Phone Section of the User Profile.
class EditPhoneFormPage extends StatefulWidget {
  const EditPhoneFormPage({Key? key}) : super(key: key);
  @override
  EditPhoneFormPageState createState() {
    return EditPhoneFormPageState();
  }
}

class EditPhoneFormPageState extends State<EditPhoneFormPage> {
  final _formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  late String Userphone;

  @override
  void dispose() {
    phoneController.dispose();
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
                    const SizedBox(
                        width: 320,
                        child: Text(
                          "What's Your Phone Number?",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        )),
                    Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: SizedBox(
                            height: 100,
                            width: 320,
                            child:
                             IntlPhoneField(
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                      initialCountryCode: 'CM',
                      onChanged: (phone) {
                        setState(() => Userphone=phone.completeNumber);
                      },
                    ),
                            
                            )),
                    Padding(
                        padding: const EdgeInsets.only(top: 150),
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              width: 320,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                   Provider.of<UserBloc>(context,
                                            listen: false)
                                        .add(UpdatePhoneNumber(
                                      phone_number: Userphone,
                                      users: state.allUsers[0],
                                    ));
                                    // Navigator.pop(context);
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
