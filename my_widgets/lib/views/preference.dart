import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/preference.dart';

class PreferenceScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PreferenceState();
  }
}

class _PreferenceState extends State<PreferenceScreen> {
  PreferenceViewModle vm = PreferenceViewModle();

  @override
  void initState() {
    super.initState();
    vm.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("")),
      body: ChangeNotifierProvider<PreferenceViewModle>(
        create: (_) => vm,
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                "設定",
                style: TextStyle(fontSize: 25.0),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '姓氏',
                ),
                controller: vm.firstNameController,
              ),
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '名字',
                ),
                controller: vm.lastNameController,
              ),
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("允許公開加好友", style: TextStyle(fontSize: 16.0)),
                  Consumer<PreferenceViewModle>(
                    builder: (context, vm, child) {
                      return Switch(
                        value: vm.addFriend,
                        onChanged: (bool value) {
                          vm.addFriend = value;
                        },
                      );
                    },
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    child: Text("取消"),
                    onPressed: () {
                      vm.cancel();
                    },
                  ),
                  ElevatedButton(
                    child: Text("儲存"),
                    onPressed: () {
                      vm.save();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
