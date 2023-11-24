import 'package:flutter/material.dart';
import 'package:trafic_app/helpers/colors.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.bus_alert_outlined,
          size: 70.0,
          color: Color(secondaryColor),
        ),
        Text(
          "No data ...",
          style: TextStyle(
            color: Color(secondaryColor),
            fontSize: 16.0,
          ),
        )
      ],
    );
  }
}
