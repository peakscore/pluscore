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
      home: const FirstPage(title: '+score'),
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
