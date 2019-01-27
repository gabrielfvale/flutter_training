import 'package:flutter/material.dart';

class App extends StatefulWidget {
  @override
  createState() => AppState();
}

class AppState extends State<App> {

  int counter = 0;

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Training App'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => setState(() => counter++),
          child: Icon(Icons.add),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('You hit the FAB $counter times.')
            ],
          ),
        ),
      ),
    );
  }
}
