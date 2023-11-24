import 'package:flutter/material.dart';
import 'package:trafic_app/helpers/colors.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(whiteColor),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            child: Card(
              color: Color(whiteColor),
              elevation: 0.1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: ListTile(
                dense: false,
                leading: Icon(Icons.history),
                title: Text(
                  "Ligne #" + (index + 1).toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                subtitle: Text(
                  "Jour/H:m",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                trailing: Icon(Icons.settings),
              ),
            ),
          );
        },
      ),
    );
  }
}
