import 'package:flutter/material.dart';

class ContainerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Container")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("x"),
        ],
      ),
    );
  }
}
