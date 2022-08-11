import 'package:flutter/material.dart';
import 'package:roshup_mobile_app_flutter_aws/models/ModelProvider.dart';
import 'package:roshup_mobile_app_flutter_aws/screens/Home/HostScreen/DetailServiceScreen.dart';

import '../blocs/bloc_export.dart';

class ServiceItem extends StatelessWidget {
  final SERVICE service;
  const ServiceItem({Key? key, required this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServicesBloc, ServicesState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(15),
          // ignore: sort_child_properties_last
          child: Center(
            child: Column(
              children: [
                Text(service.name),
                Text(service.amoungt.toString()),
                Row(
                  children: [
                    TextButton(
                        onPressed: () => {
                          context.read<ServicesBloc>().add(DeleteServices(service: service))
                        },
                        child: Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),

                      TextButton(
                        onPressed: () => {
                           Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  DetailServiceScreen(service: service)),
                          )
                        },
                        child: Icon(
                          Icons.read_more,
                          color: Colors.black,
                        ))
                  ],
                )
              ],
            ),
          ),
          decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [
                Color.fromARGB(255, 19, 111, 240),
                Color.fromARGB(255, 67, 142, 246)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(15)),
        );
      },
    );
  }
}
