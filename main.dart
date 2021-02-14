import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:silent/addPage.dart';
import 'package:silent/chatPage.dart';
import 'package:silent/settingsPage.dart';
import 'package:silent/fadeAnimation.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,]);
    return MaterialApp(
      title: 'Silent messages',
      color: Color.fromRGBO(129, 129, 197, 1.0),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromRGBO(129, 163, 197, 1.0),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(129, 129, 197, 1.0),
        leading: IconButton(
          icon: Icon(Icons.settings, color: Colors.black,),
          onPressed: () {
            Navigator.push(
              context,
              fadeAnimation(widget: settingPage()),
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add, color: Colors.black,),
            onPressed: () {
              Navigator.push(
                  context,
                  fadeAnimation(widget: addPage()),
              );
            },
          ),
          IconButton (
            icon: Icon(Icons.refresh, color: Colors.black,),
            onPressed: () {},
          )
        ],
      ),
      body: SafeArea(
        top: true,
        right: true,
        bottom: true,
        left: true,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 10),
                ButtonTheme(
                  minWidth: 200.0,
                  height: 50.0,
                  splashColor: Color.fromRGBO(129, 163, 197, 1.0),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(context, fadeAnimation(widget: chatPage()));
                    },
                    textColor: Colors.black,
                    child: Text('TEST CHAT', style: TextStyle(fontSize: 20),),
                    color: Color.fromRGBO(230, 230, 230, 1.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
