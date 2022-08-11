// screen_b.dart
import 'package:flutter/material.dart';
import 'package:roshup_mobile_app_flutter_aws/models/ModelProvider.dart';
import 'package:roshup_mobile_app_flutter_aws/widgets/service_item.dart';

import '../../blocs/bloc_export.dart';
import '../../widgets/add_service.dart';
import '../../widgets/service_grid_view.dart';

class HostScreen extends StatelessWidget {
  const HostScreen({Key? key}) : super(key: key);

  //   void _addTask(BuildContext context) {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (context) => SingleChildScrollView(
  //           child: Container(
  //               padding: EdgeInsets.only(
  //                   bottom: MediaQuery.of(context).viewInsets.bottom),
  //               child: AddServiceScreen())));
  // }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServicesBloc, ServicesState>(
      builder: (context, state) {
        final List<SERVICE> allService = state.allService;
        return Column(
          children: [
            Expanded(child: ServiceGridView(),),
            FloatingActionButton(
               onPressed: () {
              // _addTask(context);
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddServiceScreen()),
            );
            },
            child: const Icon(
              Icons.add,),
            )
            
          ],
        );
      },
    );
  }
}

