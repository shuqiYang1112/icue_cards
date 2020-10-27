import 'package:flutter/material.dart';
import 'iCueCard.dart';


  class NewCard extends StatefulWidget {

  final iCueCard c;
  NewCard({this.c});

  @override
  _NewCardState createState() => _NewCardState();
}

class _NewCardState extends State<NewCard> {

    TextEditingController titleController1;
    TextEditingController titleController2;
    @override
    void initState() {
      super.initState();
      titleController1 = new TextEditingController();
      titleController2 = new TextEditingController();
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(  // the page to create a card
      appBar: AppBar(
        title: Text(
          "New Card"
        )
      ),
      body: Column(
        children: [
          TextField(
            controller: titleController1,
            autofocus: true,
            onEditingComplete: create,
            decoration: InputDecoration(labelText: 'Front'),

          ),
          SizedBox(height: 15),
          TextField(
            controller: titleController2,
            autofocus: true,
            onEditingComplete: create,
            decoration: InputDecoration(labelText: 'Back'),

          ),
          SizedBox(height: 15),
          RaisedButton(
            child:
              Text(
                'Create'
              ),
            onPressed: () => create(),
          ),
        ],
      )
    );
  }
  void create() async {   //the function returns the text back to the main page, in the future will be send to database as well.
    Navigator.pop(context,{
      'frontside': titleController1.text,
      'backside': titleController2.text,
    });

  }

}
