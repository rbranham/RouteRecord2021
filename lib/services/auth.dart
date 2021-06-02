import 'package:route_record_admin_portal/models/local_user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:route_record_admin_portal/services/database.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance; //gets instance

  // Create user obj based on FirebaseUser
  LocalUser _userFromFirebaseuser(User firebaseUser) {
    return firebaseUser != null ? LocalUser(uid: firebaseUser.uid) : null;
  }

  // auth change user stream
  Stream<LocalUser> get user {
    return _auth.authStateChanges()
    //.map((User user) => _userFromFirebaseuser(user));
        .map(_userFromFirebaseuser);
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try{

      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User firebaseUser = result.user;
      return _userFromFirebaseuser(firebaseUser);

    }catch (e) {
      print(e.toString());
      return null;
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try{

      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User firebaseUser = result.user;

      //create a new doc for user with user id
      await DatabaseService(uid: firebaseUser.uid).updateUserData('0', 'New Member', 100);
      return _userFromFirebaseuser(firebaseUser);

    }catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async{
    try{
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}