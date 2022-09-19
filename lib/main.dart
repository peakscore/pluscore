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
                  return SecondPage(title: 'Exam 1');
                }));
              },
              child: const Text('Exam 1'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ThirdPage(title: 'Exam 2');
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

class SecondPage extends StatelessWidget {
  final TextEditingController _textFieldController = TextEditingController();
  final String title;
 SecondPage({Key? key, required this.title}) : super(key: key);
  
  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Enter Grade'),
            content: TextField(
              controller: _textFieldController,
              textInputAction: TextInputAction.go,
              keyboardType: const TextInputType.numberWithOptions(),
              //decoration: const InputDecoration(hintText: "Enter your number"),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                 _navigateAndDisplaySelection(context);},
                 //Navigator.pop(context);},
                child: const Text('Submit')), 
                
              ]
          );
        });
  }
 Future<void> _navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SecondPage(title: 'Exam 1',)),
    );
  // When a BuildContext is used from a StatefulWidget, the mounted property
  // must be checked after an asynchronous gap.
  //if (!mounted) return;
  // After the Selection Screen returns a result, hide any previous snackbars
  // and show the new result.
  ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text('$result')));
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
            children: <Widget>[
              TextButton(                
                onPressed: () { 
                 _displayDialog(context);},                  
                child: const Text('Dream Grade'),     
              ),
              TextButton(
                onPressed: () => {_displayDialog(context)},
                child: const Text('Real Grade'),
              ),
              //Text( _textFieldController.text)
            ],
          ),
        );
  }
 
}

class ThirdPage extends StatelessWidget {
  final TextEditingController _textFieldController = TextEditingController();
  final String title;
  ThirdPage({Key? key, required this.title}) : super(key: key);

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Enter Grade'),
            content: TextField(
              controller: _textFieldController,
              textInputAction: TextInputAction.go,
              keyboardType: const TextInputType.numberWithOptions(),
              //decoration: const InputDecoration(hintText: "Enter your number"),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Submit'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

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
                onPressed: () => {_displayDialog(context)},
                child: const Text('Dream Grade'),
              ),
              TextButton(
                onPressed: () => {_displayDialog(context)},
                child: const Text('Real Grade'),
              ),
            ],
          ),
        ));
  }
}