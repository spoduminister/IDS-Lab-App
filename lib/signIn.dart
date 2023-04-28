import 'main.dart';
import 'mapPage.dart';
import 'package:flutter/material.dart';
import 'register.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:page_transition/page_transition.dart';

// Firebase instance that will be used for signing in/out
FirebaseAuth auth = FirebaseAuth.instance;

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool seePass = false;
  TextEditingController emailCont = TextEditingController();
  TextEditingController passwCont = TextEditingController();

  // error message function that will take in a string to display to the user
  // defining the nature of the error that occur when a sign in was attempted
  void errorMsg(String errMsg) {
    // Creating the alert that will be shown
    AlertDialog alert = AlertDialog(
      title: Text('Error!'),
      content: Text(errMsg),
      actions: [
        ElevatedButton(
          child: Text('Close'),
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              padding: EdgeInsets.all(0)),
        )
      ],
    );
    // Showing the alert on screen
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  // Attempts to invoke Firebase's signInWithEmailAndPassword function with the
  // information that the user provided. If the sign in is unsuccessful, an error
  // will display on screen.
  void signIn(String email, String password) async {
    try {
      final userCreds = await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then(
            (value) => {
              if (value.user != null) {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: ((context) {
                  return MapPage();
                })))
              }
            },
          );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        errorMsg('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        errorMsg('Incorrect email or password.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SignIn',
      home: Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.all(0.0),
              child: IconButton(
                icon: Icon(Icons.home),
                color: Colors.white,
                onPressed: () {
                  Navigator.push(context, PageTransition(type: PageTransitionType.leftToRight, child: BackgroundVideo()));
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
                        obscureText: !seePass,
                        controller: passwCont,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            onPressed: () {
                              // Button will show/hide the user's input for password
                              setState(() {
                                seePass = !seePass;
                              });
                            },
                            icon: Icon(seePass
                                ? Icons.password
                                : Icons.remove_red_eye),
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
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Register()));
                              }),
                        ],
                      ))
                ],
              ),
            ),
          )),
    );
  }
}
