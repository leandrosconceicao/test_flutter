// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Todo on TodoBase, Store {
  late final _$dataAtom = Atom(name: 'TodoBase.data', context: context);

  @override
  ObservableList<String> get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(ObservableList<String> value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  late final _$TodoBaseActionController =
      ActionController(name: 'TodoBase', context: context);

  @override
  void addItem(String value) {
    final _$actionInfo =
        _$TodoBaseActionController.startAction(name: 'TodoBase.addItem');
    try {
      return super.addItem(value);
    } finally {
      _$TodoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addAll(List<String> values) {
    final _$actionInfo =
        _$TodoBaseActionController.startAction(name: 'TodoBase.addAll');
    try {
      return super.addAll(values);
    } finally {
      _$TodoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeItem(String value) {
    final _$actionInfo =
        _$TodoBaseActionController.startAction(name: 'TodoBase.removeItem');
    try {
      return super.removeItem(value);
    } finally {
      _$TodoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void replaceData(int value, String newValue) {
    final _$actionInfo =
        _$TodoBaseActionController.startAction(name: 'TodoBase.replaceData');
    try {
      return super.replaceData(value, newValue);
    } finally {
      _$TodoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
data: ${data}
    ''';
  }
}
