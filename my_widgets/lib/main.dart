import 'package:flutter/material.dart';
import 'pages/home.screen.dart';
import 'pages/text.screen.dart';
import 'pages/image.screen.dart';
import 'pages/icon.screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/text': (context) => TextScreen(),
        '/image': (context) => ImageScreen(),
        '/icon': (context) => IconScreen(),
      },
    );
  }
}
