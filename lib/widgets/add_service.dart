import 'package:flutter/material.dart';




class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    return Container(
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
            controller: descriptionController,
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
                    // var task = TODO(
                        
                    //     name: titleController.text,
                    //     description: descriptionController.text,
                    //     isComplete: false, 
                    //     isRemove: false);
                    // titleController.text.isNotEmpty
                    //     ? context.read<TasksBloc>().add(AddTask(task: task))
                    //     : print(
                    //         'No value entered!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1');
                    // Navigator.pop(context);
                  },
                  child: const Text('Add Service'))
            ],
          ),
        ],
      ),
    );
  }
}