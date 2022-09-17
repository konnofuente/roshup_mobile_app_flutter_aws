import 'package:flutter/material.dart';
import 'package:roshup_mobile_app_flutter_aws/widgets/appbar_widget.dart';
import '../../blocs/request_export.dart';
import '../home/app_theme.dart';
import 'ListActivityRequest.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestBloc, RequestState>(
      builder: (context, state) {
        return Scaffold(
          appBar: buildAppBar('Activities'),
          body: ListView.builder(
              itemCount:state.allRequests.length,
              itemBuilder: (context, index) {
                return ListActivityScreen(request: state.allRequests[index]);
              }),
        );
      },
    );
  }
}
