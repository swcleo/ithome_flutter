import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  _FormScreen createState() => _FormScreen();
}

class _FormScreen extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  String value = '';

  @override
  Widget build(BuildContext context) {
    var nameTextFiled = Container(
      margin: EdgeInsets.all(20.0),
      child: TextField(
        controller: nameController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Full Name',
        ),
        onChanged: (String text) {
          setState(() {
            value = text;
          });
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
            value = text;
          });
        },
      ),
    );

    var inputValue = Container(
      margin: EdgeInsets.all(20),
      child: Text(value),
    );

    return Scaffold(
      appBar: AppBar(title: const Text("Form")),
      body: Center(
        child: Column(
          children: [
            nameTextFiled,
            passwordTextFormField,
            inputValue,
          ],
        ),
      ),
    );
  }
}
