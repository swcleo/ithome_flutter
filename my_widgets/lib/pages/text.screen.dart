import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class TextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var text = Text("text");

    var textWithStyle = Text(
      "Bold Text",
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
    );

    var textWithAlgin = Text(
      "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 40.0,
      ),
    );

    var textWithWords = Text(
      "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );

    var richTextWithSpanStyle = Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "鐵人賽: ",
            style: TextStyle(color: Colors.red),
          ),
          TextSpan(
            text: "點我去報名吧",
            style: TextStyle(color: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () =>
                  print('Go https://ithelp.ithome.com.tw/2021ironman/event'),
          ),
        ],
      ),
    );

    var textWithFont = Text(
      "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 40.0,
        fontFamily: 'BungeeOutline',
      ),
    );

    return Scaffold(
      appBar: AppBar(title: const Text("Text")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          text,
          textWithStyle,
          textWithAlgin,
          textWithWords,
          richTextWithSpanStyle,
          textWithFont,
        ],
      ),
    );
  }
}
