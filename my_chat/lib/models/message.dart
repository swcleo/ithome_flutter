import 'dart:convert';

Message messageFromJson(String str) => Message.fromJson(json.decode(str));

String messageToJson(Message data) => json.encode(data.toJson());

class Message {
  Message({
    required this.by,
    required this.msg,
    required this.time,
    required this.mid,
  });

  final String by;
  final String msg;
  final int time;
  final String mid;

  get text => "$by @ $msg";

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      mid: json["mid"],
      by: json["by"],
      msg: json["msg"],
      time: json["time"],
    );
  }

  Map<String, dynamic> toJson() => {
        "mid": mid,
        "by": by,
        "msg": msg,
        "time": time,
      };
}
