// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

class Message {
  final String text;
  late DateTime time;
  Message(this.text, int time) {
    this.time = DateTime.fromMicrosecondsSinceEpoch(time * 1000);
  }
}

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

class ChatRoomStatefulWidget extends StatefulWidget {
  const ChatRoomStatefulWidget({Key? key}) : super(key: key);

  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoomStatefulWidget> {
  final TextEditingController _input = TextEditingController();

  final List<Message> _data = [];

  late IOWebSocketChannel _channel;

  bool connected = false;

  @override
  initState() {
    super.initState();
    createSocket();
  }

  void createSocket() {
    var uri = Uri.parse('ws://test.dev.rde:8000/?name=flutter');

    _channel = IOWebSocketChannel.connect(uri);

    setState(() {
      connected = true;
    });

    _channel.stream
        .handleError((x) => print('Exception on WebSocket: $x'))
        .listen((message) {
      print(message);
      Map<String, dynamic> data = jsonDecode(message);
      setState(() {
        _data.add(
            Message("${data["from"]} @ ${data["msg"]}", data["time"] ?? 0));
      });
    }, onError: (e) {
      print("$e");
    }, onDone: () {
      print("done");
      setState(() {
        connected = false;
      });
    });
  }

  @override
  void dispose() {
    _channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var state = connected ? "已連線" : "請重連";
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: TextButton(
              child: Text(state),
              onPressed: () {
                if (!connected) {
                  _channel.sink.close();
                  createSocket();
                }
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Scrollbar(
              child: ListView.builder(
                itemCount: _data.length,
                itemBuilder: (BuildContext context, int index) {
                  var message = _data[index];
                  return ListTile(
                    title: Text(message.text),
                    subtitle: Text(message.time.toString()),
                  );
                },
              ),
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
                      _channel.sink.add(_input.text);
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
