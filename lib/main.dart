import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as Http;
import 'dart:convert';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              padding: EdgeInsets.all(10),
              onPressed: () {
                debugPrint("merhaba");
                _GetAllUserFromMysql("get_all_user.php").then((value) {
                  debugPrint(value);
                  _SendAllUserToFireStore(value);
                });
              },
              color: Colors.green,
              child: Text(
                "Kullanıcıları eşitle",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<String> _GetAllUserFromMysql(String category) async {
    var url = 'http://192.168.10.97/asistan_ascim';
    var response = await Http.get('$url/$category');
    print(response);
    return response.body;
  }

  void _SendAllUserToFireStore(String value) {
    debugPrint("0");
    var allUsers = jsonDecode(value);
    debugPrint("1");

    for (Map user in allUsers) {
      debugPrint(user.toString());
      _firestore
          .collection("users")
          .add(user)
          .then((value) => debugPrint("ekleme başarılı"));
      //_firestore.collection("users").doc("batuhan seçkin").set(user,SetOptions(merge: true)).then(
      //(value) => debugPrint("ekleme başarılı"),

    }
  }
}
