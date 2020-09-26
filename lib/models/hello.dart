import 'package:flutter/material.dart';

void main() {
  runApp(
    new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        accentColor: Colors.orange,
      ),
      home: new Scaffold(
        appBar: AppBar(
          title: Text(
            "Hello World",
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            debugPrint("Hello");
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: Container(
          color: Colors.green.shade100,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                Icons.add,
                size: 64,
                color: Colors.pink,
              ),
              Icon(
                Icons.access_alarm,
                size: 64,
                color: Colors.purple,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
