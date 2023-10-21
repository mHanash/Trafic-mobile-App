import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:trafic_app/View/Home/Widgets/menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/images/traffic.jpeg'),
            fit: BoxFit.cover,
          ),
          color: Colors.black.withOpacity(0.5),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
          child: const Center(
            child: SizedBox(
              height: 350,
              width: 300,
              child: MenuIcon(),
            ),
          ),
        ),
      ),
    );
  }
}
