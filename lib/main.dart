import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/wrapper.dart';
import 'services/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This StreamProvider stuff is what will allow our Wrapper() to receive
    // information about whether or not the user is signed in or not from Firebase
    return StreamProvider<FirebaseUser>.value(
      value: AuthService()
          .user, // specifies that we are listening to the user stream
      child: MaterialApp(
        // Run Wrapper() first when the app starts up
        // Wrapper() determines whether or not to display Home() or Authenticate()
        home: Wrapper(),
      ),
    );
  }
}
