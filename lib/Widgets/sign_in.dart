import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:personalexpense/Widgets/LoggedIn.dart';
import 'package:personalexpense/Widgets/Login.dart';
import 'package:personalexpense/Widgets/authentication.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'SignUp.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
            child: Card(
          elevation: 11,
          child: Container(
              height: 500,
              width: 350,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: CircleAvatar(
                      child: CircleAvatar(
                        child: Image.asset('images/logo.png'),
                        backgroundColor: const Color.fromARGB(255, 92, 0, 150),
                        radius: 20,
                      ),
                      backgroundColor: const Color.fromARGB(255, 92, 0, 150),
                      radius: 30,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Welcome !!',
                    style: TextStyle(fontSize: 32),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Personal Expense Tracker',
                    style: const TextStyle(
                      color: Color.fromARGB(255, 92, 0, 150),
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: 220,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 92, 0, 150)),
                      child: Row(
                        children: const [
                          FaIcon(FontAwesomeIcons.userLock),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Login"),
                        ],
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => StreamBuilder(
                                  stream:
                                      FirebaseAuth.instance.authStateChanges(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return LoggedIn(1);
                                    } else if (snapshot.hasError) {
                                      return Center(
                                        child: Text('Something went wrong'),
                                      );
                                    }
                                    return Login();
                                  },
                                ))));
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 220,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 92, 0, 150)),
                      child: Row(
                        children: const [
                          Icon(Icons.app_registration_outlined),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Register"),
                        ],
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignUp(),
                        ));
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 220,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 92, 0, 150)),
                      child: Row(
                        children: const [
                          FaIcon(FontAwesomeIcons.google),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Sign Up with Google"),
                        ],
                      ),
                      onPressed: () {
                        final provider = Provider.of<GoogleSignInProvider>(
                            context,
                            listen: false);
                        provider.googleLogin();
                      },
                    ),
                  ),
                ],
              )),
        )),
      ),
    );
  }
}
