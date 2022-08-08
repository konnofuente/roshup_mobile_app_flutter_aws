import 'package:flutter/material.dart';
import '../../services/auth.dart';


class UserVerification extends StatefulWidget {
  const UserVerification({Key? key, required this.phno}) : super(key: key);

  final String phno;

  @override
  _UserVerificationState createState() => _UserVerificationState();
}

class _UserVerificationState extends State<UserVerification> {
  final _formKey = GlobalKey<FormState>();
  late String verCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Confirm Account')
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
                    'Verification',
                    style: TextStyle(fontSize: 22.0),
                  ),
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  Flexible(
                      child: Text("Enter verification code sent to your phone Number")),
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
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.vpn_key, color: Colors.blue),
                          labelText: 'verification code',
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
                        keyboardType: TextInputType.phone,
                        obscureText: true,
                        validator: (val) =>
                            val!.isEmpty ? 'code cannot be empty' : null,
                        onChanged: (val) {
                          setState(() => verCode = val);
                        }),
                    SizedBox(height: 40),
                    ElevatedButton(
                      child: Text('LOGIN'),
                      onPressed: () async {
                        print(widget.phno);
                        await AuthServices()
                            .confUser(widget.phno, verCode, context);
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      child: Text('BACK'),
                      onPressed: () async {
                        Navigator.pop(context);
                        // await Navigator.push(context,
                        // MaterialPageRoute(builder: (context) => SignUp()));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
