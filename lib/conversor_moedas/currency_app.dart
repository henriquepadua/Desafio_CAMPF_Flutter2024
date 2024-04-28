import 'package:camp_examples/conversor_moedas/views/home_view.dart';
import 'package:flutter/material.dart';

// Inicializador do App exemplo de sala de aula
class CurrencyApp extends StatelessWidget {
  const CurrencyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const HomeView(),
    );
  }
}