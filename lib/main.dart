import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_signin_example/page/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_signin_example/provider/_badminton_provider.dart';
import 'package:google_signin_example/provider/_football_provider.dart';
import 'package:google_signin_example/provider/_futsal_provider.dart';
import 'package:google_signin_example/provider/_gokart_provider.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Play.IT';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
    providers: [
      Provider<FutsalProvider>(create: (context) =>FutsalProvider(),),
      Provider<FootballProvider>(create: (context) =>FootballProvider(),),
      Provider<BadmintonProvider>(create: (context) =>BadmintonProvider(),),
      Provider<GokartProvider>(create: (context) =>GokartProvider(),),
      // Provider<SomethingElse>(create: (_) => SomethingElse()),
      // Provider<AnotherThing>(create: (_) => AnotherThing()),
    ],
    // return ChangeNotifierProvider(
    // create: (context) =>FutsalProvider(),
    child: MaterialApp(
      home: HomePage(),
    ),
    );
  }
}

