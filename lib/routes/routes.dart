import 'package:flutter/material.dart';
import 'package:test_flutter/pages/capture_screen/capture.dart';
import 'package:test_flutter/pages/home/home.dart';

class RouteGenerator {

  String route;

  static const home = "/";
  static const capture = "/capture";

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return switch(settings.name) {
      capture => MaterialPageRoute(builder: (ctx) => const CaptureScreen()),
      _ => MaterialPageRoute(builder: (ctx) => const HomePage())
    };
  }

  RouteGenerator.homePage() : route = home;

  RouteGenerator.capturePage() : route = capture;

  Future<void> goTo(BuildContext context) async {
    Navigator.pushNamedAndRemoveUntil(context, route, (route) => false);
  }
}