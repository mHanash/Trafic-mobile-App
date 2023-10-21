import 'package:flutter/material.dart';
import 'package:trafic_app/View/Localisation/Widgets/body.dart';

class LocalisationPage extends StatefulWidget {
  const LocalisationPage({super.key});

  @override
  State<LocalisationPage> createState() => _LocalisationPageState();
}

class _LocalisationPageState extends State<LocalisationPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyLocalisation(),
    );
  }
}
