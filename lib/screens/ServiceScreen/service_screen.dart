import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../blocs/bloc_export.dart';
import '../../models/ModelProvider.dart';
import '../home/app_theme.dart';
import 'design_course_app_theme.dart';
import 'all_service_list_view.dart';

class ServiceScreen extends StatefulWidget {
  @override
  _ServiceScreenState createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  @override
  void initState() {
    queryServiceList();
    super.initState();
  }

  Future<void> queryServiceList() async {
    try {
      final request = ModelQueries.list(Service.classType);
      final response = await Amplify.API.query(request: request).response;

      final Services = response.data!.items;
      if (Services == null) {
        print('errors: ${response.errors}');
      }
      // ignore: avoid_single_cascade_in_expression_statements, use_build_context_synchronously
      Provider.of<ServicesBloc>(context, listen: false)
        ..emit(ServicesState(allService: Services));
    } on ApiException catch (e) {
      print('Could not retrieve Service from api!!!!!!!!!!11111 $e');
    }
  }

  bool multiple = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: DesignCourseAppTheme.nearlyWhite,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            appBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: <Widget>[
                      Flexible(
                        child: getAllServiceUI(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getAllServiceUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18, right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'All Service',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              letterSpacing: 0.27,
              color: DesignCourseAppTheme.darkerText,
            ),
          ),
          Flexible(
            child: AllServiceListView(
              callBack: () {},
            ),
          )
        ],
      ),
    );
  }

  Widget appBar() {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isLightMode = brightness == Brightness.light;

    return SizedBox(
      height: AppBar().preferredSize.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8),
            child: Container(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 4),
                child: Text(
                  'Roshub Service',
                  style: TextStyle(
                    fontSize: 22,
                    color: isLightMode ? AppTheme.darkText : AppTheme.white,
                    // color: AppTheme.darkText ,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, right: 8),
            child: Container(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
              color: isLightMode ? Colors.white : AppTheme.nearlyBlack,
              // color:  AppTheme.nearlyBlack,
            ),
          ),
        ],
      ),
    );
  }
}
