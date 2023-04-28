import 'main.dart';
import 'mapPage.dart';
import 'package:flutter/material.dart';
import 'car.dart';
import 'carList.dart';
import 'test.dart';

/* To-Do
Online status indicator
dynamic car card
car socket testing
click on car card to bring to instructions page
send flag to map page
*/

//**********CAR-List PAGE***********
class MyHome extends StatelessWidget {
  const MyHome({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IDS Lab',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyHomePage1(title: 'IDS Car List'),
    );
  }
}

class MyHomePage1 extends StatefulWidget {
  const MyHomePage1({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage1> createState() => _CarList();
}


//List<String> litems = ["Car 1", "Car 2", "Car 3", "Car 4"];
var dataString = "0.0221610069275,manta_127,0.0,0.0,0.0,0.0,0,0,8.0,0.0,,0.0365769863129\n0.0337178707123,manta_128,1.0,1.0,2.0,2.0,3,1,1.1,4.0,,0.0545248985291\n";
Map<String, String> carImages = {
  'manta_127': 'assets/images/car1.1.png',
  'manta_128': 'assets/images/car2.1.png',
};

Map<String, Map<String, String>> carDetails = {
  'manta_127': {'color': 'N/A', 'description': 'N/A'},
  'manta_128': {'color': 'blue', 'description': 'This car is blue.'},
  'manta_129': {'color': 'yellow', 'description': 'This car is yellow.'},
};
String selectedCarDescription;
String selectedCarColor;

class _CarList extends State<MyHomePage1> {
  var activeScreen = carListScreen;
  Map<String, List<String>> availability = {'available': [], 'unavailable': []};

  @override
  void initState() {
    super.initState();
    // Call the isAvailable function to get the availability of cars
    availability = isAvailable(dataString);
  }

  @override
  Widget build(BuildContext context) {
    int totalAvailableCars = availability['available'].length;
    int totalUnavailableCars = availability['unavailable'].length;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(
            activeScreen.title,
            style: const TextStyle(
              fontFamily: 'bebas-neue',
              fontSize: 25.0,
            ),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            )
          ]
      ),
      drawer: Drawer(
          child: ListView(
              children: [
                UserAccountsDrawerHeader(
                    accountName: Text('IDS LAB'),
                    accountEmail: Text('Welcome')
                ),
                ListTile(
                  title: const Text('Ride'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MapPage(
                          title: 'Map Page',
                        ),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Car List'),
                  onTap: () {
                    // Update the state of the app.
                    Navigator.pop(context);
                  },
                ),
              ]
          )
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey[400]))
            ),
            child: Text(
              totalAvailableCars > 0 ? 'Available Cars: $totalAvailableCars' : 'No available cars: ❌',
              style: TextStyle(
                //fontWeight: FontWeight.bold,
                fontSize: 18,
                color: totalAvailableCars > 0 ? Colors.black : Colors.red,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: totalAvailableCars + totalUnavailableCars,
              itemBuilder: (BuildContext context, int index) {
                String hostname = index < totalAvailableCars
                    ? availability['available'][index]
                    : availability['unavailable'][index - totalAvailableCars];
                //String carName = hostname.split('_')[0];
                //String carModel = hostname.split('_')[1];
                String imagePath =
                    carImages[hostname] ?? 'assets/images/default_car.png';
                bool isAvailable = index < totalAvailableCars;
//#sdf
                return Opacity(
                  opacity: isAvailable ? 1.0 : 0.5,
                  child: GestureDetector(
                    onTapDown: (_) {
                      // Display the color and other description
                      String carColor = carDetails[hostname]['color'];
                      String carDescription = carDetails[hostname]['description'];
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            height: 200,
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('$hostname Details', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                                  SizedBox(height: 10.0),
                                  Text('Color: $carColor'),
                                  SizedBox(height: 10.0),
                                  Text('Description: $carDescription'),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    onTapUp: (_) {},
                    child: Container(
                      decoration: BoxDecoration(
                        border: isAvailable ? Border(bottom: BorderSide(width: 1.0, color: Colors.grey[400])) : null,
                      ),
                      width: double.infinity,
                      height: 100,
                      padding: EdgeInsets.all(10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 150, // adjust this value as needed
                                  child: Image.asset(
                                    imagePath,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '$hostname',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Text(
                                      isAvailable ? 'Available' : 'Unavailable ❌',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: isAvailable ? Colors.green : Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );


              },
            ),
          ),
        ],
      ),
    );
  }
}




//////////////////////////////////////////////////
///thre code below are the origrnal codes, it can run before the connection
///there is a import in the main which i commented it, when run it, need to import this file

class Screen {
  final String title;
  final WidgetBuilder contentBuilder;

  Screen({this.title, this.contentBuilder});
}

//IDS Car List
final Screen carListScreen = Screen(
    title: 'IDS Car List',
    contentBuilder: (BuildContext content) {
      return ListView(
        children: [
          carNumDisplay(),
          _Car(),
          _Car2(),
          _Car3(),
          /*
          _Car4(),
          _Car5(),
          _Car6(),
          _Car7(),
          _Car8(),
          _Car9(),
          _Car10(),
          _Car11(),
          _Car12(),
          */
          //...carList
        ],
      );
    });

class carNumDisplay extends StatelessWidget {
  const carNumDisplay({Key key}) : super(key: key);
  final int totalCars = 3;
  final int currNumCars = 2;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text("Total Number of Cars: " + totalCars.toString()),
        subtitle: Text("Number of Available Cars: " + currNumCars.toString()),
      ),
    );
  }
}

class _Car extends StatelessWidget {
  const _Car({Key key}) : super(key: key);
  final String carID = "manta_127";
  final bool available = true;

//get car1 image
  @override
  Widget build(BuildContext context) {
    return Card(
      color: available == true ? Colors.green : Colors.white,
      elevation: 10.0,
      child: Column(
        children: [
          Image.asset(
            'assets/images/car1.1.png',
            width: double.infinity,
            height: 150.0,
            fit: BoxFit.cover,
          ),
          Row(
            children: [
              //Text("Dark blue Sport"),
              Text("Car ID: " + carID)
            ],
          )
        ],
      ),
    );
  }
}

class _Car2 extends StatelessWidget {
  const _Car2({Key key}) : super(key: key);
  final String carID = "manta_104";
  final bool available = false;

  // final String headImageAssetPath;
  // final String title;

  // _Car({
  //   this.headImageAssetPath, this.title;
  // });

//get car2 image

  @override
  Widget build(BuildContext context) {
    return Card(
      color: available == true ? Colors.green : Colors.white,
      elevation: 10.0,
      child: Column(
        children: [
          Image.asset(
            'assets/images/car2.1.png',
            width: double.infinity,
            height: 150.0,
            fit: BoxFit.cover,
          ),
          Row(
            children: [
              //Text('Blue Sedan'),
              Text("Car ID: " + carID)
            ],
          )
        ],
      ),
    );
  }
}

class _Car3 extends StatelessWidget {
  const _Car3({Key key}) : super(key: key);
  final String carID = "manta_122";
  final bool available = true;
  // final String headImageAssetPath;
  // final String title;

  // _Car({
  //   this.headImageAssetPath, this.title;
  // });

//get car3 image

  @override
  Widget build(BuildContext context) {
    return Card(
      color: available == true ? Colors.green : Colors.white,
      elevation: 10.0,
      child: Column(
        children: [
          Image.asset(
            'assets/images/car3.1.png',
            width: double.infinity,
            height: 150.0,
            fit: BoxFit.cover,
          ),
          Row(
            children: [
              //Text('White Jeep'),
              Text("Car ID: " + carID)
            ],
          )
        ],
      ),
    );
  }
}

class _Car4 extends StatelessWidget {
  const _Car4({Key key}) : super(key: key);

  // final String headImageAssetPath;
  // final String title;

  // _Car({
  //   this.headImageAssetPath, this.title;
  // });

//get car1 image
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      child: Column(
        children: [
          Image.asset(
            'assets/images/car1.1.png',
            width: double.infinity,
            height: 150.0,
            fit: BoxFit.cover,
          ),
          Row(
            children: [
              Text("Dark blue Sport"),
            ],
          )
        ],
      ),
    );
  }
}

class _Car5 extends StatelessWidget {
  const _Car5({Key key}) : super(key: key);

  // final String headImageAssetPath;
  // final String title;

  // _Car({
  //   this.headImageAssetPath, this.title;
  // });

//get car2 image

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      child: Column(
        children: [
          Image.asset(
            'assets/images/car2.1.png',
            width: double.infinity,
            height: 150.0,
            fit: BoxFit.cover,
          ),
          Row(
            children: [
              Text('Blue Sedan'),
            ],
          )
        ],
      ),
    );
  }
}

class _Car6 extends StatelessWidget {
  const _Car6({Key key}) : super(key: key);

  // final String headImageAssetPath;
  // final String title;

  // _Car({
  //   this.headImageAssetPath, this.title;
  // });

//get car3 image

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      child: Column(
        children: [
          Image.asset(
            'assets/images/car3.1.png',
            width: double.infinity,
            height: 150.0,
            fit: BoxFit.cover,
          ),
          Row(
            children: [
              Text('White Jeep'),
            ],
          )
        ],
      ),
    );
  }
}

class _Car7 extends StatelessWidget {
  const _Car7({Key key}) : super(key: key);

  // final String headImageAssetPath;
  // final String title;

  // _Car({
  //   this.headImageAssetPath, this.title;
  // });

//get car1 image
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      child: Column(
        children: [
          Image.asset(
            'assets/images/car1.1.png',
            width: double.infinity,
            height: 150.0,
            fit: BoxFit.cover,
          ),
          Row(
            children: [
              Text("Dark blue Sport"),
            ],
          )
        ],
      ),
    );
  }
}

class _Car8 extends StatelessWidget {
  const _Car8({Key key}) : super(key: key);

  // final String headImageAssetPath;
  // final String title;

  // _Car({
  //   this.headImageAssetPath, this.title;
  // });

//get car2 image

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      child: Column(
        children: [
          Image.asset(
            'assets/images/car2.1.png',
            width: double.infinity,
            height: 150.0,
            fit: BoxFit.cover,
          ),
          Row(
            children: [
              Text('Blue Sedan'),
            ],
          )
        ],
      ),
    );
  }
}

class _Car9 extends StatelessWidget {
  const _Car9({Key key}) : super(key: key);

  // final String headImageAssetPath;
  // final String title;

  // _Car({
  //   this.headImageAssetPath, this.title;
  // });

//get car3 image

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      child: Column(
        children: [
          Image.asset(
            'assets/images/car3.1.png',
            width: double.infinity,
            height: 150.0,
            fit: BoxFit.cover,
          ),
          Row(
            children: [
              Text('White Jeep'),
            ],
          )
        ],
      ),
    );
  }
}

class _Car10 extends StatelessWidget {
  const _Car10({Key key}) : super(key: key);

  // final String headImageAssetPath;
  // final String title;

  // _Car({
  //   this.headImageAssetPath, this.title;
  // });

//get car1 image
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      child: Column(
        children: [
          Image.asset(
            'assets/images/car1.1.png',
            width: double.infinity,
            height: 150.0,
            fit: BoxFit.cover,
          ),
          Row(
            children: [
              Text("Dark blue Sport"),
            ],
          )
        ],
      ),
    );
  }
}

class _Car11 extends StatelessWidget {
  const _Car11({Key key}) : super(key: key);

  // final String headImageAssetPath;
  // final String title;

  // _Car({
  //   this.headImageAssetPath, this.title;
  // });

//get car2 image

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      child: Column(
        children: [
          Image.asset(
            'assets/images/car2.1.png',
            width: double.infinity,
            height: 150.0,
            fit: BoxFit.cover,
          ),
          Row(
            children: [
              Text('Blue Sedan'),
            ],
          )
        ],
      ),
    );
  }
}

class _Car12 extends StatelessWidget {
  const _Car12({Key key}) : super(key: key);

  // final String headImageAssetPath;
  // final String title;

  // _Car({
  //   this.headImageAssetPath, this.title;
  // });

//get car3 image

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      child: Column(
        children: [
          Image.asset(
            'assets/images/car3.1.png',
            width: double.infinity,
            height: 150.0,
            fit: BoxFit.cover,
          ),
          Row(
            children: [
              Text('White Jeep'),
            ],
          )
        ],
      ),
    );
  }
}

final Iterable<Widget> cars = [
  _Car(),
  _Car3(),
  _Car4(),
  _Car5(),
  _Car6(),
  _Car7(),
  _Car8(),
  _Car9(),
  _Car10(),
  _Car11(),
  _Car12()
];