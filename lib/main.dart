import 'package:flutter/material.dart';
import 'package:trafic_app/View/Home/home.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Trafic App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
