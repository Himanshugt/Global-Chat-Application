// @dart=2.9


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:globalchatapp/models/MyUser.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService{
  final FirebaseAuth _auth=FirebaseAuth.instance;


  

  MyUser _myUserFromFirebaseUser(User user){
    return user!=null? MyUser(
        uid: user.uid,
        displayName: user.displayName,
        photoURL: user.photoURL
    ) : null;
  }

  Future signInWithGoogle() async{
    try{
      GoogleSignIn googleSignIn=GoogleSignIn();
      GoogleSignInAccount googleSignInAccount=await googleSignIn.signIn(); //maybe shows the popup window of google
      AuthCredential credential;
      if(googleSignInAccount!=null){
        GoogleSignInAuthentication googleSignInAuthentication=await googleSignInAccount.authentication;

        credential=GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
      }
      UserCredential userCredential=await _auth.signInWithCredential(credential);
      User user=userCredential.user;
      return _myUserFromFirebaseUser(user);
    }catch(error){
      print('Error');
      return null;
    }
  }

  Future signOut() async{
    try{
      final GoogleSignIn googleSignIn = GoogleSignIn();
      await googleSignIn.signOut();
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }


  
}