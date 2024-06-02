import 'package:aba_pi5_poc/src/core/constants.dart';
import 'package:aba_pi5_poc/src/features/home/presentation/home_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorSchemeSeed: themeColor),
      home: const HomeNavigation(),
    );
  }
}
