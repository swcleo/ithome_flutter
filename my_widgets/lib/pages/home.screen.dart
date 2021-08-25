import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Welcome To Flutter")),
        body: Center(
          child: _buildLists(context),
        ));
  }

  Widget _buildLists(BuildContext context) {
    List<Widget> items = [
      ListTile(
        title: Text('Text'),
        onTap: () => Navigator.pushNamed(context, '/text'),
      ),
      ListTile(
        title: Text('Image'),
        onTap: () => Navigator.pushNamed(context, '/image'),
      ),
      ListTile(
        title: Text('Icon'),
        onTap: () => Navigator.pushNamed(context, '/icon'),
      ),
    ];

    return ListView(children: items);
  }
}
