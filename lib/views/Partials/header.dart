import 'package:flutter/material.dart';
import 'package:trafic_app/views/Partials/navbar.dart';
import 'package:trafic_app/views/Widgets/search.dart';

class HeaderSection extends StatefulWidget {
  const HeaderSection({super.key});

  @override
  State<HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform(
          transform: Matrix4.identity()..rotateZ(20),
          origin: const Offset(150, 50),
          child: Image.asset(
            'assets/images/bg_liquid.png',
            width: 200,
          ),
        ),
        Positioned(
          right: 0,
          top: 200,
          child: Transform(
            transform: Matrix4.identity()..rotateZ(20),
            origin: const Offset(180, 100),
            child: Image.asset(
              'assets/images/bg_liquid.png',
              width: 200,
            ),
          ),
        ),
        const Column(
          children: [
            NavbarSection(),
            SearchSection(),
          ],
        ),
      ],
    );
  }
}
