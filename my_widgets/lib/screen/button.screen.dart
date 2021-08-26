import 'package:flutter/material.dart';

class ButtonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 	TextButton
    var textButton = TextButton(
      child: Text('TextButton'),
      onPressed: () {},
    );

    // ElevatedButton
    var elevtedButton = ElevatedButton(
      child: Text('ElevatedButton'),
      onPressed: () {},
    );

    // 	OutlinedButton
    var outlinedButton = OutlinedButton(
      child: Text('OutlinedButton'),
      onPressed: () {},
    );

    var textButtonWithStyle = TextButton(
      child: Text('textButtonWithStyle'),
      onPressed: () {},
      style: TextButton.styleFrom(
        primary: Colors.purple,
        textStyle: TextStyle(fontSize: 30.0),
      ),
    );

    var iconButton = IconButton(
      icon: Icon(Icons.build_circle),
      iconSize: 30.0,
      onPressed: () {},
    );

    return Scaffold(
      appBar: AppBar(title: const Text("Button")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textButton,
          elevtedButton,
          outlinedButton,
          textButtonWithStyle,
          iconButton
        ],
      ),
    );
  }
}
