/* Sign into ICUE CARDS  
   Author: Andy Tran
*/

import 'package:flutter/material.dart';

import '../../services/auth.dart';

class SignIn extends StatefulWidget {
  // This SignIn() widget accepts a toggleView function
  // Needed later so we can switch to the Register page when the user clicks
  // the Register icon
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign in to ICUE CARDS'),
        actions: <Widget>[
          FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Register'),
              onPressed: () {
                widget.toggleView();
              }),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: Column(
            children: <Widget>[
              // Enter email field
              SizedBox(height: 20.0),
              TextFormField(
                  // val represents whatever is in the form field
                  onChanged: (val) {
                setState(() => email = val);
              }),
              // Enter Password field
              SizedBox(height: 20.0),
              TextFormField(
                  // turns text into dots
                  obscureText: true,
                  onChanged: (val) {
                    setState(() => password = val);
                  }),
              // Sign in button
              SizedBox(height: 20.0),
              RaisedButton(
                  color: Colors.pink[400],
                  child: Text(
                    'Sign in',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    print(email);
                    print(password);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
