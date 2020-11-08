import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'headsupstart.dart';
import 'HeadsUpResult.dart';
import 'iCueCard.dart';

class MistakesReview extends StatefulWidget {
  final List<iCueCard> list;
  MistakesReview({this.list});

  @override
  _MistakesReviewState createState() => _MistakesReviewState(list: this.list);
}

class _MistakesReviewState extends State<MistakesReview> {
  List<iCueCard> list;
  _MistakesReviewState({this.list});
  
  int _index = 0;
  bool _isButtonDisabled1 = false;   //go forward button
  bool _isButtonDisabled2 = false;  //go backword button

  void _goforward(){
    setState((){
      int len = list.length;
      print("The length is $len");
      if(_index == list.length-1){
        _isButtonDisabled1 = true;
      }else{
        _index++;
        _isButtonDisabled1 = false;
        _isButtonDisabled2 = false;
      }

    });
  }

  void _gobackward(){
    setState((){
      if(_index == 0){
        _isButtonDisabled2 = true;
      }else{
        _isButtonDisabled2 = false;
        _index--;
        _isButtonDisabled1 = false;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    if(list.length == 0){
      return Scaffold(
        appBar: AppBar(
          title: Text("Congrates!")
        ),
        body:Center(
          child: Text("You do everything right!"),
        ),
        );
    }else{
      iCueCard _current;
      _current = list[_index];
      var _front = _current.frontSide;
      var _back = _current.backSide;
      return Scaffold(
        appBar: AppBar(
          title: Text("Review the Mistakes")
        ),
        body:Center(
          child: Column(
            children: [
              Text('Reivew the unsuccessful guess:',),
              Text("Description: ",),
              Text("$_front"),
              Text("keyword: ",),
              Text("$_back"),

              new RaisedButton(
                child: Text("Previous"),
                color: Colors.blueAccent[600],
                onPressed: _isButtonDisabled2 ? null : _gobackward,
              ),

              new RaisedButton(
                child: Text("Next"),
                color: Colors.blueAccent[600],
                onPressed: _isButtonDisabled1 ? null : _goforward,
              ),
            ],
          ),
        ),    
      );
    }
  }
}