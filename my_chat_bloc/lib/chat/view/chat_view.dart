// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../chat.dart';

class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("chat_bloc")),
      body: Column(
        children: [
          const MessageBox(),
          InputText(),
        ],
      ),
    );
  }
}

class MessageBox extends StatelessWidget {
  const MessageBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: BlocBuilder<ChatBloc, ChatState>(
        builder: (context, state) {
          final btnTitle = state.status == SocketStatus.open ? "已連線" : "請重連";
          var controller = context.read<ChatBloc>().controller;

          return Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  child: Text(btnTitle),
                  onPressed: () {
                    print(state.status);
                    if (state.status == SocketStatus.closed) {
                      context.read<ChatBloc>().reconnect();
                    }
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: Scrollbar(
                  controller: controller,
                  child: ListView.builder(
                    shrinkWrap: true,
                    controller: controller,
                    itemCount: state.data.length,
                    itemExtent: 72.0,
                    padding: EdgeInsets.zero,
                    itemBuilder: (BuildContext context, int index) {
                      var message = state.data[index];
                      var ts = message.time * 1000;
                      var time = DateTime.fromMicrosecondsSinceEpoch(ts);
                      return ListTile(
                        key: ValueKey("message_$message.time"),
                        title: Text(message.text),
                        subtitle: Text(time.toString()),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class InputText extends StatelessWidget {
  final TextEditingController _input = TextEditingController();

  InputText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 15.0),
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
                borderRadius: const BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              child: TextField(
                keyboardType: TextInputType.multiline,
                controller: _input,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Aa',
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            iconSize: 32.0,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {
              if (_input.text == "") {
                return;
              }
              context.read<ChatBloc>().send(_input.text);
              _input.text = "";
            },
          ),
        ],
      ),
    );
  }
}
