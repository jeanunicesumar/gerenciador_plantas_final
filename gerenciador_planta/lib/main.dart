import 'package:flutter/material.dart';
import 'package:gerenciador_planta/screens/home.dart';

void main() {
  runApp(
    const Initial(),
  );
}

class Initial extends StatelessWidget {
  const Initial({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.white,
      ),
      home: const Home(),
    );
  }
}