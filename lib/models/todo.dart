import 'package:mobx/mobx.dart';

part "todo.g.dart";

class Todo = TodoBase with _$Todo;

abstract class TodoBase with Store {

  @observable
  ObservableList<String> data = ObservableList<String>();

  @action
  void addItem(String value) => data.add(value);

  @action
  void addAll(List<String> values) => data.addAll(values);

  @action
  void removeItem(String value) => data.remove(value);

  @action
  void replaceData(int value, String newValue) {
    data.removeAt(value);
    data.insert(value, newValue);
  }
}