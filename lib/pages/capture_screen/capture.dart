import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:test_flutter/pages/capture_screen/capture_view_control.dart';
import 'package:test_flutter/routes/routes.dart';
import 'package:test_flutter/utils/form_validators.dart';
import 'package:test_flutter/utils/layout_widgets.dart';

class CaptureScreen extends StatefulWidget {
  const CaptureScreen({super.key});

  @override
  State<CaptureScreen> createState() => _CaptureScreenState();
}

class _CaptureScreenState extends State<CaptureScreen>
    with LayoutWidgets, FormValidators {
  final control = CaptureViewScreen();
  final formKey = GlobalKey<FormState>();
  final scroll = ScrollController();

  @override
  void initState() {
    control.inputFcs.addListener(() {
      control.inputFcs.requestFocus();
    });
    control.loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1e5465),
        elevation: 0,
        actions: [
          IconButton(
            color: Colors.white,
            tooltip: "Logout",
            onPressed: () {
              RouteGenerator.homePage().goTo(context);
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Stack(
        children: [
          background(),
          Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 48.0, right: 16.0, left: 16.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Observer(
                          builder: (_) {
                            final value = control.todo.data;
                            if (value.isEmpty) {
                              return SizedBox(
                                width: double.infinity,
                                height: 400,
                                child: Center(
                                  child: Text(
                                    "Nenhum dado cadastrado\nno momento",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                            }
                            return SizedBox(
                              width: double.infinity,
                              height: 400,
                              child: Scrollbar(
                                thumbVisibility: true,
                                controller: scroll,
                                child: ListView.separated(
                                    padding: const EdgeInsets.all(8.0),
                                    controller: scroll,
                                    separatorBuilder: (_, i) => i == 0
                                        ? const SizedBox()
                                        : const Divider(),
                                    itemCount: value.length,
                                    itemBuilder: (ctx, i) {
                                      final data = value[i];
                                      if (i == 0) {
                                        return Column(
                                          children: [
                                            register(data, context, i),
                                            const Divider()
                                          ],
                                        );
                                      }
                                      return register(data, context, i);
                                    }),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 24.0, right: 16.0, left: 16.0),
                    child: TextFormField(
                      autofocus: true,
                      controller: control.inputControl,
                      focusNode: control.inputFcs,
                      textAlign: TextAlign.center,
                      validator: todoValidation,
                      onFieldSubmitted: (_) {
                        saveData();
                      },
                      decoration: InputDecoration(
                          hintStyle: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                          hintText: "Digite seu texto",
                          filled: true),
                    ),
                  )
                ],
              ),
            ),
          ),
          policyLink()
        ],
      ),
    );
  }

  Row register(String data, BuildContext context, int i) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(),
        Text(
          data,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        ButtonBar(
          children: [
            IconButton(
                onPressed: () => onEditData(data, i),
                icon: const Icon(Icons.edit_rounded)),
            IconButton.filled(
                color: Colors.white,
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.red)),
                onPressed: () => onExludeData(data),
                icon: const Icon(Icons.close)),
          ],
        ),
      ],
    );
  }

  void saveData() {
    if (!formKey.currentState!.validate()) {
      return;
    }
    control.saveData();
  }

  Future<void> onExludeData(String data) async {
    final isConfirm = await showDialog<bool>(
        context: context,
        builder: (ctx) {
          var data = "Sim";
          return AlertDialog(
            title: const Text("Atenção"),
            content: Text(
              "Confirma a exclusão dos dados?",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            actions: [
              FilledButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Color(0xFF44bd6e),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text(data),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: const Text("Não"))
            ],
          );
        });
    if (isConfirm ?? false) {
      control.removeData(data);
    }
  }

  Future<void> onEditData(String data, int index) async {
    control.inputControl.text = data;
    control.setEditIndex(index);
  }
}
