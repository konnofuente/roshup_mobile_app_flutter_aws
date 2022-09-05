import 'package:flutter/material.dart';
import '../../../models/Service.dart';


class ServiceEdit extends StatefulWidget {
  final Service service;

   const ServiceEdit({Key? key, required this.service}) : super(key: key);

  @override
  _ServiceEditState createState() => _ServiceEditState();
}

class _ServiceEditState extends State<ServiceEdit> {
 
  
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey();

  String firstName = "";
  String lastName = "";
  String bodyTemp = "";
  var measure;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Edit Service"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextFormField(
                    initialValue:'first',
                    decoration: const InputDecoration(
                        labelText: 'First Name',),
                    onFieldSubmitted: (value) {
                      setState(() {
                        // firstName = value.capitalize();
                        // firstNameList.add(firstName);
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        // firstName = value.capitalize();
                      });
                    },
                    // validator: (value) {
                    //   if (value == null || value.isEmpty || value.length < 3) {
                    //     return 'First Name must contain at least 3 characters';
                    //   } else if (value.contains(RegExp(r'^[0-9_\-=@,\.;]+$'))) {
                    //     return 'First Name cannot contain special characters';
                    //   }
                    // },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(60)),
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        // _submit();
                      }
                    },
                    child: const Text("Submit"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


              // InkWell(
              //     onTap: () {},
              //     child: DisplayImage(
              //       imagePath: image,
              //       onPressed: () {},
              //     )),