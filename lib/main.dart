import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

int mode = 0;

class MyApp extends StatefulWidget {
  stateMyApp createState() => new stateMyApp();
}

class stateMyApp extends State<MyApp> {
  var ran = new Random();
  int num;
  void flipped() {
    setState(() {
      mode = 1;
      num = ran.nextInt(99);
      num = num % 2;
    });
  }

  void back() {
    setState(() {
      mode = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text('Flip a coin'),
          ),
          body: mode == 0
              ? Center(
                  child: RaisedButton(
                    child: Text('Flip'),
                    onPressed: flipped,
                  ),
                )
              : Center(
                  child: Column(
                    children: <Widget>[
                      num == 0
                          ? Image.asset('assets/head.jpg')
                          : Image.asset('assets/tail.jpg'),
                      num == 0 ? Text('Heads') : Text('Tails'),
                      RaisedButton(
                        child: Text('Back'),
                        onPressed: back,
                      )
                    ],
                  ),
                )),
    );
  }
}
