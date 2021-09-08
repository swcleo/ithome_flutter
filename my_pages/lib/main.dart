import 'package:flutter/material.dart';
import 'app-router.delegate.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  AppRouterDelegate _delegate = AppRouterDelegate();
  AppRouterParser _parser = AppRouterParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Navigator v2",
      routerDelegate: _delegate,
      routeInformationParser: _parser,
    );
  }
}
