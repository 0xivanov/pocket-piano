import 'package:firebase_auth/firebase_auth.dart';
import 'package:pocket_piano/Models/User.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create custom user obj based on firebaseUser
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }
  //sing in anon
  Future singInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
  //sign in with email and password

  //register with email and password

  //sign out

}