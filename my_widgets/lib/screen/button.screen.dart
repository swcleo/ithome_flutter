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
      child: Text('CustomStyle'),
      onPressed: () {},
      style: TextButton.styleFrom(
        primary: Colors.purple,
        textStyle: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    var elevatedButtonWithIcon = ElevatedButton.icon(
      icon: Icon(Icons.home),
      label: Text("Home"),
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        primary: Colors.red,
        shadowColor: Colors.orange,
      ),
    );

    var outlinedButtonWithStyle = OutlinedButton(
      child: Text('OutlinedButton'),
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        primary: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        side: BorderSide(width: 2, color: Colors.green),
      ),
    );

    var iconButton = IconButton(
      icon: Icon(Icons.build_circle),
      iconSize: 30.0,
      splashRadius: 20.0,
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
          elevatedButtonWithIcon,
          outlinedButtonWithStyle,
          iconButton
        ],
      ),
    );
  }
}
