import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_chat/core/connection.dart';
import '../chat.dart';
import 'chat_view.dart';

class ChatPage extends StatelessWidget {
  ChatPage({Key? key}) : super(key: key);

  final Uri uri = Uri.parse('ws://test.dev.rde:8000/?token=sm2');

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChatBloc(Connection(uri: uri)),
      child: const ChatView(),
    );
  }
}
