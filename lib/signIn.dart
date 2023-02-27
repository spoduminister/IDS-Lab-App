import 'main.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;

void signIn(String email, String password) async {
  try {
    final userCreds =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    final user = userCreds.user;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Incorrect email or password.');
    }
  }
}

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool seePass = false;
  TextEditingController emailCont = TextEditingController();
  TextEditingController passwCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SignIn',
      home: Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.all(0.0),
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            title: Text('Sign In'),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: TextField(
                        controller: emailCont,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.person)),
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextField(
                        obscureText: seePass,
                        controller: passwCont,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                seePass = !seePass;
                              });
                            },
                            icon: Icon(seePass
                                ? Icons.remove_red_eye
                                : Icons.password),
                          ),
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: ElevatedButton(
                        onPressed: () {
                          signIn(emailCont.text, passwCont.text);
                        },
                        child: Text('Login',
                            style: TextStyle(color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text('Don\'t have an account?'),
                          TextButton(
                            child: Text('Register',
                                style: TextStyle(color: Colors.blue)),
                          ),
                        ],
                      ))
                ],
              ),
            ),
          )),
    );
  }
}
