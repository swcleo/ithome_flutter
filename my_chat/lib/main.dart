import 'package:flutter/material.dart';

import 'views/chat_room.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Welcome to Flutter",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("WebSocket Chat"),
        ),
        body: const ChatRoomStatefulWidget(),
      ),
    );
  }
}
