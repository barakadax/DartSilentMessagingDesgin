import 'package:flutter/material.dart';
import 'package:silent/loginPage.dart';
import 'delUser.dart';
import 'fadeAnimation.dart';
import 'newContactPage.dart';
import 'newPermission.dart';
import 'newUser.dart';

// ADDING PAGE, 3 BUTTONS ADD USER, SERVER, USER INTO SERVER!
// ignore: camel_case_types
class addPage extends StatefulWidget {
  @override
  _addPage createState() => _addPage();
}

// ignore: camel_case_types
class _addPage extends State<addPage> {
  var buttonStatus = false;
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
                Image.asset(
                  'assets/bluetooth.png',
                  width: 170,
                ),
                _spaceBetweenWidget(30),
                ButtonTheme(
                  minWidth: 200.0,
                  height: 50.0,
                  splashColor: Color.fromRGBO(129, 163, 197, 1.0),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(context, fadeAnimation(widget: newContactPage()));
                    },
                    textColor: Colors.black,
                    child: Text('Add new contact', style: TextStyle(fontSize: 20),),
                    color: Color.fromRGBO(230, 230, 230, 1.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                _spaceBetweenWidget(10),
                ButtonTheme(
                  minWidth: 200.0,
                  height: 50.0,
                  splashColor: Color.fromRGBO(129, 163, 197, 1.0),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(context, fadeAnimation(widget: loginPage()));
                    },
                    textColor: Colors.black,
                    child: Text('Add new server', style: TextStyle(fontSize: 20),),
                    color: Color.fromRGBO(230, 230, 230, 1.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                _spaceBetweenWidget(20),
                _adminStatus(2),
                _spaceBetweenWidget(10),
                _addNewUser(2),
                _spaceBetweenWidget(10),
                _changePermission(2),
                _spaceBetweenWidget(10),
                _deleteOtherUser(2),
                _spaceBetweenWidget(10),
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

  _adminStatus(int myPermissionLevel) {
    if (myPermissionLevel == 2) {
      return Text(
        'Admin functions',
        style: TextStyle(fontSize: 30, decoration: TextDecoration.underline),
      );
    }
    return SizedBox(height: 0);  //widget can't be null, so I transfer none existence by size widget that does nothing
  }

  _addNewUser(int myPermissionLevel) {
    if (myPermissionLevel == 2) {
      return ButtonTheme(
        minWidth: 200.0,
        height: 50.0,
        splashColor: Color.fromRGBO(129, 163, 197, 1.0),
        child: RaisedButton(
          onPressed: () {
            Navigator.push(context, fadeAnimation(widget: newUser()));
          },
          textColor: Colors.black,
          child: Text('Add new user', style: TextStyle(fontSize: 20),),
          color: Color.fromRGBO(230, 230, 230, 1.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    }
    return SizedBox(height: 0);  //widget can't be null, so I transfer none existence by size widget that does nothing
  }

  _changePermission(int myPermissionLevel) {
    if (myPermissionLevel == 2) {
      return ButtonTheme(
        minWidth: 200.0,
        height: 50.0,
        splashColor: Color.fromRGBO(129, 163, 197, 1.0),
        child: RaisedButton(
          onPressed: () {
            Navigator.push(context, fadeAnimation(widget: changePermission()));
          },
          textColor: Colors.black,
          child: Text('Change permission', style: TextStyle(fontSize: 20),),
          color: Color.fromRGBO(230, 230, 230, 1.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    }
    return SizedBox(height: 0);  //widget can't be null, so I transfer none existence by size widget that does nothing
  }

  _deleteOtherUser(int myPermissionLevel) {
    if (myPermissionLevel == 2) {
      return ButtonTheme(
        minWidth: 200.0,
        height: 50.0,
        splashColor: Color.fromRGBO(129, 163, 197, 1.0),
        child: RaisedButton(
          onPressed: () {
            Navigator.push(context, fadeAnimation(widget: delUser()));
          },
          textColor: Colors.black,
          child: Text('Delete user', style: TextStyle(fontSize: 20),),
          color: Color.fromRGBO(230, 230, 230, 1.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    }
    return SizedBox(height: 0);  //widget can't be null, so I transfer none existence by size widget that does nothing
  }
}