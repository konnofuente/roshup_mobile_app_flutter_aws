import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roshup_mobile_app_flutter_aws/blocs/bloc_export.dart';
import 'MyPrepa.dart';
import 'blocs/bloc/request_bloc.dart';
import 'services/provider.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(
          create: (_) => AppStatus(
              userLoggedIn: false, isActExist: false, isLoading: false)),
    ], child: MyApp())),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 

  @override
  Widget build(BuildContext context) {
    var loginState = Provider.of<AppStatus>(context).userLoggedIn;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserBloc(),
        ),
        BlocProvider(
          create: (context) => ServicesBloc(),
        ),
        BlocProvider(
          create: (context) => RequestBloc(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(),
        title: 'Main AWS Amplify',
        home: const MyPrepa(),
      ),
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
