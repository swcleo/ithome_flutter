import 'package:flutter/material.dart';
import '../app-router.delegate.dart';

import 'settings.page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: ListView(children: [
        ListTile(
          title: Text("自定義 push 方法"),
          subtitle: Text('插入 widget 至 pages'),
          onTap: () {
            AppRouterDelegate.of(context).push(SettingsPage());
          },
        ),
        ListTile(
          title: Text("自定義 replace 方法"),
          subtitle: Text('取代整個 pages'),
          onTap: () {
            AppRouterDelegate.of(context).pushNamed('/items');
          },
        ),
      ]),
    );
  }
}
