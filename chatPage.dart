import 'package:flutter/material.dart';
import 'package:auto_direction/auto_direction.dart';
import 'package:intl/intl.dart' as intl;

// ignore: camel_case_types
class chatPage extends StatefulWidget {
  @override
  _chatPageState createState() => _chatPageState();
}

// ignore: camel_case_types
class _chatPageState extends State<chatPage> {
  var messages = <Widget>[];
  final myController = TextEditingController();
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
        actions: <Widget>[
          IconButton (
            icon: Icon(Icons.attach_file, color: Colors.black,),
            onPressed: () {},
          ),
          IconButton (
            icon: Icon(Icons.settings, color: Colors.black,),
            onPressed: () {},
          )
        ],
      ),
      body: SafeArea(
        top: true,
        right: true,
        bottom: true,
        left: true,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container (
                height: MediaQuery.of(context).size.height - 145,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      _spaceBetweenWidget(2),  //message won't be stuck to top of the screen
                      _messageBuilder("Hi.\nthis message is a demonstration for what messages from other person would look like on your phone.", false),
                      //_messageBuilder("Everything is fine, this message is just to test scrolling between message and chat type bubbly thing bellow.", false),
                      ...messages,
                      _spaceBetweenWidget(65),  //so it will be possible to read message while typing
                    ],
                  ),
                ),
              ),
              Align (
                alignment: FractionalOffset.bottomLeft,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(5, 0, 0, 6),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromRGBO(250, 250, 250, 1.0),
                        ),
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: AutoDirection(
                          text: text,
                          child: TextField(
                            controller: myController,
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
                      ),
                    ),
                    Container(
                      height: 45,
                      margin: EdgeInsets.fromLTRB(0, 0, 5, 7),
                      child: FloatingActionButton(
                        child: Icon(Icons.send, color: Colors.black,),
                        backgroundColor: Color.fromRGBO(250, 250, 250, 1.0),
                        splashColor: Color.fromRGBO(129, 163, 197, 1.0),
                        onPressed: (){
                          if (myController.text.toString().trim().length != 0)
                            messages.add(_messageBuilder(myController.text, true));
                          myController.text = "";
                          setState(() {});  //refreshes widgets but not variables, display now message
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _spaceBetweenWidget(double height) {
    return SizedBox(height: height);
  }

  _messageBuilder(String message, bool whoSent) {
    return Container(
      width: 280,
      decoration: BoxDecoration(
        gradient: LinearGradient (colors: whoSent ? [Color(0xf081c5a3),Color(0xf0ffffff),] : [Color(0xf0ffffff),Color(0xf081c5c5),]),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: whoSent ? EdgeInsets.only(top: 8, bottom: 0, left: 45.0) : EdgeInsets.only(top: 8, bottom: 0, right: 45.0),
      padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
      child: Directionality(
        textDirection: intl.Bidi.detectRtlDirectionality(message)?TextDirection.rtl : TextDirection.ltr,
        child: Text(message, style: TextStyle(fontSize: 20),),
      ),
    );
  }
}