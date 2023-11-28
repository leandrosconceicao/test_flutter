import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

mixin LayoutWidgets {
   Widget background() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF1d5264),
            Color(0xFF2d958e),
          ],
        ),
      ),
    );
  }

  Widget policyLink() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24.0),
        child: InkWell(
            onTap: () async {
              await launchUrlString("https://google.com.br");
            },
            child: Text("Política de Privacidade")),
      ),
    );
  }
}