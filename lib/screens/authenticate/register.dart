/* Register into ICUE CARDS  
   Author: Andy Tran
*/

import 'package:flutter/material.dart';
import '../../services/auth.dart';

class Register extends StatefulWidget {
  // This Register widget accepts a toggleView function
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

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
        title: Text('Sign up to ICUE CARDS'),
        // Sign in icon
        actions: <Widget>[
          FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Sign In'),
              onPressed: () {
                widget.toggleView();
              }),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          // Associate the global _formKey to this form
          key: _formKey,
          child: Column(
            children: <Widget>[
              // Enter email field
              SizedBox(height: 20.0),
              TextFormField(
                  validator: (val) => val.isEmpty ? "Enter an email" : null,
                  // val represents whatever is in the form field
                  onChanged: (val) {
                    setState(() => email = val);
                  }),
              // Enter Password field
              SizedBox(height: 20.0),
              TextFormField(
                  // turns text into dots
                  obscureText: true,
                  // Adding ! makes Dart treat val as a non-nullable
                  validator: (val) =>
                      val.length < 6 ? "Enter a password 6+ chars long" : null,
                  onChanged: (val) {
                    setState(() => password = val);
                  }),
              // Sign in button
              SizedBox(height: 20.0),
              RaisedButton(
                  color: Colors.pink[400],
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    // Get the current state of the form and get the values
                    // inside the form fields so we can validate them
                    if (_formKey.currentState.validate()) {
                      print(email);
                      print(password);
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
