import 'package:flutter/material.dart';
import '../../../blocs/bloc_export.dart';
import '../../../widgets/ListView Widget/ListServiceWidget.dart';

class ServiceInfo extends StatefulWidget {
  const ServiceInfo({Key? key}) : super(key: key);

  @override
  State<ServiceInfo> createState() => _ServiceInfoState();
}

class _ServiceInfoState extends State<ServiceInfo> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServicesBloc, ServicesState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Service Setting"),
          ),
          body: ListView.builder(
              itemCount:state.allService.length,
              itemBuilder: (context, index) {
                return ListServiceWidget(service: state.allService[index]);
              }),
        );
      },
    );
  }
}
