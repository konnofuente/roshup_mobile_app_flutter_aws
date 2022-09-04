import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/bloc/services_bloc.dart';
import '../blocs/bloc/services_event.dart';
import '../models/PriceRange.dart';
import '../models/Service.dart';

class AddServiceScreen extends StatefulWidget {
  const AddServiceScreen({Key? key}) : super(key: key);

  @override
  State<AddServiceScreen> createState() => _AddServiceScreenState();
}

class _AddServiceScreenState extends State<AddServiceScreen> {
  @override
  Widget build(BuildContext context) {
    const appTitle = 'Add Service';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  late String titleController = '', contentController = '';
  double minPriceController = 0, maxPriceController = 0;
  final _formKey = GlobalKey<FormState>();

  double priceRange() {
    return (maxPriceController + minPriceController) / 2;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: 30.0, vertical: 20.0), // or any other value,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: 'Enter Service Name',
                border: OutlineInputBorder(),
              ),
              onChanged: (val) {
                setState(() => titleController = val);
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                labelText: 'Enter Service Content',
                border: OutlineInputBorder(),
              ),
              onChanged: (val) {
                setState(() => contentController = val);
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Service content';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter min price',
                border: OutlineInputBorder(),
              ),
              onChanged: (val) {
                setState(() => minPriceController = double.parse(val));
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter atleast minimum price';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Enter Max price',
                border: OutlineInputBorder(),
              ),
              onChanged: (val) {
                setState(() => maxPriceController = double.parse(val));
              },
 
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // TextButton(
                //     onPressed: () => {Navigator.pop(context)},
                //     child: const Text('cancel')),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      var service = Service(
                        title: titleController,
                        content: contentController,
                        priceRange: PriceRange(
                            min: minPriceController,
                            max: maxPriceController,
                            price: priceRange()),
                      );
                      context
                          .read<ServicesBloc>()
                          .add(AddServices(service: service,context: context));
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   const SnackBar(content: Text('Processing Data')),
                      // );
                      print(service);
                      _formKey.currentState?.reset();
                    }
                 
                    
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
























//   late String input_name;
//   late int input_agt;
//   final bool validate = false;

//   // void dispose() {
//   //   super.dispose();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     final formKey = GlobalKey<FormState>();
//     // TextEditingController titleController = TextEditingController();
//     // TextEditingController contentController = TextEditingController();
//     // TextEditingController minPriceController = TextEditingController();
//     // TextEditingController maxPriceController = TextEditingController();

//     late String titleController=' ',contentController=' ';
//     double minPriceController =0,maxPriceController = 0;

//     bool emptyValidatation() {
//       if (titleController.isEmpty ||
//           contentController.isEmpty ||
//           minPriceController.toString().isEmpty ||
//           maxPriceController.toString().isEmpty) {
//         return true;
//       }
//       return false;
//     }
//     bool priceValidatation() { 
//       if (maxPriceController <
//           minPriceController) {
//         return true;
//       }
//       return false;
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add Task'),
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             Form(
//                key: formKey,
//                child: Column(
//                       children: [
//                   TextFormField(
//                     obscureText: true,
//                     keyboardType: TextInputType.text,
//                      onChanged: (val) {
//                           setState(() => titleController = val);
                     
//                         },
//                     decoration: const InputDecoration(
//                       labelText: 'Enter Service Name',
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   TextFormField(
//                     obscureText: true,
//                     keyboardType: TextInputType.text,
//                      onChanged: (val) {
//                           setState(() => contentController= val);
//                         },
                     
//                     decoration: const InputDecoration(
//                       labelText: 'Enter Service description',
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   TextFormField(
//                     obscureText: true,
//                     keyboardType: TextInputType.number,
//                      onChanged: (val) {
//                           setState(() => 
//                      minPriceController = double.parse(val));
//                         },
//                     decoration: const InputDecoration(
//                       labelText: 'Enter Service Min price',
//                       border: OutlineInputBorder(),
                      
//                     ),
//                   ),
//                   SizedBox(height: 10),

//                   TextFormField(
//                     obscureText: true,
//                     keyboardType: TextInputType.number,
//                      onChanged: (val) {
//                           setState(() => 
//                      maxPriceController = double.parse(val));
//                         },
//                     decoration: const InputDecoration(
//                       labelText:'Enter Enter Max price',
//                       border: OutlineInputBorder(),
                      
//                     ),
//                   ),
                  
//           ],
//         ),
//             ),
//           Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       TextButton(
//                           onPressed: () => {Navigator.pop(context)},
//                           child: const Text('cancel')),
//                       ElevatedButton(
//                           onPressed: () {
//                             // var service = Service(
//                             //     title: titleController.text,
//                             //     priceRange: PriceRange(price: double.parse(contentController.text) ),);
//                             // titleController.text.isNotEmpty
//                             //     ? context
//                             //         .read<ServicesBloc>()
//                             //         .add(AddServices(service: service))
//                             //     : print(
//                             //         'No value entered!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1');
//                             // // Navigator.pop(context);
//                             // setState(() {
//                             //   emptyValidatation()
//                             //       ? _validate = true
//                             //       : _validate = false;
//                             // });
//                             // titleController.clear();
//                             // contentController.clear();
//                           },
//                           child: const Text('Add Service'))
//                     ],
//                   ),
//           ]
//       ),
//     ));
//   }