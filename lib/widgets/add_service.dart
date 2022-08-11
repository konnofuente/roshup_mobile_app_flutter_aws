import 'package:flutter/material.dart';
import 'package:roshup_mobile_app_flutter_aws/blocs/bloc_export.dart';
import 'package:roshup_mobile_app_flutter_aws/models/ModelProvider.dart';

class AddServiceScreen extends StatefulWidget {
  const AddServiceScreen({Key? key}) : super(key: key);

  @override
  State<AddServiceScreen> createState() => _AddServiceScreenState();
}

class _AddServiceScreenState extends State<AddServiceScreen> {
  late String input_name;
  late int input_agt;
  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController amoungtController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              autofocus: true,
              controller: titleController,
              decoration: const InputDecoration(
                label: Text('Enter Service Name'),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              autofocus: true,
              keyboardType: TextInputType.number,
              controller: amoungtController,
              decoration: const InputDecoration(
                label: Text('Enter Amoungt'),
                border: OutlineInputBorder(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () => {Navigator.pop(context)},
                    child: const Text('cancel')),
                ElevatedButton(
                    onPressed: () {
                      var Service = SERVICE(
                          name: titleController.text,
                          // name:input_name,
                          // amoungt: input_agt,
                          amoungt: int.parse(amoungtController.text)
                          );
                      titleController.text.isNotEmpty
                          ? context
                              .read<ServicesBloc>()
                              .add(AddServices(service: Service))
                          : print(
                              'No value entered!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1');
                      Navigator.pop(context);
                    },
                    child: const Text('Add Service'))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
