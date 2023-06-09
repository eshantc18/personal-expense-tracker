import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:personalexpense/Widgets/sign_in.dart';

import 'LoggedIn.dart';

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          return LoggedIn(2);
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Something went wrong'),
          );
        }
        return SignIn();
      }),
    ));
  }
}
