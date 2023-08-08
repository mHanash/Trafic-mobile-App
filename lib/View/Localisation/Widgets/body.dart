import 'package:flutter/material.dart';

class BodyLocalisation extends StatefulWidget {
  const BodyLocalisation({super.key});

  @override
  State<BodyLocalisation> createState() => _BodyLocalisationState();
}

class _BodyLocalisationState extends State<BodyLocalisation> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(),
        Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 50.0,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0x882A2A2A),
                    fixedSize: Size.fromWidth(
                        MediaQuery.of(context).size.width - 20.0)),
                onPressed: (() => {}),
                label: const Text('Entrer un emplacement'),
                icon: const Icon(Icons.search),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 6,
              margin:
                  const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.blue[900],
              ),
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Arrêt de départ',
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Arrêt d\'arrivé',
                        labelStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
