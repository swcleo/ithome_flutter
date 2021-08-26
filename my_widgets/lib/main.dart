import 'package:flutter/material.dart';
import 'screen/home.screen.dart';
import 'screen/text.screen.dart';
import 'screen/image.screen.dart';
import 'screen/icon.screen.dart';
import 'screen/time.screen.dart';
import 'screen/button.screen.dart';
import 'screen/Form.screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/time': (context) => TimeScreen(),
        '/text': (context) => TextScreen(),
        '/image': (context) => ImageScreen(),
        '/icon': (context) => IconScreen(),
        '/button': (context) => ButtonScreen(),
        '/form': (context) => FormScreen(),
      },
    );
  }
}
