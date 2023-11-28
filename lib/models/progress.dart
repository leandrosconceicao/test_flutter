import 'package:mobx/mobx.dart';

part "progress.g.dart";

class Progress = ProgressBase with _$Progress;

abstract class ProgressBase with Store {

  @observable
  Observable isLoading = Observable(false);

  @action
  void activateLoading(bool value) {
    isLoading.value = value;
  }
}