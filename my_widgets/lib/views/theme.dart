import 'package:flutter/material.dart';

class MyThemeData {
  final Color? primaryColor;
  MyThemeData({this.primaryColor});
  MyThemeData.fallback() : this(primaryColor: Colors.blue);
}

class MyThemeWidget extends InheritedWidget {
  final MyThemeData? data;
  MyThemeWidget({required Widget child, this.data}) : super(child: child);

  @override
  bool updateShouldNotify(MyThemeWidget oldWidget) {
    return oldWidget.data != data;
  }

  static MyThemeData of(BuildContext context) {
    final MyThemeWidget? _inheritedTheme =
        context.dependOnInheritedWidgetOfExactType<MyThemeWidget>();
    MyThemeData theme = _inheritedTheme?.data ?? MyThemeData.fallback();
    return theme;
  }
}

class TextLabel extends StatefulWidget {
  _TextLabelState createState() => _TextLabelState();
}

class _TextLabelState extends State<TextLabel> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies()");
  }

  @override
  Widget build(BuildContext context) {
    var primaryColor = MyThemeWidget.of(context).primaryColor;

    return Text(
      "使用來自 MyThemeWidget 設定的 MyThemeData",
      style: TextStyle(color: primaryColor),
    );
  }
}

class MyThemeBox extends StatefulWidget {
  _MyThemeBoxState createState() => _MyThemeBoxState();
}

class _MyThemeBoxState extends State<MyThemeBox> {
  bool toggle = false;
  Widget build(BuildContext context) {
    var color;
    if (toggle) {
      color = Colors.red;
    } else {
      color = Colors.blue;
    }
    return MyThemeWidget(
      data: MyThemeData(primaryColor: color),
      child: Container(
        child: Column(
          children: [
            Switch(
              value: toggle,
              onChanged: (bool value) {
                setState(() {
                  toggle = value;
                });
              },
            ),
            TextLabel(),
          ],
        ),
      ),
    );
  }
}

class ThemeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Theme")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // ignore: deprecated_member_use
            color: Theme.of(context).accentColor,
            child: Text(
              '使用來自 MaterialApp 設定的 ThemeData',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          MyThemeBox(),
        ],
      ),
    );
  }
}
