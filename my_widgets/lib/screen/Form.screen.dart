import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  _FormScreen createState() => _FormScreen();
}

class _FormScreen extends State<FormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final items = ["Taiwan", "Korean", "Japan"];

  String value = '';
  String dropdownValue = 'Taiwan';
  bool isSwitched = false;
  bool optionsA = false;
  bool optionsB = false;
  String? radioValue = "1";

  TextEditingController nameController = TextEditingController();
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var textField = Container(
      margin: EdgeInsets.all(20.0),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          hintText: 'Search',
        ),
        onChanged: (String text) {
          setState(() {
            value = "Search: $text";
          });
        },
      ),
    );

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
      margin: EdgeInsets.all(5),
      child: Text(value),
    );

    var theRadio = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Radio<String>(
          value: "1",
          groupValue: radioValue,
          onChanged: (value) {
            setState(() {
              radioValue = value;
            });
          },
        ),
        Text("選項一"),
        Radio<String>(
          value: "2",
          groupValue: radioValue,
          onChanged: (value) {
            setState(() {
              radioValue = value;
            });
          },
        ),
        Text("選項二"),
      ],
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

    var theCheckBox = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          value: optionsA,
          activeColor: Colors.red, //选中时的颜色
          onChanged: (value) {
            setState(() {
              optionsA = value!;
            });
          },
        ),
        Text("A"),
        Checkbox(
          value: optionsB,
          activeColor: Colors.red, //选中时的颜色
          onChanged: (value) {
            setState(() {
              optionsB = value!;
            });
          },
        ),
        Text("B"),
      ],
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

    var submit = ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Processing Data')),
          );
        }
      },
      child: const Text('送出'),
    );

    var reset = ElevatedButton(
      style: ElevatedButton.styleFrom(primary: Colors.red),
      onPressed: () {
        _formKey.currentState!.reset();
        searchController.clear();
        nameController.clear();
        setState(() {
          value = "";
          optionsA = false;
          optionsB = false;
          isSwitched = false;
          radioValue = "1";
          dropdownValue = "Taiwan";
        });
      },
      child: const Text('重置'),
    );

    var buttons = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        submit,
        reset,
      ],
    );

    var form = Form(
      key: _formKey,
      child: Column(
        children: [
          textField,
          nameTextFiled,
          passwordTextFormField,
          inputValue,
          theSwitch,
          theCheckBox,
          theDropdownButton,
          theRadio,
          buttons,
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
