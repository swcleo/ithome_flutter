import 'package:flutter/material.dart';
import '../app-router.delegate.dart';

class ItemsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Items")),
      body: Center(
        child: TextButton(
          child: Text("返回首頁"),
          onPressed: () {
            AppRouterDelegate.of(context).pushNamed('/');
          },
        ),
      ),
    );
  }
}
