import 'package:scale_city/mapPage.dart';

import 'main.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';

class SignIn extends StatefulWidget {
  //const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  bool seePass = true;
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  Widget _SignInErrorPopup(BuildContext context) {
    return new AlertDialog(
      title: const Text('Sign In Error'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Incorrect username and/or password."),
        ],
      ),
      actions: <Widget>[
        new TextButton(
          style: TextButton.styleFrom(
            primary: Colors.white,
            backgroundColor: Colors.red,
            padding: const EdgeInsets.all(10.0),
            textStyle: const TextStyle(fontSize: 15),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    String username = '';
    String password = '';

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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BackgroundVideo()),
                );
              },
            ),
          ),
          title: Text('Sign In'),
        ),
        body: new Container(
          child: new Column(
            children: [
              new Container(
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Username',
                  ),
                ),
              ),
              new Container(
                child: TextField(
                  controller: passwordController,
                  obscureText: seePass,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                    suffix: IconButton(
                        onPressed: () {
                          setState(() { //refresh UI
                            if(seePass){ //if passenable == true, make it false
                              seePass = false;
                            }else{
                              seePass = true; //if passenable == false, make it true
                            }
                          });
                        }, icon: Icon(seePass == true?Icons.remove_red_eye:Icons.password)),
                  ),
                ),
              ),
              new Container (
                  child: TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () {
                      if (usernameController.text == "admin" && sha512.convert(utf8.encode(passwordController.text)).toString() == "c1e13023c748e35e217935862d61937c8f0ab4ffd23e9ccb13f21ec0ed416976758e2c411fcfcd98db29585fa8fb09a53230742845557959247e993d8a02a27e") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MapPage(
                              title: 'Map Page',
                              user: usernameController.text,
                            ),
                          ),
                        );
                      }
                      else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => _SignInErrorPopup(context),
                        );
                      }
                    },
                    child: Text('Sign In'),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}