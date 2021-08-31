import 'package:flutter/material.dart';
import 'screen/home.screen.dart';
import 'screen/text.screen.dart';
import 'screen/image.screen.dart';
import 'screen/icon.screen.dart';
import 'screen/time.screen.dart';
import 'screen/button.screen.dart';
import 'screen/form.screen.dart';
import 'screen/layout.screen.dart';
import 'screen/container.screen.dart';
import 'screen/scroll.screen.dart';

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
        '/layout': (context) => LayoutScreen(),
        '/container': (context) => ContainerScreen(),
        '/scroll': (context) => ScrollScreen(),
      },
    );
  }
}
