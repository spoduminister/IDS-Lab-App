import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _Register();
}

class _Register extends State<Register> {
  bool seePass = false;
  TextEditingController emailCont = TextEditingController();
  TextEditingController passwCont = TextEditingController();
  TextEditingController passwConfirmCont = TextEditingController();

  // Displays an alert showing why the user's registration failed
  void errorMsg(String msg) {
    // Creating the alert that will be shown
    AlertDialog alert = AlertDialog(
      title: Text('Error!'),
      content: Text(msg),
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

  // Displays an alert showing the user that their registration was successful
  void success() {
     // Creating the alert that will be shown
    AlertDialog alert = AlertDialog(
      title: Text('Success!'),
      content: Text('Your registration was succesful. You can now sign in!'),
      actions: [
        ElevatedButton(
          child: Text('OKAY'),
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
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

  // Attempts to invoke Firebase's createUserWithEmailAndPassword function with
  // the information that the user provided. If the registration is unsuccessful
  // an error will display on screen.
  Future<UserCredential> register(
      BuildContext context, String email, String password) async {
    try {
      final userCreds = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) {
        return user;
      });
      success();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        errorMsg('The password you have entered is too weak.');
      } else if (e.code == 'email-already-in-use') {
        errorMsg('The email entered is already in use by another account.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Registration',
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
                  )),
              title: Text('Registration'),
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
                            setState(() {
                              // Button will show/hide the user's input for password
                              seePass = !seePass;
                            });
                          },
                          icon: Icon(
                              seePass ? Icons.password : Icons.remove_red_eye),
                        ),
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: ElevatedButton(
                      onPressed: () {
                        Future<UserCredential> user =
                            register(context, emailCont.text, passwCont.text);
                        if (user != null) {}
                      },
                      child: Text('Register',
                          style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ))
              ],
            )))));
  }
}
