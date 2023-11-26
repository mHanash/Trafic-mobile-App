import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_maps_flutter_web/google_maps_flutter_web.dart';
import 'package:provider/provider.dart';
import 'package:trafic_app/helpers/colors.dart';
import 'package:trafic_app/models/vehicle_location.dart';
import 'package:trafic_app/services/location_service.dart';
import 'package:trafic_app/viewmodels/passenger_viewmodel.dart';

class ViewVehicle extends StatefulWidget {
  const ViewVehicle({super.key});

  @override
  State<ViewVehicle> createState() => _ViewVehicleState();
}

class _ViewVehicleState extends State<ViewVehicle> {
  final TextEditingController _vehicleNumberController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final viewModel = Provider.of<PassengerViewModel>(context);
    LocationService locationService = LocationService();
    locationService.getCurrentLocation(context);
    LatLng pGoogleMaps = LatLng(0, 0);
    setState(() {
      pGoogleMaps = LatLng(locationService.getLatitudeValue(),
          locationService.getLongitudeValue());
    });
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PassengerViewModel>(
          create: (_) => PassengerViewModel(),
        ),
        // Ajoute d'autres fournisseurs pour les autres view models si nécessaire
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(primaryColor),
          title: Text("Vous suivez un véhicule"),
        ),
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: pGoogleMaps,
                zoom: 13,
              ),
            ),
            Positioned(
              left: 16, // Position horizontale (X)
              bottom: 70, // Position verticale (Y)
              child: Card(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Temps restant :",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      Text(
                        "1 min",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "Position actuelle : ",
                        style: TextStyle(fontSize: 12.0),
                      ),
                      Row(
                        children: [
                          Text(
                            "Trinité",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(primaryColor)),
                          ),
                          SizedBox(
                            width: 40.0,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 6, vertical: 3),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              'En cours',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VehicleMap extends StatelessWidget {
  final VehicleLocation initialLocation;

  const VehicleMap({required this.initialLocation});

  @override
  Widget build(BuildContext context) {
    return Text(
        'Implementer la carte de localisation ici avec la position initiale : ${initialLocation.latitude}, ${initialLocation.longitude}');
  }
}
