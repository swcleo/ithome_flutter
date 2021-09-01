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
          Icon(Icons.favorite, color: Colors.red),
          Icon(Icons.search, color: Colors.blue),
          Icon(Icons.home),
          Icon(Icons.language),
          Icon(Icons.schedule),
          Icon(Icons.menu),
          Icon(Icons.grade),
          Icon(Icons.explore),
          Icon(Icons.view_week),
          Icon(Icons.check),
          Icon(Icons.add),
          Icon(Icons.notifications),
          Icon(Icons.edit),
          Icon(Icons.email),
          Icon(Icons.call),
          Icon(Icons.file_download),
          Icon(Icons.my_location),
          Icon(Icons.hd),
        ],
      ),
    );
  }
}
