//import 'dart:js';

import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';
import 'mapPage.dart';
import 'carList.dart';
import 'signIn.dart';
import 'register.dart';

import 'package:firebase_core/firebase_core.dart';

//**********Login and About PAGE***********
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(BackgroundVideo());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black12,
        accentColor: Colors.orange,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stateless'),
          //backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}

class BackgroundVideo extends StatefulWidget {
  @override
  _BackgroundVideoState createState() => _BackgroundVideoState();
}

class AboutUs extends StatefulWidget {
  @override
  _AboutUs createState() => _AboutUs();
}

class _BackgroundVideoState extends State<BackgroundVideo> {
  // TODO 4: Create a VideoPlayerController object.
  VideoPlayerController _controller;

  // TODO 5: Override the initState() method and setup your VideoPlayerController
  @override
  void initState() {
    super.initState();
    // Pointing the video controller to our local asset.
    _controller = VideoPlayerController.asset("assets/Background_Video.mp4")
      ..initialize().then((_) {
        // Once the video has been loaded we play the video and set looping to true.
        _controller.play();
        _controller.setLooping(true);
        // Ensure the first frame is shown after the video is initialized.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          // Adjusted theme colors to match logo.
          //primaryColor: Color(0xffb55e28),
          //accentColor: Color(0xffffd544),
          ),
      home: SafeArea(
        child: Scaffold(
          // TODO 6: Create a Stack Widget
          body: Stack(
            children: <Widget>[
              // TODO 7: Add a SizedBox to contain our video.
              SizedBox.expand(
                child: FittedBox(
                  // If your background video doesn't look right, try changing the BoxFit property.
                  // BoxFit.fill created the look I was going for.
                  fit: BoxFit.fill,
                  child: SizedBox(
                    width: _controller.value.size?.width ?? 0,
                    height: _controller.value.size?.height ?? 0,
                    child: VideoPlayer(_controller),
                  ),
                ),
              ),
              LoginWidget()
            ],
          ),
        ),
      ),
    );
  }

  // TODO 8: Override the dipose() method to cleanup the video controller.
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

// A basic login widget with a logo and a form with rounded corners.
//test
class LoginWidget extends StatelessWidget {
  const LoginWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Center(
            child: Image(
              image: AssetImage("assets/IDS_logo.png"),
              width: 300.0,
            ),
          ),
        ),
        SizedBox(
          height: 75.0,
        ),
        Container(
          decoration: new BoxDecoration(
            color: Colors.white.withAlpha(200),
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(10.0),
              topRight: const Radius.circular(10.0),
              bottomLeft: const Radius.circular(10.0),
              bottomRight: const Radius.circular(10.0),
            ),
          ),
          padding: EdgeInsets.all(16),
          width: 300,
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ButtonTheme(
                minWidth: 300.0,
                child: ElevatedButton(
                  child: Text(
                    'Login',
                    style:
                        TextStyle(/*color: Color(0xffffd544),*/ fontSize: 20),
                  ),
                  onPressed: () {
                    // Call to Google OAuth to allow user to sign in
                    //done();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignIn()),
                    );
                  },
                ),
              ),
              ButtonTheme(
                minWidth: 300.0,
                child: ElevatedButton(
                  child: Text(
                    'Register',
                    style:
                        TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Register(),
                      ),
                    );
                  },
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                    fontSize: 15,
                    /*color: Color(0xff00539f),*/
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutUs()),
                  );
                },
                child: const Text('About Us'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _AboutUs extends State {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Pointing the video controller to our local asset.
    _controller = VideoPlayerController.asset("assets/Background_Video.mp4")
      ..initialize().then((_) {
        // Once the video has been loaded we play the video and set looping to true.
        _controller.play();
        _controller.setLooping(true);
        // Ensure the first frame is shown after the video is initialized.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.blue,
          title: Text('Who are we?', style: TextStyle(color: Colors.black)),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            tooltip: 'Back',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: Colors.yellow[300],
        body: new Container(
            child: new Column(children: <Widget>[
          new Center(
            child: new Text(
              'Welcome to Professor Andreas Malikopoulos’ Information and Decision Science (IDS) Lab!\n',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          new Container(
            height: 250.0,
            width: 400.0,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black),
            ),
            child: Text(
                'The overarching goal of the IDS Lab is to enhance understanding of large-scale, complex cyber-physical systems (CPS) and establish rigorous theories and algorithms for making CPS able to realize how to improve their performance over time while interacting with their environment. The emphasis is on applications related to emerging mobility systems (e.g., connected and automated vehicles, shared mobility), sociotechnical systems, social media, and smart cities.',
                style: TextStyle(fontSize: 18)),
          ),
          Padding(padding: EdgeInsets.all(10)),
          new Center(
            child: new Text('Contact Us',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          new Text('Location: 130 Academy St, Newark, DE 19716',
              style: TextStyle(fontSize: 18)),
          new Text('Andreas Malikopoulos: andreas@udel.edu',
              style: TextStyle(fontSize: 18)),
          Image.asset('assets/spencerlocation.png', height: 335.0),
        ])));
  }
}
