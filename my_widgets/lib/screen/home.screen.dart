import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Welcome To Flutter")),
      body: Center(
        child: _buildLists(context),
      ),
    );
  }

  Widget _buildLists(BuildContext context) {
    List<Widget> items = [
      ListTile(
        title: Text('Time'),
        subtitle: Text('StatefulWidget Example'),
        onTap: () => Navigator.pushNamed(context, '/time'),
      ),
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
      ListTile(
        title: Text('Button'),
        onTap: () => Navigator.pushNamed(context, '/button'),
      ),
      ListTile(
        title: Text('Form'),
        onTap: () => Navigator.pushNamed(context, '/form'),
      ),
      ListTile(
        title: Text('Layout'),
        onTap: () => Navigator.pushNamed(context, '/layout'),
      ),
      ListTile(
        title: Text('Container'),
        onTap: () => Navigator.pushNamed(context, '/container'),
      ),
      ListTile(
        title: Text('ListView'),
        onTap: () => Navigator.pushNamed(context, '/listview'),
      ),
      ListTile(
        title: Text('GridView'),
        onTap: () => Navigator.pushNamed(context, '/gridview'),
      ),
      ListTile(
        title: Text('DateTimePicker'),
        onTap: () => Navigator.pushNamed(context, '/datetimepicker'),
      ),
      ListTile(
        title: Text('Sliver'),
        onTap: () => Navigator.pushNamed(context, '/sliver'),
      ),
      ListTile(
        title: Text('Theme'),
        onTap: () => Navigator.pushNamed(context, '/theme'),
      ),
    ];

    return ListView(children: items);
  }
}
