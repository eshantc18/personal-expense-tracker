import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:personalexpense/Widgets/LoggedIn.dart';
import 'package:personalexpense/Widgets/Login.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    Future createAccount() async {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          height: 600,
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
              Row(
                children: [
                  SizedBox(
                    width: 65,
                  ),
                  SizedBox(
                    width: 260,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 92, 0, 150)),
                      child: Center(
                        child: Text("Register"),
                      ),
                      onPressed: createAccount,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 65,
                  ),
                  SizedBox(
                    width: 260,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 92, 0, 150)),
                      child: Center(
                        child: Text("Login"),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => StreamBuilder(
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
                                )));
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
