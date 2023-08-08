import 'package:flutter/material.dart';
import 'package:trafic_app/View/Partials/headerAll.dart';

class TraficPage extends StatefulWidget {
  const TraficPage({super.key});

  @override
  State<TraficPage> createState() => _TraficPageState();
}

class _TraficPageState extends State<TraficPage> {
  HeaderSectionAll header = HeaderSectionAll();
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: header.getAppBar('Traffic'));
  }
}
