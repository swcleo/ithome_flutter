// ignore_for_file: avoid_print

import 'package:my_chat/models/message.dart';
import 'package:rxdart/rxdart.dart';
import '../core/connection.dart';
import '../core/chat_db.dart';

class ChatViewModel {
  Connection connection =
      Connection(uri: Uri.parse('ws://test.dev.rde:8000/?token=sm'));

  ChatDB db = ChatDB();

  PublishSubject<List<Message>> stream = PublishSubject();

  final List<Message> data = [];

  ChatViewModel() {
    connection.stream.listen((data) {
      if (data["eventName"] == "chat:msg") {
        _addData(Message.fromJson(data));
      }
    });
  }

  void _addData(Message msg) async {
    await _insertDB(msg);
    data.add(msg);
    stream.add(data);
  }

  void initData() async {
    data.addAll(await db.query());
    stream.add(data);
  }

  _insertDB(Message msg) async {
    return await db.insert(msg);
  }

  delete(String mid) async {
    await db.delete(mid);
    data.removeWhere((item) => item.mid == mid);
    stream.add(data);
  }

  void close() async {
    await db.close();
    stream.close();
  }

  send(String text) {
    var data = {"eventName": "chat:send", "data": text};
    connection.trigger(data);
  }
}
