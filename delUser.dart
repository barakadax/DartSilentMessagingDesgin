import 'package:auto_direction/auto_direction.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class delUser extends StatefulWidget {
  @override
  _delUser createState() => _delUser();
}

// ignore: camel_case_types
class _delUser extends State<delUser> {
  int pickedInCombo = 1;
  String text = "";
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
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 15),
                Text(
                  'Username',
                  style: TextStyle(fontSize: 30, decoration: TextDecoration.underline),
                ),
                _InputField(),
                SizedBox(height: 5),
                Text(
                  'Password',
                  style: TextStyle(fontSize: 30, decoration: TextDecoration.underline),
                ),
                _InputField(),
                SizedBox(height: 5),
                SizedBox(height: 30),
                ButtonTheme(
                  buttonColor: Color.fromRGBO(230, 230, 230, 1.0),
                  minWidth: 220.0,
                  height: 50.0,
                  splashColor: Color.fromRGBO(129, 163, 197, 1.0),
                  child: RaisedButton(
                    onPressed: () {},
                    textColor: Colors.black,
                    child: Text('ADD', style: TextStyle(fontSize: 20),),
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

  // ignore: non_constant_identifier_names
  _InputField() {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
        color: Color.fromRGBO(250, 250, 250, 1.0),
      ),
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: AutoDirection(
        text: text,
        child: TextField(
          minLines: 1,
          maxLines: 3,
          autocorrect: true,
          keyboardType: TextInputType.multiline,
          style: TextStyle(fontSize: 23.0,),
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
          cursorColor: Color.fromRGBO(129, 163, 197, 1.0),
          textCapitalization: TextCapitalization.sentences,
          onChanged: (str){
            setState(() {
              text = str;
            });
          },
        ),
      ),
    );
  }
}