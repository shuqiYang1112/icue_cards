import 'package:flutter/material.dart';
import 'headsupstart.dart';
import 'HeadsUp.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Game Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game Page'),
      ),
      body: Center(
        child: new Column(children: <Widget>[
          new RaisedButton(
            child: Text('Heads Up Game'),
            color: Colors.blueAccent[600],
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => HeadsUpStart())),
          ),
          new RaisedButton(
            child: Text('Kahoo Game'),
            color: Colors.blueAccent[600],
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        HeadsUpStart())), //这个HeadsUpStart（）要改成Kahoo（）
          ),
        ]),
      ),
    );
  }
}
