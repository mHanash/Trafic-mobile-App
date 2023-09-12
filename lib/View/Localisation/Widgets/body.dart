import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
        Positioned(
          top: 16.0,
          left: 16.0,
          right: 16.0,
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: "Arrêt de départ",
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.location_on),
                ),
                onChanged: (value) {
                  // Stocke la valeur dans une variable pour une utilisation ultérieure
                },
              ),
              const SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  labelText: "Arrêt d'arrivée",
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.location_on),
                ),
                onChanged: (value) {
                  // Stocke la valeur dans une variable pour une utilisation ultérieure
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
