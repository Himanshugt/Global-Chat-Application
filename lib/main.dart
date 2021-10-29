// @dart=2.9

import 'package:flutter/material.dart';
import 'package:globalchatapp/screens/authenticate/sign_in.dart';
import 'package:globalchatapp/wrapper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignInPage(),
    );
  }
}
