import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  _FormScreen createState() => _FormScreen();
}

class _FormScreen extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  String value = '';
  String dropdownValue = 'Taiwan';
  bool isSwitched = false;
  bool isChecked = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final items = ["Taiwan", "Korean", "Japan"];

  @override
  Widget build(BuildContext context) {
    var nameTextFiled = Container(
      margin: EdgeInsets.all(20.0),
      child: TextFormField(
        autofocus: true,
        controller: nameController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Full Name',
        ),
        onChanged: (String text) {
          setState(() {
            value = "Full name: $text";
          });
        },
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return '姓名不得為空';
          }
          return null;
        },
      ),
    );

    var passwordTextFormField = Container(
      margin: EdgeInsets.all(20),
      child: TextFormField(
        obscureText: true,
        decoration: const InputDecoration(
          labelText: 'Password',
        ),
        onChanged: (String text) {
          setState(() {
            value = "Password: $text";
          });
        },
        validator: (String? value) {
          RegExp mobile =
              new RegExp(r"(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,12}$");

          if (value == null || value.isEmpty) {
            return '密碼格式不符合為空';
          }

          if (!mobile.hasMatch(value)) {
            return "密碼格式不符合";
          }

          return null;
        },
      ),
    );

    var inputValue = Container(
      margin: EdgeInsets.all(20),
      child: Text(value),
    );

    var theSwitch = Switch(
      value: isSwitched,
      onChanged: (value) {
        setState(() {
          isSwitched = value;
        });
      },
      activeTrackColor: Colors.yellow,
      activeColor: Colors.orangeAccent,
    );

    var theCheckBox = Checkbox(
      value: isChecked,
      activeColor: Colors.red, //选中时的颜色
      onChanged: (value) {
        setState(() {
          isChecked = value!;
        });
      },
    );

    var theDropdownButton = DropdownButton(
      value: dropdownValue,
      icon: Icon(Icons.keyboard_arrow_down),
      onChanged: (String? value) {
        print(value);
        setState(() {
          dropdownValue = value!;
        });
      },
      items: items.map((String item) {
        return DropdownMenuItem(
          value: item,
          child: Text(item),
        );
      }).toList(),
    );

    var datePickButton = ElevatedButton(
      onPressed: () async {
        final result = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2021, 01),
          lastDate: DateTime(2021, 12),
        );

        print(result);
      },
      child: const Text('日期選擇器'),
    );

    var dateRangePickButton = ElevatedButton(
      onPressed: () async {
        final result = await showDateRangePicker(
          context: context,
          firstDate: DateTime(2021, 01),
          lastDate: DateTime(2021, 12),
        );

        print(result);
      },
      child: const Text('日期區間選擇器'),
    );

    var timePickButton = ElevatedButton(
      onPressed: () async {
        final result = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
          initialEntryMode: TimePickerEntryMode.input,
        );

        print(result);
      },
      child: const Text('時間選擇器'),
    );

    var submit = ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Processing Data')),
          );
        }
      },
      child: const Text('Submit'),
    );

    var form = Form(
      key: _formKey,
      child: Column(
        children: [
          nameTextFiled,
          passwordTextFormField,
          inputValue,
          theSwitch,
          theCheckBox,
          theDropdownButton,
          datePickButton,
          dateRangePickButton,
          timePickButton,
          submit
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(title: const Text("Form")),
      body: Center(
        child: form,
      ),
    );
  }
}
