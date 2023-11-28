import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:test_flutter/pages/home/home_view_control.dart';
import 'package:test_flutter/utils/form_validators.dart';
import 'package:test_flutter/utils/layout_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with FormValidators, LayoutWidgets {
  final control = HomeViewControl();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(control.userFcs);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        return Stack(
          children: [
            background(),
            !isMobile
                ? Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: SizedBox(
                              height: constraints.maxHeight * .25,
                              child: const FlutterLogo())),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: loginForm(false, context),
                      ))
                    ],
                  )
                : loginForm(isMobile, context),
            policyLink()
          ],
        );
      }),
    );
  }

  Center loginForm(bool isMobile, BuildContext context) {
    return Center(
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              inputForm(
                "Usuário",
                icon: Icons.person,
                validator: userInputValidation,
                focus: control.userFcs,
                control: control.userInput,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(control.passFcs);
                },
              ),
              inputForm(
                "Senha",
                icon: Icons.lock,
                validator: passInputValidation,
                obscureText: true,
                focus: control.passFcs,
                control: control.passInput,
                onFieldSubmitted: (_) => authUser(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: SizedBox(
                  width: isMobile
                      ? MediaQuery.of(context).size.width * .55
                      : double.infinity,
                  height:
                      isMobile ? MediaQuery.of(context).size.width * .1 : null,
                  child: Observer(
                    builder: (_) {
                      final loading = control.progress.isLoading.value;
                      return FilledButton(
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            Color(0xFF44bd6e),
                          ),
                        ),
                        onPressed: loading ? null : authUser,
                        child: loading ? const Center(child: SizedBox(
                          height: 15,
                          width: 15,
                          child: CircularProgressIndicator(),
                        ),) : const Text("Entrar"),
                      );
                    }
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget inputForm(
    String label, {
    required IconData icon,
    TextEditingController? control,
    String? Function(String?)? validator,
    bool obscureText = false,
    FocusNode? focus,
    void Function(String?)? onFieldSubmitted,
  }) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .75,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Text(label),
                ],
              ),
            ),
            TextFormField(
              obscureText: obscureText,
              controller: control,
              validator: validator,
              onFieldSubmitted: onFieldSubmitted,
              decoration: InputDecoration(filled: true, prefixIcon: Icon(icon)),
            ),
          ],
        ),
      ),
    );
  }

  void authUser() {
    if (!formKey.currentState!.validate()) {
      return;
    }
    control.authUser(context);
  }
}
