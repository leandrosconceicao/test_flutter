import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_flutter/models/todo.dart';


class CaptureViewScreen {
  CaptureViewScreen._internal();

  static final CaptureViewScreen _instance = CaptureViewScreen._internal();

  factory CaptureViewScreen() => _instance;

  final inputFcs = FocusNode();
  final inputControl = TextEditingController();

  final todo = Todo();

  int? _editIndex;

  static const _key = 'capture';

  void saveData() {
    if (_editIndex == null) {
      todo.addItem(inputControl.text);
    } else {
      todo.replaceData(_editIndex!, inputControl.text);
      _editIndex = null;
    }
    inputControl.clear();
    saveToPrefs();
  }

  void setEditIndex(int index) {
    _editIndex = index;
  }

  void removeData(String value) {
    todo.removeItem(value);
    saveToPrefs();
  }

  Future<void> saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(_key, todo.data);
  }

  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getStringList(_key);
    if (data?.isNotEmpty ?? false) {
      todo.addAll(data!);
    }
  }

}