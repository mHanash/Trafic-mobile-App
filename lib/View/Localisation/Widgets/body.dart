import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trafic_app/View/Partials/header.dart';

class BodyLocalisation extends StatefulWidget {
  const BodyLocalisation({super.key});

  @override
  State<BodyLocalisation> createState() => _BodyLocalisationState();
}

class _BodyLocalisationState extends State<BodyLocalisation> {
  @override
  Widget build(BuildContext context) {
    // const data = <String>['Bus 1', 'Bus 2'];
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: const CameraPosition(
            target: LatLng(-4.325, 15.322222),
            zoom: 14.0,
          ),
          markers: <Marker>{
            const Marker(
              markerId: MarkerId('vehicleMarker'),
              position: LatLng(-4.325, 15.322222),
              infoWindow: InfoWindow(title: 'Véhicule'),
            ),
          },
        ),
        const Positioned(
          top: 16.0,
          left: 16.0,
          right: 16.0,
          child: HeaderSection(),
        ),
        Positioned(
          bottom: 16.0,
          left: 16.0,
          right: 16.0,
          child: Container(
            padding: const EdgeInsets.all(10),
            height: MediaQuery.sizeOf(context).height / 4,
            decoration: BoxDecoration(
              color: const Color.fromARGB(164, 201, 207, 212),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      getBusProposition(),
                      getBusProposition(),
                      getBusProposition(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0D42A9),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text(
                      'Ligne 19 : Campus - Victoire',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget getBusProposition() {
    return SizedBox(
      width: (MediaQuery.of(context).size.width) / 4,
      child: const Card(
        color: Colors.green,
        child: Center(
          child: Column(
            children: [
              Icon(
                Icons.directions_bus,
                color: Colors.white,
                size: 50,
              ),
              Text(
                'Environ',
                style: TextStyle(color: Color.fromARGB(180, 255, 255, 255)),
              ),
              Text(
                '10min',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
