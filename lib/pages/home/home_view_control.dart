import 'package:flutter/material.dart';
import 'package:test_flutter/controllers/controller.dart';
import 'package:test_flutter/models/progress.dart';
import 'package:test_flutter/routes/routes.dart';

class HomeViewControl {
  HomeViewControl._internal();

  static final HomeViewControl _instance = HomeViewControl._internal();

  factory HomeViewControl() => _instance;

  final userInput = TextEditingController();
  final passInput = TextEditingController();

  final userFcs = FocusNode();
  final passFcs = FocusNode();
  
  static final _api = MyApi();

  final progress = Progress();

  Future<void> authUser(BuildContext context) async {
    progress.activateLoading(true);
    final data = await _api.test(user: userInput.text, password: passInput.text);
    progress.activateLoading(false);
    if (!data.isSucceful) {
      showDialog(context: context, builder: (ctx) {
        return AlertDialog(
          title: const Text("Atenção"),
          content: Text(data.message, style: Theme.of(context).textTheme.bodyLarge,),
          actions: [
            TextButton(onPressed: () {
              Navigator.of(context).pop();
            }, child: const Text("Fechar"))
          ],
        );
      });
      return;
    }
    RouteGenerator.capturePage().goTo(context);
  }
}
