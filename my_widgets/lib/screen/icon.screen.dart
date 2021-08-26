import 'package:flutter/material.dart';

class IconScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Icon")),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.0,
        ),
        children: <Widget>[
          Icon(Icons.ac_unit, color: Colors.red),
          Icon(Icons.baby_changing_station, color: Colors.blue),
          Icon(Icons.cabin),
          Icon(Icons.dangerous),
        ],
      ),
    );
  }
}
