// @dart=2.9

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:globalchatapp/screens/chatroom/chat_room.dart';
import 'package:globalchatapp/services/auth.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: FutureBuilder(
          future: Firebase.initializeApp(),
          builder: (context,snapshot) {
            if (snapshot.hasError) {
              return Text("Problem");
            }

            if (snapshot.connectionState == ConnectionState.done) {
              return RaisedButton(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 35),
                    child: Text(
                      'REGISTER',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  color: Colors.brown[900],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                  onPressed: () async {
                    dynamic user=AuthService().signInWithGoogle();
                    if(user!=null){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChatRoom()));
                    }
                  }

              );
            }

            // Otherwise, show something whilst waiting for initialization to complete
            return CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.orange,
              ),
            );
          }
        ),
      )
    );
  }
}
