// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Progress on ProgressBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'ProgressBase.isLoading', context: context);

  @override
  Observable<dynamic> get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(Observable<dynamic> value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$ProgressBaseActionController =
      ActionController(name: 'ProgressBase', context: context);

  @override
  void activateLoading(bool value) {
    final _$actionInfo = _$ProgressBaseActionController.startAction(
        name: 'ProgressBase.activateLoading');
    try {
      return super.activateLoading(value);
    } finally {
      _$ProgressBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading}
    ''';
  }
}
