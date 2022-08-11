import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roshup_mobile_app_flutter_aws/widgets/service_item.dart';

import '../blocs/bloc_export.dart';
import '../models/SERVICE.dart';

class ServiceGridView extends StatelessWidget {
  const ServiceGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServicesBloc, ServicesState>(
      builder: (context, state) {
        final List<SERVICE> allService = state.allService;
        return MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: GridView(
            padding: const EdgeInsets.all(25),

            // ignore: sort_child_properties_last
            children: state.allService
                .map((serviceItem) => ServiceItem(
                    service: serviceItem,))
                .toList(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
               crossAxisSpacing:20,
            ),
          ),
        );
      },
    );
  }
}
