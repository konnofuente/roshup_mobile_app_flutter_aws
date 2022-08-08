
import 'package:flutter/material.dart';

import 'SignUp.dart';

class SignIn extends StatefulWidget {
  const SignIn({ Key? key }) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  late String email, pwd,phone_num;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Login'),
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
                  Text('Sign In', style: TextStyle(fontSize: 22.0),),
                ],
              ),
              SizedBox(height: 5.0,),
              Row(
                children: [
                  Flexible(child: Text("Enter your credentials to login")),
                ],
              ),
              SizedBox(height: 25.0,),
              Form(key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone_android, color: Colors.blue),
                        labelText: 'Phone Number',
                        hintText: "",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0),),
                          borderSide: BorderSide(color: Colors.grey)
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0),),
                          borderSide: BorderSide(color: Colors.blue)
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      validator: (val) => val!.isEmpty  ? 'password is required' : null,
                      onChanged: (val) {
                        setState(() => phone_num = val);
                      }
                    ),
                     SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.vpn_key, color: Colors.blue),
                        labelText: 'Password',
                        hintText: "",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0),),
                          borderSide: BorderSide(color: Colors.grey)
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0),),
                          borderSide: BorderSide(color: Colors.blue)
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      validator: (val) => val!.isEmpty ? 'password is required' : null,
                      onChanged: (val) {
                        setState(() => pwd = val);
                      }
                    ),
                    SizedBox(height: 40),
                    ElevatedButton(child: Text('LOGIN'), onPressed: () async {
                      
                    },),
                  ],
                ),
              ),
              TextButton
              (
                child: 
                  Text('Don\'t have an account?', style: TextStyle(color: Colors.blue),), 
                  onPressed: () async {
                      await Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => SignUp()));
              },),
            ],
          ),
        ),
      ),
    );
  }
}