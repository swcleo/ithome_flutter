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
import 'screen/listview.screen.dart';
import 'screen/gridview.screen.dart';
import 'screen/sliver.screen.dart';
import 'screen/datetimepicker.screen.dart';
import 'screen/theme.screen.dart';
import 'screen/provider.screen.dart';
import 'screen/weather.screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(
        primaryColor: Colors.green,
        // ignore: deprecated_member_use
        accentColor: Colors.yellow[300],
        textTheme: const TextTheme(
          headline6: TextStyle(fontSize: 24.0, fontStyle: FontStyle.italic),
        ),
      ),
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
        '/listview': (context) => ListViewScreen(),
        '/gridview': (context) => GridViewScreen(),
        '/datetimepicker': (context) => DateTimePickerScreen(),
        '/sliver': (context) => SliverScreen(),
        '/theme': (context) => ThemeScreen(),
        '/provider': (context) => ProviderScreen(),
        '/weather': (context) => WeatherScreen(),
      },
    );
  }
}
