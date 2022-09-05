import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roshup_mobile_app_flutter_aws/amplifyconfiguration.dart';
import 'package:roshup_mobile_app_flutter_aws/services/provider.dart';
import 'blocs/bloc_export.dart';
import 'models/ModelProvider.dart';
import 'screens/Login/SignIn.dart';
import 'screens/app_platform.dart';

class MyPrepa extends StatefulWidget {
  const MyPrepa({Key? key}) : super(key: key);

  @override
  State<MyPrepa> createState() => _MyPrepaState();
}

class _MyPrepaState extends State<MyPrepa> {
  late bool isSign = false;
  bool _amplifyConfigured = false;
  bool _amplifyAuthComplete = false;
  get AmplifyModelProvider => null;

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
    _isSignedIn();
  }

  Future<void> _configureAmplify() async {
    final datastorePlugin =
        AmplifyDataStore(modelProvider: ModelProvider.instance);
    final api = AmplifyAPI(modelProvider: ModelProvider.instance);
    await Amplify.addPlugin(AmplifyAuthCognito());
    await Amplify.addPlugin(datastorePlugin);
    await Amplify.addPlugin(api);

    // Once Plugins are added, configure Amplify
    await Amplify.configure(amplifyconfig);
    // await getAuthStatus();
    try {
      setState(() {
        _amplifyConfigured = true;
      });
    } catch (e) {
      print("could not intialise Amplify $e");
    }
  }

  Future<void> getAuthStatus() async {
    var _auth = Amplify.Auth;
    _auth.fetchAuthSession().then((val) {
      if (val.isSignedIn) {
        setState(() {
          _amplifyAuthComplete = true;
        });
        Provider.of<AppStatus>(context, listen: false)
            .changeUserStatus(val.isSignedIn);
      } else {
        setState(() {
          _amplifyAuthComplete = true;
        });
        return SignIn();
      }
    });
  }

  Future<void> _isSignedIn() async {
    final session = await Amplify.Auth.fetchAuthSession();
    isSign = session.isSignedIn;
    Provider.of<AppStatus>(context, listen: false)
        .changeUserStatus(isSign);
    print('is sign in state is ${isSign}');
  }

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
      ],
      child: MaterialApp(
        theme: ThemeData(),
        title: 'My Prepa',
        home: loginState ? AppPlatform() : SignIn(),
      ),
    );
  }
}
