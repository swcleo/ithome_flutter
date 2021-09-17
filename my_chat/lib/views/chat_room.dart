// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:my_chat/view_models/chat.dart';

class ChatRoomStatefulWidget extends StatefulWidget {
  const ChatRoomStatefulWidget({Key? key}) : super(key: key);

  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoomStatefulWidget> {
  final TextEditingController _input = TextEditingController();

  ChatViewModel chat = ChatViewModel();

  late ScrollController _controller;

  bool connected = false;

  @override
  initState() {
    super.initState();

    _controller = ScrollController();

    chat.initData();

    chat.stream.listen((_) {
      Future.delayed(const Duration(milliseconds: 100), () {
        final offset =
            _controller.position.maxScrollExtent - _controller.offset;

        // 大於一列且小於二列時自動移動
        if (offset > 70 && offset < 140 && !_controller.position.outOfRange) {
          _controller.jumpTo(_controller.position.maxScrollExtent);
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    chat.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          StreamBuilder(
            stream: chat.connection.connected,
            builder: (context, snapshot) {
              return SizedBox(
                width: double.infinity,
                child: TextButton(
                  child: Text(snapshot.data == true ? "已連線" : "請重連"),
                  onPressed: () {
                    chat.connection.reconnect();
                  },
                ),
              );
            },
          ),
          Expanded(
            flex: 1,
            child: StreamBuilder(
              stream: chat.stream,
              builder: (context, snapshot) {
                var data = snapshot.data;

                if (data == null) {
                  return const Center(child: Text("載入中"));
                }

                return Scrollbar(
                  controller: _controller,
                  child: ListView.builder(
                    shrinkWrap: true,
                    controller: _controller,
                    itemCount: chat.data.length,
                    itemExtent: 72.0,
                    padding: EdgeInsets.zero,
                    itemBuilder: (BuildContext context, int index) {
                      var message = chat.data[index];
                      var time = DateTime.fromMicrosecondsSinceEpoch(
                              message.time * 1000)
                          .toString();
                      return ListTile(
                        key: ValueKey("message_$message.time"),
                        title: Text(message.text),
                        subtitle: Text(time),
                        trailing: PopupMenuButton(itemBuilder: (context) {
                          return [
                            const PopupMenuItem(
                              value: 'delete',
                              child: Text('Delete'),
                            )
                          ];
                        }, onSelected: (value) {
                          if (value == "delete") {
                            chat.delete(message.mid);
                          }
                        }),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          Container(
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
                  onPressed: () async {
                    if (_input.text == "") {
                      return;
                    }
                    setState(() {
                      chat.send(_input.text);
                      _input.text = "";
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
