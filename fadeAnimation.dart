import 'package:flutter/material.dart';

// ignore: camel_case_types
class fadeAnimation extends PageRouteBuilder {
  final Widget widget;
  fadeAnimation({this.widget}):super(
      transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAniamtion, Widget child) =>
          FadeTransition(
            opacity: animation,
            child: child,
          ),
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAniamtion) {
        return widget;
      },
  );
}