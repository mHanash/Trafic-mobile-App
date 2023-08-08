import 'package:flutter/material.dart';
import 'package:trafic_app/View/History/history.dart';
import 'package:trafic_app/View/Localisation/localisation.dart';
import 'package:trafic_app/View/Planning/planning.dart';
import 'package:trafic_app/View/Trafic/trafic.dart';

class MenuIcon extends StatelessWidget {
  const MenuIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      crossAxisCount: 2,
      children: const [
        MenuButton(
            text: 'Localisation',
            iconData: Icons.map_sharp,
            color: Color(0xFF0E5793),
            action: 'localisation'),
        MenuButton(
            text: 'Traffic',
            iconData: Icons.traffic_outlined,
            color: Color(0xFF3669F4),
            action: 'trafic'),
        MenuButton(
            text: 'Planification',
            iconData: Icons.calendar_month_outlined,
            color: Color(0xFF16215A),
            action: 'planning'),
        MenuButton(
            text: 'Historique',
            iconData: Icons.history,
            color: Color(0xFF4581B5),
            action: 'history'),
      ],
    );
  }
}

class MenuButton extends StatelessWidget {
  final String text;
  final IconData iconData;
  final Color color;
  final String action;

  const MenuButton(
      {super.key,
      required this.text,
      required this.iconData,
      required this.color,
      required this.action});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        routing(action, context);
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0), color: color),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              size: 48,
              color: Colors.white,
            ),
            const SizedBox(height: 8),
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void routing(String action, BuildContext context) {
    switch (action) {
      case 'trafic':
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: ((context) => const TraficPage()),
          ),
        );
        break;
      case 'localisation':
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: ((context) => const LocalisationPage()),
          ),
        );
        break;
      case 'history':
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: ((context) => const HistoryPage()),
          ),
        );
        break;
      case 'planning':
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: ((context) => const PlanningPage()),
          ),
        );
        break;
      default:
    }
  }
}
