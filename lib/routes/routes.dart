import 'package:flutter/material.dart';
import 'package:test_flutter/pages/capture_screen/capture.dart';
import 'package:test_flutter/pages/home/home.dart';

class RouteGenerator {

  String route;

  static const _home = "/";
  static const _capture = "/capture";

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return switch(settings.name) {
      _capture => MaterialPageRoute(builder: (ctx) => const CaptureScreen()),
      _ => MaterialPageRoute(builder: (ctx) => const HomePage())
    };
  }

  RouteGenerator.homePage() : route = _home;

  RouteGenerator.capturePage() : route = _capture;

  Future<void> goTo(BuildContext context) async {
    Navigator.pushNamedAndRemoveUntil(context, route, (route) => false);
  }
}