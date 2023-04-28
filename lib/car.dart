import 'main.dart';
import 'mapPage.dart';
import 'package:flutter/material.dart';
//import 'carSocket.dart';
import 'carList.dart';

List<String> assetsImages;
List<String> carID;
List<String> desiredXPOS;
List<String> currentXPOS;
List<String> carOnlineStatus;
List<String> carInstructionStatus;
List<String> carInfoStrings;
List<bool> isInUseList;

List<Car> finalList;
List<Car> carList;
Car car1;



class Car extends StatelessWidget {
  const Car({Key key}) : super(key: key);

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

List<Car> carClassList;

void carPopulate(carCard) {
  carList.add(car1);
  carList.add(car1);
  carList.add(car1);
  carList.add(car1);
}

/*void getCarInformation() {
  carInfoStrings = getCarInfoCompleted();
}*/

void parseIntoStrings(carInfoStrings) {
  int count = 0;
  for (int i = 0; i < carInfoStrings.length; i++) {
    if (i % 3 == 0 || i == 0) {
      carID[count] = carInfoStrings[i];
    }
    if ((i % 3) - 1 == 0) {
      desiredXPOS[count] = carInfoStrings[i];
    }
    if ((i % 3) - 2 == 0) {
      currentXPOS[count] = carInfoStrings[i];
    }

    count++;
  }
}


/*
class info {
  void carPopulate(carCard) {
    Car car1;
    carList.add(car1);
    carList.add(car1);
    carList.add(car1);
    carList.add(car1);
  }
}

class info1{
  void getCarInformation() {
    carInfoStrings = getCarInfoCompleted();
  }
}

class info2{
  void parseIntoStrings(carInfoStrings) {
    int count = 0;
    for (int i = 0; i < carInfoStrings.length; i++) {
      if (i % 3 == 0 || i == 0) {
        carID[count] = carInfoStrings[i];
      }
      if ((i % 3) - 1 == 0) {
        desiredXPOS[count] = carInfoStrings[i];
      }
      if ((i % 3) - 2 == 0) {
        currentXPOS[count] = carInfoStrings[i];
      }

      count++;
    }
  }
}

class info3{
  void isInUse() {
    for (int i = 0; i < carID.length; i++) {
      if (desiredXPOS[i] == currentXPOS[i])
        isInUseList[i] = false;
      else
        isInUseList[i] = true;
    }
  }
}

class carss implements info,info1,info2,info3{
  void isInUse(){
    print("check_For_isInUse");
  }
  void parseIntoStrings(carInfoStrings){
    print("check_For_parseIntoStrings");
  }
  void getCarInfomration(){
    print("check_for_getcarInformation");
  }
  void carPopulation(){
    print("check_for_carpopulation");
  }
}
 */