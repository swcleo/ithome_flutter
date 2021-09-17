import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const FIRST_NAME = "preference.user.firstName";
const LAST_NAME = "preference.user.lastName";
const ADD_FRIEND = "preference.user.addFriend";

class PreferenceViewModle with ChangeNotifier {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  late SharedPreferences prefs;

  bool _addFriend = false;

  set addFriend(bool value) {
    _addFriend = value;
    notifyListeners();
  }

  bool get addFriend => _addFriend;

  void init() async {
    prefs = await SharedPreferences.getInstance();
    _loadPreferences();
  }

  void _loadPreferences() {
    firstNameController.text = prefs.getString(FIRST_NAME) ?? "";
    lastNameController.text = prefs.getString(LAST_NAME) ?? "";
    addFriend = prefs.getBool(ADD_FRIEND) ?? true;
    notifyListeners();
  }

  void save() {
    prefs.setString(FIRST_NAME, firstNameController.text);
    prefs.setString(LAST_NAME, lastNameController.text);
    prefs.setBool(ADD_FRIEND, addFriend);
  }

  void cancel() {
    _loadPreferences();
  }
}
