import 'package:flutter/material.dart';

// ignore: camel_case_types
class settingPage extends StatefulWidget {
  @override
  _settingPageState createState() => _settingPageState();
}

// ignore: camel_case_types
class _settingPageState extends State<settingPage> {
  int pickedInCombo = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(129, 129, 197, 1.0),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
                _spaceBetweenWidget(10),
                Text(
                  'STATUS',
                  style: TextStyle(fontSize: 30, decoration: TextDecoration.underline),
                ),
                _spaceBetweenWidget(5),
                Text(
                  'Last time connected into server: ' + DateTime.now().day.toString() + "/" +
                      DateTime.now().month.toString() + "/" + DateTime.now().year.toString() + " " +
                      DateTime.now().hour.toString() + ":" + DateTime.now().minute.toString(),
                  style: TextStyle(fontSize: 20,),
                  textAlign: TextAlign.center,
                ),
                _spaceBetweenWidget(30),
                Text(
                  'SERVER LIST',
                  style: TextStyle(fontSize: 30, decoration: TextDecoration.underline),
                ),
                _spaceBetweenWidget(7),
                Container(
                  width: 300,
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(129, 197, 163, 1.0),
                    border: Border.all(color: Colors.black),
                  ),
                  child: DropdownButton(
                    isExpanded: true,
                    icon: Icon(Icons.arrow_drop_down, color: Colors.black,),
                    value: pickedInCombo,
                    dropdownColor: Color.fromRGBO(129, 197, 163, 1.0),
                    items: [
                      DropdownMenuItem(
                        child: Text("DNS server",),
                        value: 1,
                      ),
                    ],
                    onChanged: (pick) {
                      setState(() {pickedInCombo = pick;});
                    },
                    style: TextStyle(fontSize: 20, color: Colors.black, decoration: TextDecoration.underline,),
                  ),
                ),
                _spaceBetweenWidget(30),
                Text(
                  'PERMISSION LEVEL',
                  style: TextStyle(fontSize: 30, decoration: TextDecoration.underline),
                ),
                _spaceBetweenWidget(5),
                Container(
                  width: 300,
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(129, 197, 163, 1.0),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Center(
                    child: Text(
                      'Peasant',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ),
                _spaceBetweenWidget(30),
                Text(
                  'ALL USERS LIST',
                  style: TextStyle(fontSize: 30, decoration: TextDecoration.underline),
                ),
                _spaceBetweenWidget(5),
                Container(
                  width: 300,
                  child: Center(
                    child: Text(
                      'Press the button to save current connection server users list into your device',
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                _spaceBetweenWidget(15),
                ButtonTheme(
                  buttonColor: Color.fromRGBO(230, 230, 230, 1.0),
                  minWidth: 200.0,
                  height: 50.0,
                  splashColor: Color.fromRGBO(129, 163, 197, 1.0),
                  child: RaisedButton(
                    onPressed: () {},
                    textColor: Colors.black,
                    child: Text('SAVE', style: TextStyle(fontSize: 20),),
                    color: Color.fromRGBO(230, 230, 230, 1.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                _spaceBetweenWidget(40),
                ButtonTheme(
                  minWidth: 200.0,
                  height: 50.0,
                  splashColor: Color.fromRGBO(255, 255, 255, 1.0),
                  child: RaisedButton(
                    onPressed: () {},
                    textColor: Colors.black,
                    child: Text('DISCONNECT & DELETE SERVER', style: TextStyle(fontSize: 20),),
                    color: Color.fromRGBO(230, 0, 0, 1.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                _spaceBetweenWidget(10),
                Container(
                  width: 300,
                  child: Center(
                    child: Text(
                      'This action will delete your user from the server side & will delete your login information including the contacts you have connected via this server',
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                _spaceBetweenWidget(15),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _spaceBetweenWidget(double height) {
    return SizedBox(height: height);
  }
}
