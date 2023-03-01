import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;

void register(String email, String password) async {
  try {
    final userCreds = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _Register();
}

class _Register extends State<Register> {
  bool seePass = false;
  TextEditingController emailCont = TextEditingController();
  TextEditingController passwCont = TextEditingController();
  TextEditingController passwConfirmCont = TextEditingController();

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
                        register(emailCont.text, passwCont.text);
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
