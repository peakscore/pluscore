import 'dart:html';

import 'package:flutter/material.dart';

class CustomWidgetDemo extends StatefulWidget {
  CustomWidgetDemo() : super();

  final String title = "";

  @override
  _CustomWidgetDemoState createState() => _CustomWidgetDemoState();
}

class _CustomWidgetDemoState extends State<CustomWidgetDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
    );
  }
}
