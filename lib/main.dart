import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:personalexpense/Widgets/authentication.dart';
import 'package:personalexpense/Widgets/homePage.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
// import './Widgets/userTransaction.dart';

// void main() => runApp(MyApp());
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   // Allows only potrait mode
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PerExpense',
        home: HomePage(),
      ),
    );
  }
}
