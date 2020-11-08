/* All of the Firebase authentication servies are stored here
   Includes: Sign in anon
             Sign in with email and passowrd 
             Register with email and password 
             Sign out
   Author: Andy Tran
*/

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // final meaning that this cannot change in the future
  // _ means _auth is private (can't be seen outside this class)
  // _auth is a FirebaseAuth object and has access to many useful properties
  // like sign in, sign out, etc.
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // auth change user stream
  // Sends us firebase users if someone has signed in or null if they've signed out
  Stream<FirebaseUser> get user {
    return _auth.onAuthStateChanged;
  }

  // Sign in anonymously
  // It returns either the anonymous user or null if it fails
  Future signInAnon() async {
    try {
      // use await because _auth is going to take some time to make
      // result has a user property
      AuthResult result = await _auth.signInAnonymously();
      return result.user.uid;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign in with email and password

  // Register with email and password

  // Sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
