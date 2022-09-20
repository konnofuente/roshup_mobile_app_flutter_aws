import 'package:amplify_api/model_queries.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roshup_mobile_app_flutter_aws/widgets/appbar_widget.dart';
import '../../blocs/request_export.dart';
import '../../models/Request.dart';
import '../../widgets/dailog_loading.dart';
import '../home/app_theme.dart';
import '../../widgets/ListView Widget/ListActivityRequest.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  void initState() {
    queryRequestList();
    super.initState();
  }

  Future<void> queryRequestList() async {
    try {
      final request = ModelQueries.list(Request.classType);
      final response = await Amplify.API.query(request: request).response;

      final Requests = response.data!.items;
      if (Requests == null) {
        print('errors: ${response.errors}');
      }
      // ignore: avoid_single_cascade_in_expression_statements, use_build_context_synchronously
      Provider.of<RequestBloc>(context, listen: false)
        ..emit(RequestState(allRequests: Requests));
    } on ApiException catch (e) {
      print('Could not retrieve Request from api!!!!!!!!!!11111 $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestBloc, RequestState>(
      builder: (context, state) {
        return Scaffold(
          appBar: buildAppBar('Activities'),
          body:state.allRequests.isEmpty ? 
          showLoading(context, "Check Connection") :
           ListView.builder(
              itemCount: state.allRequests.length,
              itemBuilder: (context, index) {
                return ListActivityScreen(request: state.allRequests[index]);
              }),
        );
      },
    );
  }
}


