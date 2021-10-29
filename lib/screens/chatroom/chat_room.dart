import 'package:flutter/material.dart';
import 'package:globalchatapp/services/auth.dart';

class ChatRoom extends StatefulWidget {
  const ChatRoom({Key? key}) : super(key: key);

  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.brown[900],
            ),
            onPressed: () async {
              return await AuthService().signOut();
            },
          )
        ],
      ),
      body: Container(
        color: Colors.yellow,
      ),
    );
  }
}
