import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:roshup_mobile_app_flutter_aws/blocs/bloc/services_bloc.dart';
import 'package:roshup_mobile_app_flutter_aws/blocs/bloc/user_bloc.dart';

import '../../blocs/bloc/request_bloc.dart';
import '../../blocs/bloc/services_event.dart';
import '../../blocs/bloc/user_state.dart';
import '../../models/Request.dart';
import '../../models/RequestStatus.dart';
import '../../models/Service.dart';
import '../../models/User.dart';
import '../ServiceScreen/design_course_app_theme.dart';

class RequestScreen extends StatefulWidget {
  final Service service;

  const RequestScreen({super.key, required this.service});
  @override
  RequestScreenState createState() => RequestScreenState();
}

class RequestScreenState extends State<RequestScreen> {
  late String fileName;
  late String filePath;
  late FilePickerResult? path;
  late FilePickerResult? paths;
  late List<String> extensions;
  bool isLoadingPath = false;
  bool isMultiPick = false;
  late FileType fileType = FileType.any;
  List<PlatformFile> files = [];
  late String titleController = '', contentController = '';
  double minPriceController = 0, maxPriceController = 0;
  final _formKey = GlobalKey<FormState>();

  void _openFileExplorer() async {
    setState(() => isLoadingPath = true);
    try {
      if (isMultiPick) {
        path = null;
        paths = (await FilePicker.platform.pickFiles(
            type: FileType.custom, allowedExtensions: ['jpg', 'pdf', 'doc']));
      } else {
        path = (await FilePicker.platform.pickFiles(
            type: FileType.custom, allowedExtensions: ['jpg', 'pdf', 'doc']));
        paths = null;
      }
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    }
    if (!mounted) return;

    setState(() {
      if (path != null) {
        files = path!.files;
      }
    });
  }

  List<String> Listitems = [
    "audio",
    "image",
    "video",
    "any",
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, Userstate) {
        return BlocBuilder<RequestBloc, RequestState>(
          builder: (context, Requeststate) {
            return MaterialApp(
              home: Scaffold(
                appBar: AppBar(
                  title: const Text('Send Request'),
                ),
                body: Center(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15.0),
                                child: Text("Information",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Form(
                                key: _formKey,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextFormField(
                                        keyboardType: TextInputType.text,
                                        decoration: const InputDecoration(
                                          labelText: 'Your Request title',
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
                                        keyboardType: TextInputType.text,
                                        decoration: const InputDecoration(
                                          labelText: 'Enter some instructions',
                                          border: OutlineInputBorder(),
                                        ),
                                        onChanged: (val) {
                                          setState(
                                              () => contentController = val);
                                        },
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter some text';
                                          }
                                          return null;
                                        },
                                      ),
                                    ]),
                              ),

                              // DropdownButton(
                              //     hint: const Text('Select file type'),
                              //     value: fileType,
                              //     items: [
                              //       DropdownMenuItem(
                              //         child: Text('Audio'),
                              //         value: FileType.audio,
                              //       ),
                              //       DropdownMenuItem(
                              //         child: Text('Image'),
                              //         value: FileType.image,
                              //       ),
                              //       DropdownMenuItem(
                              //         child: Text('Video'),
                              //         value: FileType.video,
                              //       ),
                              //       DropdownMenuItem(
                              //         child: Text('Any'),
                              //         value: FileType.any,
                              //       ),
                              //     ],
                              //     onChanged: (value) => setState(() {
                              //           fileType = value.toString() as FileType;
                              //         })),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
                          child: Text("Asset",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints.tightFor(width: 200.0),
                          child: SwitchListTile.adaptive(
                            title: Text('Pick multiple files',
                                textAlign: TextAlign.right),
                            onChanged: (bool value) =>
                                setState(() => isMultiPick = value),
                            value: isMultiPick,
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 50.0, bottom: 20.0),
                          child: RaisedButton(
                            onPressed: () => _openFileExplorer(),
                            child: Text("Open file picker"),
                          ),
                        ),
                        Builder(
                            builder: (BuildContext context) => Container(
                                  padding: const EdgeInsets.only(bottom: 30.0),
                                  height:
                                      MediaQuery.of(context).size.height * 0.50,
                                  child: Scrollbar(
                                      child: ListView.separated(
                                    itemCount: files != null ? files.length : 1,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final file = files[index];
                                      final bool isMultiPath = files != null;
                                      final int fileNo = index + 1;
                                      final String name = 'File $fileNo : ' +
                                          (isMultiPath ? file.name : fileName);
                                      final filePath =
                                          isMultiPath ? file.path : path;
                                      return ListTile(
                                        title: Text(
                                          name,
                                        ),
                                        subtitle: Text(file.path!),
                                      );
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) =>
                                            Divider(),
                                  )),
                                )),
                        ElevatedButton(
                          child: const Text(
                            'REQUEST SERVICE',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              letterSpacing: 0.0,
                              color: DesignCourseAppTheme.nearlyWhite,
                            ),
                          ),

                          onPressed: () {
                            
                            User user = Userstate.allUsers[0];
                            if (_formKey.currentState!.validate()) {
                              sendRequest(context, user, widget.service,
                                  titleController, contentController);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                )),
              ),
            );
          },
        );
      },
    );
  }
}

void sendRequest(BuildContext context, User user, Service service, String title,
    String content) {
  

  final request = Request(
    title: title,
    content: content,
    status: RequestStatus.PENDING,
    user: user,
    service: service,
    messages: [],
  );

   List<Request> requestService = [];
  requestService.add(request); 

  context
      .read<RequestBloc>()
      .add(AddRequest(request: request, context: context));

  context.read<ServicesBloc>().add(
      AddRequestServices(service: service, context: context, requestService: requestService));
}
