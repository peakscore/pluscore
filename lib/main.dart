// das ist die neueste Version

// neuer Kommentar

//import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const FirstPage(title: '+Score'),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const _SecondPage(title: 'Exam 1');
                }));
              },
              child: const Text('Exam 1'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const _ThirdPage(title: 'Exam 2');
                }));
              },
              child: const Text('Exam 2'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        //onPressed : onPressed.call(){},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      //FlatButton(
      //child: new Text('Flat Button'),
      //onPressed: () {},
      //)
      //MaterialButton(
      // minWidth: 200.16,
      // height: 40.47,
      // onPressed: () {},
      // color: Colors.lightBlue,
      //  child: Text('Material Button', style: TextStyle(color: Colors.white)),
      //),
      //floatingActionButton: FloatingActionButton(
      //onPressed:
      //tooltip: 'Increment',
      //child: const Icon(Icons.add),
      //));
    );
  }
}

class _SecondPage extends StatefulWidget {
  final String title;
  const _SecondPage({Key? key, required this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SecondPageState();
}

class SecondPageState extends State<_SecondPage> {
  double? dreamGrade;
  double? actualGrade;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          TextButton(
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GradeWidget()),
              );

              setState(() => dreamGrade = double.parse(result));
            },
            child: Text('Dream Grade: $dreamGrade'),
          ),
          TextButton(
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GradeWidget()),
              );

              setState(() => actualGrade = double.parse(result));
            },
            child: Text('Real Grade: $actualGrade'),
          ),
        ],
      ),
    );
  }
}

class GradeWidget extends StatelessWidget {
  final TextEditingController _textFieldController = TextEditingController();

  GradeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Enter Grade'),
      content: TextField(
        controller: _textFieldController,
        textInputAction: TextInputAction.go,
        keyboardType: const TextInputType.numberWithOptions(),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Submit'),
          onPressed: () {
            Navigator.of(context).pop(_textFieldController.text);
          },
        )
      ],
    );
  }
}

class _ThirdPage extends StatefulWidget {
  final String title;
  const _ThirdPage({Key? key, required this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ThirdPageState();
}

class ThirdPageState extends State<_ThirdPage> {
  double? dreamGrade;
  double? actualGrade;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          TextButton(
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GradeWidget()),
              );

              setState(() => dreamGrade = double.parse(result));
            },
            child: Text('Dream Grade: $dreamGrade'),
          ),
          TextButton(
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GradeWidget()),
              );

              setState(() => actualGrade = double.parse(result));
            },
            child: Text('Real Grade: $actualGrade'),
          ),
        ],
      ),
    );
  }
}