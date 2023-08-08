import 'package:flutter/material.dart';
import 'package:trafic_app/View/Localisation/Widgets/body.dart';
import 'package:trafic_app/View/Partials/headerAll.dart';

class LocalisationPage extends StatefulWidget {
  const LocalisationPage({super.key});

  @override
  State<LocalisationPage> createState() => _LocalisationPageState();
}

class _LocalisationPageState extends State<LocalisationPage> {
  HeaderSectionAll header = HeaderSectionAll();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header.getAppBar('Localisation'),
      body: BodyLocalisation(),
    );
  }
}
