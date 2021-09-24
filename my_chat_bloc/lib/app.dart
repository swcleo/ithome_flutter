// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'chat/chat.dart';

class ChatApp extends StatelessWidget {
  const ChatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ChatRoom',
      home: ChatPage(),
    );
  }
}
