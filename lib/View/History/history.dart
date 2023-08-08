import 'package:flutter/material.dart';
import 'package:trafic_app/View/Partials/headerAll.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  HeaderSectionAll header = HeaderSectionAll();
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: header.getAppBar('Historique'));
  }
}
