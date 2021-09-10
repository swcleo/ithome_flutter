import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/time.model.dart';

class TimeLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var time = Provider.of<TimeModel>(context);
    return Text("of(): ${time.toString()}");
  }
}

class TimeBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TimeModel>(
      builder: (context, time, child) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [Text("Consumer: ${time.toString()}"), TimeLabel()],
          ),
        );
      },
    );
  }
}

class ProviderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Provider")),
      body: ChangeNotifierProvider(
        create: (context) => TimeModel(),
        child: TimeBox(),
      ),
    );
  }
}
