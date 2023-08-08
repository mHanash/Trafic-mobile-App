import 'package:flutter/material.dart';
import 'package:trafic_app/View/Partials/headerAll.dart';

class PlanningPage extends StatefulWidget {
  const PlanningPage({super.key});

  @override
  State<PlanningPage> createState() => _PlanningPageState();
}

class _PlanningPageState extends State<PlanningPage> {
  HeaderSectionAll header = HeaderSectionAll();
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: header.getAppBar('Planification'));
  }
}
