import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/time.model.dart';

class TimeOfWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var time = Provider.of<TimeModel>(context);
    return Text("of(): ${time.toString()}");
  }
}

class TimeConsumerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TimeModel>(
      builder: (context, time, child) {
        return Text("Consumer: ${time.toString()}");
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TimeConsumerWidget(),
              TimeOfWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
