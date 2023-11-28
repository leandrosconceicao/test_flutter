import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))
          ),
          errorStyle: TextStyle(
            color: Colors.redAccent,
            fontStyle: FontStyle.italic
          )
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.white
          )
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Color(0xFF44bd6e)
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      onGenerateRoute: RouteGenerator.onGenerateRoute,
      initialRoute: RouteGenerator.homePage().route,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [Locale('pt')],
      // home: const HomePage(),
    );
  }
}
