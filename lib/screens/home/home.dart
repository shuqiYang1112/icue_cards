/* The home screen
   [List the things it needs to do here]
   Author: Andy Tran
*/
import 'package:flutter/material.dart';
import '../../services/auth.dart';

class Home extends StatelessWidget {
  // You need this to access signOut()
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('ICUE CARDS'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          // logout icon
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('logout'),
            onPressed: () async {
              await _auth.signOut();
            },
          )
        ],
      ),
    );
  }
}
