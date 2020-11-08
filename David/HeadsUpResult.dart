import 'package:demo/iCueCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'MistakesReview.dart';
import 'iCueCard.dart';
import 'headsupstart.dart';


class HeadsUpResult extends StatelessWidget{
  final int score;
  final List<iCueCard> mislst;
  HeadsUpResult({this.score, this.mislst});

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Game Result")
      ),
     body: Center(
       child: Column(
         children: [
           Text('The final score is ',),
           Text("$score"),
           new RaisedButton(  //for the replay the game
            child: Text('Play it Again'),
            color: Colors.blueAccent[600],
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      HeadsUpStart()),
            ),
          ),
          new RaisedButton( //for review the mistakes
            child: Text('Review the Unsuccess Guess'),
            color: Colors.blueAccent[600],
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      MistakesReview(list: mislst)),
            ),
          ),
         ],

       ),
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}