import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:roshup_mobile_app_flutter_aws/blocs/bloc/services_bloc.dart';
import 'package:roshup_mobile_app_flutter_aws/blocs/bloc/user_bloc.dart';
import 'package:roshup_mobile_app_flutter_aws/models/ModelProvider.dart';
import '../../blocs/bloc/request_bloc.dart';
import '../../blocs/bloc/services_event.dart';
import '../../blocs/bloc/user_state.dart';
import 'design_course_app_theme.dart';

class SendRequestScreen extends StatefulWidget {
  final Service service;

  const SendRequestScreen({super.key, required this.service});
  @override
  SendRequestScreenState createState() => SendRequestScreenState();
}

class SendRequestScreenState extends State<SendRequestScreen> {
  String dropdownvalue = 'pdf';
  late String fileName;
  late String filePath;
  late FilePickerResult? path;
  late FilePickerResult? paths;
  late List<String> extensions;
  bool isLoadingPath = false;
  String fileType = "pdf";
  String paperformat = 'A4';
  String color = 'white';
  String FinalInstruction = " ";
  FilePickerResult? result;
  PlatformFile? file;
  List<File> files = [];
  late String requestTitle = '${widget.service.title} Request',
      requestContent = '';
  double minPriceController = 0, maxPriceController = 0;
  final _formKey = GlobalKey<FormState>();
  List<String> formTypes = [];
  List<String> paperFormats = [];
  List<String> colorTheme = [];
  bool isTitle = false;
  bool isContent = false;
  bool isColorPicker = false;
  Color pickerColor = Color(0xff443a49);
  Color primaryColor = Color.fromARGB(255, 255, 255, 255);
  Color secondaryColor = Color.fromARGB(255, 255, 255, 255);
  Color thirdColor = Color.fromARGB(255, 255, 255, 255);

  @override
  void initState() {
    getAllInput();
    super.initState();
  }

  void getAllInput() {
    formTypes = [];
    paperFormats = [];
    isTitle = false;
    isContent = false;
    isColorPicker = false;
    widget.service.forms!.forEach((element) {
      if (element.name == "Title") {
        isTitle = true;
      } else if (element.name == "Content") {
        isContent = true;
      } else if (element.name == 'File') {
        formTypes.addAll(element.accepted_values!);
      } else if (element.name == "PaperFormat") {
        paperFormats.addAll(element.accepted_values!);
      } else if (element.name == "ColorTheme") {
        isColorPicker = true;
      }
    });
  }

  void _openFileExplorer() async {
    print(formTypes);
    setState(() => isLoadingPath = true);
    try {
      paths = (await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowMultiple: true,
          allowedExtensions: formTypes));
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    }
    setState(() {
      if (paths != null) {
        files = paths!.paths.map((path) => File(path!)).toList();
      }
    });
  }

  void requestInstruction() {
    String FormatInst = '';
    String ColorInst = '';

    paperFormats.isEmpty
        ? null
        : FormatInst = "\nThe paper format to be use is : $paperformat";
    isColorPicker
        ? ColorInst =
            "The Variose Color Theme in this request are \n Primary Color:$primaryColor \n Secondary Color:$secondaryColor \n Third Color:$thirdColor"
        : null;

    FinalInstruction = "$requestContent $FormatInst $ColorInst";
  }

  void sendRequest(BuildContext context, User user, Service? service,
      String title, String content) {
    requestInstruction();
    final request = Request(
      title: title,
      content: FinalInstruction,
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

    context.read<ServicesBloc>().add(AddRequestServices(
        service: service!, context: context, requestService: requestService));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, Userstate) {
        return BlocBuilder<RequestBloc, RequestState>(
          builder: (context, Requeststate) {
            return MaterialApp(
              home: Scaffold(
                appBar: AppBar(
                  title: Text(
                    ' ${widget.service.title} Request',
                    style: TextStyle(fontSize: 15),
                  ),
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
                              displayHeading("Information", 20),
                              Form(
                                key: _formKey,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // isTitle
                                      //     ? getTextFormField("Title")
                                      //     : Container(),
                                      SizedBox(height: 10),
                                      isContent
                                          ? getTextFormField("Content")
                                          : Container(),
                                      SizedBox(height: 10),
                                    ]),
                              ),
                              displayHeading("Asset", 25),
                              formTypes.isEmpty ? Container() : getFilePicker(),
                              paperFormats.isEmpty
                                  ? Container()
                                  : getFormatDropdownButton(paperFormats),
                              isColorPicker ? getColorValues() : Container(),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
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
                            requestInstruction();
                            User user = Userstate.allUsers[0];
                            if (_formKey.currentState!.validate()) {
                              sendRequest(context, user, widget.service,
                                  requestTitle, requestContent);
                            }
                          },
                        )
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

  Padding displayHeading(String text, double size) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Text(text,
          style: TextStyle(fontSize: size, fontWeight: FontWeight.bold)),
    );
  }

  Padding displaySubHeading(String text, double size) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Text(text,
          style: TextStyle(fontSize: size, fontWeight: FontWeight.bold)),
    );
  }

  Widget getFilePicker() {
    return Column(
      children: [
        displayHeading("Select Media", 15),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
          child: RaisedButton(
            onPressed: () => _openFileExplorer(),
            child: Text("Open file Explorer"),
          ),
        ),
        Builder(
            builder: (BuildContext context) => Container(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  height: MediaQuery.of(context).size.height * 0.50,
                  child: Scrollbar(
                      child: ListView.separated(
                    itemCount: files != null ? files.length : 1,
                    itemBuilder: (BuildContext context, int index) {
                      final file = files[index];
                      final bool isMultiPath = files != null;
                      final int fileNo = index + 1;
                      final String name = 'File $fileNo : ' + file.path;
                      final filePath = file.path;
                      return ListTile(
                        title: Text(
                          name,
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(),
                  )),
                )),
      ],
    );
  }

  Widget getFormatDropdownButton(List<String> item) {
    return Column(
      children: [
        displayHeading("Select Paper Format", 15),
        DropdownButton(
            value: paperformat,
            items: item
                .map((String item) =>
                    DropdownMenuItem<String>(child: Text(item), value: item))
                .toList(),
            onChanged: (String? newValue) {
              setState(() {
                paperformat = newValue!;
              });
              print(paperformat);
            }),
      ],
    );
  }

  void showColorPicker(Color currentcolor, String ColorName) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("Pick a color"),
              content: SingleChildScrollView(
                child: ColorPicker(
                  pickerColor: currentcolor,
                  paletteType: PaletteType.hueWheel,
                  onColorChanged: (pickedcolor) {
                    pickerColor = pickedcolor;
                  },
                ),
              ),
              actions: <Widget>[
                ElevatedButton(
                  child: const Text('Got it'),
                  onPressed: () {
                    switch (ColorName) {
                      case "primaryColor":
                        {
                          setState(() => primaryColor = pickerColor);
                        }
                        break;

                      case "secondaryColor":
                        {
                          setState(() => secondaryColor = pickerColor);
                        }
                        break;

                      case "thirdColor":
                        {
                          setState(() => thirdColor = pickerColor);
                        }
                        break;
                    }
                    Navigator.of(context).pop();
                  },
                ),
              ]);
        });
  }

  Widget getColorValues() {
    return Column(
      children: [
        displayHeading("Click Circle to chose color theme", 15),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: primaryColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 5.0,
                        spreadRadius: 1.0,
                      ),
                    ]),
                width: 80,
                height: 80,
                child: Center(
                  child: InkWell(
                    onTap: () {
                      showColorPicker(primaryColor, "primaryColor");
                    },
                    child: Center(
                        child: Text(
                      "Primary Color",
                      style: TextStyle(fontSize: 10),
                    )),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: secondaryColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 5.0,
                        spreadRadius: 1.0,
                      ),
                    ]),
                width: 80,
                height: 80,
                child: Center(
                  child: InkWell(
                    onTap: () {
                      showColorPicker(secondaryColor, "secondaryColor");
                    },
                    child: Center(
                        child: Text(
                      "Secondary Color",
                      style: TextStyle(fontSize: 10),
                    )),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: thirdColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 5.0,
                        spreadRadius: 1.0,
                      ),
                    ]),
                width: 80,
                height: 80,
                child: Center(
                  child: InkWell(
                    onTap: () {
                      showColorPicker(thirdColor, "thirdColor");
                    },
                    child: Center(
                        child: Text(
                      "Third Color",
                      style: TextStyle(fontSize: 10),
                    )),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget getTextFormField(String Value) {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: 'Enter Request ${Value}',
        border: OutlineInputBorder(),
      ),
      onChanged: (val) {
        switch (Value) {
          case "Title":
            {
              setState(() => requestTitle = val);
            }
            break;
          case "Content":
            {
              setState(() => requestContent = val);
            }
            break;
        }
      },
    );
  }
}
