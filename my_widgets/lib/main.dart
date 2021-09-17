import 'package:flutter/material.dart';
import 'views/home.dart';
import 'views/text.dart';
import 'views/image.dart';
import 'views/icon.dart';
import 'views/time.dart';
import 'views/button.dart';
import 'views/form.dart';
import 'views/layout.dart';
import 'views/container.dart';
import 'views/listview.dart';
import 'views/gridview.dart';
import 'views/sliver.dart';
import 'views/datetimepicker.dart';
import 'views/theme.dart';
import 'views/provider.dart';
import 'views/weather.dart';
import 'views/preference.dart';

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
        '/preference': (context) => PreferenceScreen(),
      },
    );
  }
}
