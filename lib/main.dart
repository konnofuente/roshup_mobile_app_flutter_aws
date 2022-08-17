import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roshup_mobile_app_flutter_aws/amplifyconfiguration.dart';
import 'package:roshup_mobile_app_flutter_aws/blocs/bloc_export.dart';
import 'package:roshup_mobile_app_flutter_aws/screens/app_platform.dart';
import 'package:roshup_mobile_app_flutter_aws/screens/home/home_screen.dart';
import 'models/ModelProvider.dart';
import 'screens/Login/SignIn.dart';
import 'services/provider.dart';



void main() {
  BlocOverrides.runZoned(
    () => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(
          create: (_) =>
              UserLoginStatus(userLoggedIn: false, isActExist: false)),
    ], child: MyApp())),
  ); 
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late List<String> value = [];
  late User user;
  bool _amplifyConfigured = false;
  bool _amplifyAuthComplete = false;

  @override
  void initState() {
    loadAppConfig();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> loadAppConfig() async {
    await _configureAmplify();
  }


  Future<void> _configureAmplify() async {
    final datastorePlugin =
        AmplifyDataStore(modelProvider: ModelProvider.instance);
    final api = AmplifyAPI();
    await Amplify.addPlugin(AmplifyAuthCognito());
    await Amplify.addPlugin(datastorePlugin);
    await Amplify.addPlugin(api);
    

    // Once Plugins are added, configure Amplify
    await Amplify.configure(amplifyconfig);
    await getAuthStatus();
    try {
      setState(() {
        _amplifyConfigured = true;
      });
    } catch (e) {
      print(e);
    }


  }

  Future<void> getAuthStatus() async {
    var _auth = Amplify.Auth;
    _auth.fetchAuthSession().then((val) {
      if (val.isSignedIn) {
        setState(() {
          _amplifyAuthComplete = true;
        });
        Provider.of<UserLoginStatus>(context, listen: false)
            .changeUserStatus(val.isSignedIn);
      } else {
        setState(() {
          _amplifyAuthComplete = true;
        });
        return SignIn();
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    var loginState = Provider.of<UserLoginStatus>(context).userLoggedIn;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserBloc(),
        ),
        BlocProvider(
          create: (context) => ServicesBloc(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(),
        title: 'Flutter AWS Amplify',
        home: loginState ? AppPlatform() : SignIn(),
        // home: AppPlatform(),
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