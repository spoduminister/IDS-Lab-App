import 'dart:collection';
import 'dart:math';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:scale_city/line.dart';

import 'poly.dart';
import 'utils.dart';
import 'package:meta/meta.dart';

import 'main.dart';
import 'carList.dart';

import 'pathPage.dart';
import 'detailPage.dart';

import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'poly.dart';

import 'clientpage.dart';
import 'signIn.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:page_transition/page_transition.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class Area {
  String name = '';
  double x = 0;
  double y = 0;
  double width = 0;
  double height = 0;

  Area({this.name, this.x, this.y, this.width, this.height});
}

class MapPage extends StatefulWidget {
  const MapPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<StatefulWidget> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  // Scale of map size
  final double _sheetH = 230.0;
  final double _mapP = 100.0;
  final double _mapW = 1000.0;
  final double _mapH = 1000.0;

  List<MapNode> mapNodeList = []; //The set to store the map node info
  List<MapLine> mapLineList = []; //The set to store the map line info
  List<MapArc> mapArcsList = []; //The set to store the map arc info

  List<MapLine> drawLines = []; //The set to store the map line info
  List<MapArc> drawArcs = []; //The set to store the map arc info

  Socket socket;

  final TextEditingController _startTextEditingController =
      TextEditingController(text: '');
  final TextEditingController _endTextEditingController =
      TextEditingController(text: '');
  final TransformationController _tc = TransformationController();

  final _startFocusNode = FocusNode();
  final _endFocusNode = FocusNode();

  // Area in map
  List<Polygon> polys = []; // Temporary automatic generation

  // state
  double startTapX = 0; //the x axis of the position that user tapped
  double startTapY = 0;//the y axis of the position that user tapped
  double endTapX = 0;//the x axis of the start position
  double endTapY = 0;//the x axis of the end position
  String startNode = "";
  String endNode = "";

  bool isStart = true;
  bool isEnd = false;
  bool showArea = false;

  void signOut() async {
    await auth.signOut();
  }

  //Initialze the state of page
  @override
  void initState() {
    connect();
    super.initState();
    // print("initstate");
    var mapConvert =
        MapConvert.fromCsv(mapWidth: _mapW, mapHeight: _mapW, padding: _mapP);
    mapNodeList = MapNode.fromCsv(mapConvert);
    mapLineList = MapLine.fromCsv(mapConvert);
    mapArcsList = MapArc.fromCsv(mapConvert);
    if (kDebugMode) {
      print(
          "mapNodeList length,${mapNodeList.length}, ${mapLineList.length}, ${mapArcsList.length}");
    }


    //The map scale translate
    _tc.value = Matrix4.identity()
      ..translate(-(_mapW + _mapP * 2) / 4, -(_mapH + _mapP * 2) / 4);
    _onTap(x: _mapW / 2, y: _mapH / 2, isInit: true);

    _startFocusNode.addListener(_setInput);
    _endFocusNode.addListener(_setInput);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if (kDebugMode) {
      print("dispose");
    }
    _startFocusNode.removeListener(_setInput);
    _endFocusNode.removeListener(_setInput);
    socket.destroy();
    super.dispose();
  }

  _setInput() {
    if (kDebugMode) {
      print("setInput 0:$isStart,$isEnd");
    }
    setState(() {
      if (!_startFocusNode.hasFocus && !_endFocusNode.hasFocus) {
        return;
      }
      isStart = _startFocusNode.hasFocus;
      isEnd = _endFocusNode.hasFocus;
    });

    if (kDebugMode) {
      print("setInput 1: $isStart,$isEnd");
    }
  }


  //socket connection function
  connect() async {
    String ip = "172.17.104.234"; //robin
    //String ip = "192.168.1.245"; //mainframe ip
    socket = await Socket.connect(ip, 54000);

  }

  // function that gets called upon tapping the screen
  _onTap({double x, double y, isInit = false, areaName = ''}) {
    double _min = 0;
    String _minName;
    for (var node in mapNodeList) {
      var dis = sqrt(pow((node.x - x).abs(), 2) + pow((node.y - y).abs(), 2));
      if (_minName?.isEmpty ?? true) {
        _min = dis;
        _minName = node.name;
      }
      _min = min(_min, dis);
      _minName = _min == dis ? node.name : _minName;
    }
    if (_minName != null) {
      // find line
      var closedLines = mapLineList
          .where((e) => e.name.toLowerCase() == (_minName ?? '').toLowerCase())
          .toList();
      // find arc line
      var closedArcs = mapArcsList
          .where((e) => e.name.toLowerCase() == (_minName ?? '').toLowerCase())
          .toList();

      if (kDebugMode) {
        print("choose line:${closedLines.length}, ${closedArcs.length}");
      }

    }
    if (kDebugMode) {
      print("min distance:$_minName: $_min,$x, $y");
      print("min distance2:$isStart,$isEnd,$isInit");
    }

    String pointer = '${x.ceil()},${y.ceil()},area: ${_minName ?? ''}';
    if (isStart || isInit) {
      _startTextEditingController.value = TextEditingValue(text: pointer);
      setState(() {
        startTapX = x;
        startTapY = y;
        startNode = _minName;
      });
    }
    if (isEnd || isInit) {
      _endTextEditingController.value = TextEditingValue(text: pointer);
      setState(() {
        endTapX = x;
        endTapY = y;
        endNode = _minName;
      });

      //THE SOCKET PASSES IN START/END HERE AND THEN READS OUT THE PATH
      if (socket != null) {
        try {
          socket.write("1" + "/" + startNode+endNode);
          socket.listen(onData);
        } on Exception catch (exception) {
          print(exception.toString());
        }
      }


    }

  }

  //The function that calls when the socket receives data
  onData(Uint8List data){
    String output = utf8.decode(data);
    String path = output.split('/')[1];
    print("path: $path");
    List<String> pathLines = path.split(',');
    drawArcs = [];
    drawLines = [];
    for(String l in pathLines){
      if(l.startsWith('A')){
        var arcs = mapArcsList.where((e) => e.name.toLowerCase() == l.toLowerCase());
        if (arcs.isEmpty){
          print("arc "+l+" does not exist");
        } else {
          var arc = arcs.first;
          drawArcs.add(arc);
        }
      } else if (l.startsWith('S')){
        var lines = mapLineList.where((e) => e.name.toLowerCase() == l.toLowerCase());
        if (lines.isEmpty){
          print("line " + l + " does not exist");
        } else {
          var line = lines.first;
          drawLines.add(line);
        }
        //Lines and Arcs are drawn further down in the build function
      }
    }
  }


  //Build the current page
  @override
  Widget build(BuildContext context) {
    int indexstart;
    return Scaffold(
      appBar: AppBar(
        title: Text('Map View'),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
              //Confirm button for going to clientpage and send the info to client page
              icon: const Icon(Icons.check, color: Colors.black),
              tooltip: 'confirm',
              onPressed: () {
                for (int i = 0;
                    i < _startTextEditingController.text.length;
                    i++) {
                  if (_startTextEditingController.text[i] == ':') {
                    indexstart = i + 1;
                    print("555555555555555555555555555555555");
                    print(i);
                  }
                }
                var route = MaterialPageRoute(
                  builder: (BuildContext context) => ClientPage(
                      value: _startTextEditingController.text
                              .substring(indexstart) +
                          _endTextEditingController.text.substring(indexstart)),
                );
                Navigator.of(context).push(route);
              })
        ],
      ),
      drawer: Drawer(
          //The set of buttons that can help user goes into the startpage, car info page.
          child: ListView(children: [
        UserAccountsDrawerHeader(
            accountName: Text('IDS LAB'),
            accountEmail: Text('Welcome ${auth.currentUser.email}')),
        ListTile(
          title: const Text('Ride'),
          onTap: () {
            // Update the state of the app.
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text('Car List'),
          onTap: () {
            // Update the state of the app.
            // //Navigator.pop(context);
            ////runApp(const MyHome());
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyHome()),
            );
          },
        ),
        ListTile(
          title: Text('Sign Out'),
          onTap: () {
            // Update the state of the app.
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.leftToRight,
                    child: SignIn()));
            signOut();
          },
        ),
      ])),
      body: SizedBox.expand(
        child: Padding(
          padding: EdgeInsets.only(bottom: _sheetH),
          child: InteractiveViewer(
            constrained: false,
            minScale: 0.01,
            maxScale: 2,
            transformationController: _tc,
            // onInteractionUpdate: (ScaleUpdateDetails details) {
            //   print("onInteractionUpdate ${_tc.value.getTranslation()}");
            // },
            child: Padding(
              // width: 702.0 * 2,
              // height: 676.0 * 2,
              padding: EdgeInsets.all(_mapP),
              child: GestureDetector(
                  onTapUp: (TapUpDetails details) {
                    // RenderBox box = context.findRenderObject();
                    if (kDebugMode) {
                      print(
                          "onTapUp ${details.globalPosition},  ${details.localPosition}}");
                    }
                    _onTap(
                        x: details.localPosition.dx,
                        y: details.localPosition.dy);
                  },
                  child: Stack(
                    children: [
                      Container(
                        width: _mapW,
                        height: _mapH,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage("assets/citymap.png"),
                          fit: BoxFit.cover,
                        )),
                      ),
                      if (showArea)
                        for (var node in mapNodeList)
                          Positioned(
                            top: node.y,
                            left: node.x,
                            child: Text(node.name),
                          ),
                      // for (var area in _bigAreas)
                      //   Positioned(
                      //     top: area.y,
                      //     left: area.x,
                      //     child: GestureDetector(
                      //       onTapUp: (TapUpDetails details) {
                      //         // RenderBox box = context.findRenderObject();
                      //         // print("onTapUp1 ${details.globalPosition},  ${details.localPosition}}, area name ${area.name}");
                      //         _onTap(x:details.localPosition.dx + area.x,y: details.localPosition.dy + area.y,areaName: area.name);
                      //
                      //       },
                      //       child: Container(
                      //         width: area.width,
                      //         height: area.height,
                      //         child: Center(child: Text('',style: const TextStyle(color: Colors.black,fontSize: 30),),),
                      //         decoration: const BoxDecoration(
                      //             color: Colors.transparent
                      //         ),
                      //       ),
                      //     ),
                      //
                      //   ),

                      Positioned(
                        //Draw the arc or line that user tapped
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: CustomPaint(
                          painter: Line(mapArcs: drawArcs, mapLines: drawLines),
                        ),
                      ),
                      // for (var item in drawLines)
                      //   if (item.nodes.length >=2)
                      //     Positioned(
                      //       top: min(item.nodes[0].y,item.nodes[1].y),
                      //       left: min(item.nodes[0].x,item.nodes[1].x),
                      //       width:(item.nodes[0].x - item.nodes[1].x).abs(),
                      //       height: (item.nodes[0].y - item.nodes[1].y).abs(),
                      //       child: CustomPaint(
                      //         painter: Line(isFromTopLeft: true, mapLine: item),
                      //       ),
                      //     ),
                      // for (var item in drawArcs)
                      //   if (item.nodes.length >=2)
                      //     Positioned(
                      //       top: min(item.nodes[0].y,item.nodes[1].y),
                      //       left: min(item.nodes[0].x,item.nodes[1].x),
                      //       width:(item.nodes[0].x - item.nodes[1].x).abs(),
                      //       height: (item.nodes[0].y - item.nodes[1].y).abs(),
                      //       child: CustomPaint(
                      //         painter: Line(isFromTopLeft: true, mapArc: item),
                      //       ),
                      //     ),

                      // Positioned(
                      //   top: min(startTapY, endTapY) + 25,
                      //   left: min(startTapX,endTapX),
                      //   width:(startTapX - endTapX).abs(),
                      //   height: (startTapY - endTapY).abs(),
                      //   child: CustomPaint(
                      //     painter: Line(isFromTopLeft:(startTapY < endTapY && startTapX < endTapX) || (startTapY > endTapY && startTapX > endTapX)),
                      //     // child: Center(
                      //     //   child: Text(
                      //     //     "Blade Runner",
                      //     //     style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
                      //     //   ),
                      //     // ),
                      //   ),
                      // ),
                      Positioned(
                        //show the map pin
                        top: startTapY - 25,
                        left: startTapX - 25,
                        child: Image.asset(
                          'assets/map_pin.png',
                          width: 50,
                          height: 50,
                        ),
                      ),
                      Positioned(
                        //show the end pin on the map
                        top: endTapY - 25,
                        left: endTapX - 25,
                        child: Image.asset(
                          'assets/map_pin_end.png',
                          width: 50,
                          height: 50,
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        //for showing the start point and end point position information that used tapped
        width: double.infinity,
        height: _sheetH,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextField(
                readOnly: true,
                focusNode: _startFocusNode,
                decoration: const InputDecoration(
                    hintText: "Please choose a starting point",
                    border: OutlineInputBorder()),
                controller: _startTextEditingController,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  readOnly: true,
                  focusNode: _endFocusNode,
                  decoration: const InputDecoration(
                      hintText: "Please choose a end point",
                      border: OutlineInputBorder()),
                  controller: _endTextEditingController,
                ),
              ),
              // RaisedButton(
              //     child: new Text("Submit"),
              //     onPressed: () {
              //       var route = new MaterialPageRoute(
              //         builder: (BuildContext context) => new ClientPage(
              //             value:
              //                 _startTextEditingController.text.substring(11) +
              //                     _endTextEditingController.text.substring(11)),
              //       );
              //       Navigator.of(context).push(route);
              //     }),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          setState(() {
                            showArea = !showArea;
                          });
                        },
                        child: Text(showArea
                            ? 'hide area'
                            : 'show area')), //button for showing the index on the map?
                    TextButton(
                        onPressed: () {
                          //button for going to detailed page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailPage()),
                          );
                        },
                        child: const Text('go detail')),
                  ],
                ),
              ),
            ],
          ),
        ),
        decoration: const BoxDecoration(color: Colors.black12),
      ),
    );
  }
}
