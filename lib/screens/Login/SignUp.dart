import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:roshup_mobile_app_flutter_aws/services/auth.dart';
import 'SignIn.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  late String uname, email, pwd, phno;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Register'),
      // ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                   Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 22.0),
                  ),
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  Flexible(child: Text("Let's create your account")),
                ],
              ),
              SizedBox(
                height: 25.0,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person, color: Colors.blue),
                          labelText: 'first and last name',
                          hintText: '',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              borderSide: BorderSide(color: Colors.grey)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              borderSide: BorderSide(color: Colors.blue)),
                        ),
                        keyboardType: TextInputType.text,
                        //obscureText: true,
                        validator: (val) =>
                            val!.isEmpty ? 'name is required' : null,
                        onChanged: (val) {
                          setState(() => uname = val);
                        }),
                    SizedBox(height: 20),
                    TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon:
                              Icon(Icons.alternate_email, color: Colors.blue),
                          labelText: 'email id',
                          hintText: '',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              borderSide: BorderSide(color: Colors.grey)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              borderSide: BorderSide(color: Colors.blue)),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        //obscureText: true,
                        validator: (val) =>
                            val!.isEmpty ? 'email is required' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        }),
                    SizedBox(height: 20),
                    TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.vpn_key, color: Colors.blue),
                          labelText: 'password',
                          hintText: "",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              borderSide: BorderSide(color: Colors.grey)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              borderSide: BorderSide(color: Colors.blue)),
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        validator: (val) =>
                            val!.isEmpty ? 'password is required' : null,
                        onChanged: (val) {
                          setState(() => pwd = val);
                        }),
                    SizedBox(height: 20),
                    IntlPhoneField(
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                      initialCountryCode: 'CM',
                      onChanged: (phone) {
                        setState(() => phno = phone.completeNumber);
                      },
                    ),
                    SizedBox(height: 40),
                    ElevatedButton(
                      child: Text('REGISTER'),
                      onPressed: () async {
                        print(uname);
                        print(pwd);print(phno);print(email);
                        await AuthServices()
                            .userSignUp(uname, pwd, phno, email, context);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                child: Text(
                  'Have an account?',
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () async {
                  await Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignIn()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
