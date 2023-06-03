import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:personalexpense/Widgets/authentication.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    Future login() async {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          height: 500,
          width: 350,
          child: Column(
            children: [
              SizedBox(
                height: 80,
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
                width: 300,
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.email_outlined),
                    labelText: 'Email-ID',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.lock),
                    labelText: 'Password',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 100,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 92, 0, 150)),
                  child: Center(
                    child: Text("Login"),
                  ),
                  onPressed: login,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
