import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyCalculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PowerCalculationScreen(),
    );
  }
}

class PowerCalculationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: new MyCalculator(),
      ),
    );
  }
}

class MyCalculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Calculator();
}

class Calculator extends State<MyCalculator> {
  final controller_numberA = TextEditingController();
  final controller_numberB = TextEditingController();
  final my_form_key = GlobalKey<FormState>();

  String textToShow = "";

  void Sum() {
    if (my_form_key.currentState.validate()) {
      int numberA = int.parse(controller_numberA.text);
      int numberB = int.parse(controller_numberB.text);
      int result = numberA + numberB;

      setState(() {
        textToShow = "$numberA + $numberB = $result";
      });
    }
  }

  void Minus() {
    if (my_form_key.currentState.validate()) {
      int numberA = int.parse(controller_numberA.text);
      int numberB = int.parse(controller_numberB.text);
      int result = numberA - numberB;

      setState(() {
        textToShow = "$numberA - $numberB = $result";
      });
    }
  }

  void Times() {
    if (my_form_key.currentState.validate()) {
      int numberA = int.parse(controller_numberA.text);
      int numberB = int.parse(controller_numberB.text);
      int result = numberA * numberB;

      setState(() {
        textToShow = "$numberA * $numberB = $result";
      });
    }
  }

  void Divide() {
    if (my_form_key.currentState.validate()) {
      int numberA = int.parse(controller_numberA.text);
      int numberB = int.parse(controller_numberB.text);
      double result = numberA / numberB;

      setState(() {
        textToShow = "$numberA / $numberB = $result";
      });
    }
  }

  void Power() {
    if (my_form_key.currentState.validate()) {
      int numberA = int.parse(controller_numberA.text);
      int numberB = int.parse(controller_numberB.text);
      int result = calculatePower(numberA, numberB);
      setState(() {
        textToShow = "$numberA ^ $numberB = $result";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Form(
            key: my_form_key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                    controller: controller_numberA,
                    validator: (value) {
                      if (value.isEmpty) return "Please enter number";
                    },
                    decoration: InputDecoration(hintText: "Enter number"),
                    keyboardType: TextInputType.number),
                TextFormField(
                    controller: controller_numberB,
                    validator: (value) {
                      if (value.isEmpty) return "Please enter number";
                    },
                    decoration: InputDecoration(hintText: "Enter number"),
                    keyboardType: TextInputType.number),
                Text(
                  textToShow,
                  style: TextStyle(fontSize: 20.0),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: Sum,
                        child: Text('+'),
                      ),
                      RaisedButton(
                        onPressed: Minus,
                        child: Text('-'),
                      ),
                      RaisedButton(
                        onPressed: Power,
                        child: Text('^'),
                      )
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: Divide,
                        child: Text('/'),
                      ),
                      RaisedButton(
                        onPressed: Times,
                        child: Text('*'),
                      ),
                      RaisedButton(
                        child: Text("km/miles"),
                          onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MySecondRoute()),
                        );}
                      )
                    ])
              ],
            )));
  }

  int calculatePower(int numberA, int numberB) => pow(numberA, numberB);
}


class MySecondRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SecondRoute();
}

class SecondRoute extends State<MySecondRoute> {
  final controller_number = TextEditingController();
  final my_form_key = GlobalKey<FormState>();

  String textToShow = "";

  void KmToMiles() {
    if (my_form_key.currentState.validate()) {
      double number = double.parse(controller_number.text);
      double result = number * 1.60934;
      result.toString();
      setState(() {
        textToShow = "$result miles";
      });
    }
  }
  void MilesToKm() {
    if (my_form_key.currentState.validate()) {
      double number = double.parse(controller_number.text);
      double result = number * 0.621371;
      result.toString();
      setState(() {
        textToShow = "$result km";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Km to miles converter"),
      ),
      body: Form(
          key: my_form_key,
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(controller: controller_number,
                validator: (value) {
                  if (value.isEmpty) return "Please enter number";
                },
                decoration: InputDecoration(hintText: "Enter number"),
                keyboardType: TextInputType.number),
            Text( textToShow,
              style: TextStyle(fontSize: 20.0),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: KmToMiles,
                  child: Text('km/miles'),
                ),
                RaisedButton(
                  onPressed: MilesToKm,
                  child: Text('miles/km'),
                ),
                RaisedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Back to simple calculator")
                )
              ],
            )
          ],
        )
      ),
    );
  }
}
