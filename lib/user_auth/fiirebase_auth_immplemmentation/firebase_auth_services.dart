
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService{
  FirebaseAuth _auth = FirebaseAuth.instance; // instance of firebase auth

  Future<User?> signUpWithEmailAndPassWord(String email, String password) async{
    try{
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return credential.user;
    }catch(e){
      print('Some error occured \n $e ');
    }
    return null;
  }


  Future<User?> signInWithEmailAndPassWord(String email, String password) async{
    try{
      UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    }catch(e){
      print('Some error occured \n $e ');
    }
    return null;
  }

}