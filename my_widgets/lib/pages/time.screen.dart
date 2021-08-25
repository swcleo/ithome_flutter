import 'package:flutter/material.dart';

import '../models/time.model.dart';

class TimeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Time")),
      body: Center(
        child: Clock(),
      ),
    );
  }
}

class Clock extends StatefulWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  _Clock createState() => _Clock();
}

class _Clock extends State<Clock> {
  final TimeModel time = TimeModel();

  String _now = "";

  _updateTime() {
    setState(() {
      _now = time.toString();
    });
  }

  @override
  void initState() {
    print('====initState===');
    super.initState();
    time.addListener(_updateTime);
  }

  @override
  void didChangeDependencies() {
    print('====didChangeDependencies===');
    super.didChangeDependencies();
  }

  @override
  void reassemble() {
    print('====reassemble====');
    super.reassemble();
  }

  @override
  Widget build(BuildContext context) {
    print('====build====');
    return Text(_now);
  }

  @override
  void didUpdateWidget(Clock oldWidget) {
    print('====didUpdateWidget====');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print('====deactivate====');
    super.deactivate();
  }

  @override
  void dispose() {
    print('====dispose====');
    super.dispose();
    time.removeListener(_updateTime);
  }
}
