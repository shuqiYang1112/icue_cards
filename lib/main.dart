import 'package:flutter/material.dart';
import 'package:lists/createCard.dart';
import 'iCueCard.dart';


void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Lists(),
      'home': (context) => Lists(),
      '/newCard': (context) => NewCard(),

    },
    //home: Lists(),
  ));
}

class Lists extends StatefulWidget {
  @override
  _ListState createState() => _ListState();
}

class _ListState extends State<Lists> { //temporary data, will be database.

  List<iCueCard> cards = [
    iCueCard(frontSide: 'who is the NBA G.O.A.T. ?',
        backSide: 'LeBron James'),
    iCueCard(frontSide: "What is the last name of Jackie Chan's character in Rush Hour?",
        backSide: 'Lee'),
    iCueCard(frontSide: 'sample question', backSide: 'sample answer')

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(        // the main view
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () async{
            dynamic result = await Navigator.pushNamed(context, '/newCard');
            if (result!=null){
              setState(() {
                iCueCard n1 = new iCueCard();
                n1.frontSide = result['frontside'];
                n1.backSide = result['backside'];
                cards.add(n1);
              });
            }
          },
        ),
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          title: Text("iCue Cards!"),
          backgroundColor: Colors.blue[500],
        ),
        body: ListView.builder(
          itemCount: cards.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () {},
                title: Text(cards[index].frontSide),
                subtitle: Text(cards[index].backSide),
              ),
            );
          },


        )
    );
  }


}
