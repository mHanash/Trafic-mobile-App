import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:trafic_app/models/driver_location.dart';
import 'package:trafic_app/models/vehicle_location.dart';
import 'dart:convert';

class LocationService {
  static const apiUrl = 'https://api.example.com/';

  static double longitude_value = 0.00;
  static double latitude_value = 0.00;

  Future<VehicleLocation> getVehicleLocation(String vehicleNumber) async {
    final response = await http.get(Uri.parse('$apiUrl/get_location'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final latitude = data['latitude'];
      final longitude = data['longitude'];
      return VehicleLocation(latitude: latitude, longitude: longitude);
    } else {
      throw Exception(
          'Erreur lors de la récupération de la localisation du véhicule');
    }
  }

  Future<DriverLocation> getDriverLocation(String driverId) async {
    try {
      final url = Uri.parse('$apiUrl/$driverId/location');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final latitude = data['latitude'];
        final longitude = data['longitude'];

        return DriverLocation(latitude: latitude, longitude: longitude);
      } else {
        throw Exception(
            'Erreur lors de la récupération de la localisation du chauffeur');
      }
    } catch (e) {
      throw Exception('Erreur lors de la communication avec l\'API : $e');
    }
  }

  void getCurrentLocation(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    // Vérifier si les services de localisation sont activés
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Les services de localisation ne sont pas activés, faites quelque chose (afficher un message d'erreur, demander à l'utilisateur d'activer la localisation, etc.)
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Services de localisation désactivés'),
          content: const Text(
              'Veuillez activer les services de localisation pour utiliser cette fonctionnalité.'),
          actions: [
            TextButton(
              child: const Text('Fermer'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
      return;
    }

    // Vérifier si l'application a l'autorisation d'accéder à la localisation de l'appareil
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // L'autorisation d'accès à la localisation est refusée, demander à l'utilisateur de l'autoriser
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // L'autorisation d'accès à la localisation a été refusée, faites quelque chose (afficher un message d'erreur, demander à l'utilisateur d'activer la localisation, etc.)
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // L'autorisation d'accès à la localisation est refusée de façon permanente, faites quelque chose (afficher un message d'erreur, demander à l'utilisateur d'activer la localisation, etc.)
      return;
    }

    // Obtenir la position actuelle
    Position position = await Geolocator.getCurrentPosition();

    // Utilisez la position pour faire ce que vous voulez (afficher, enregistrer, etc.)
    latitude_value = position.latitude;
    longitude_value = position.longitude;

    print('Latitude: $latitude_value, Longitude: $longitude_value');
  }

  double getLatitudeValue() {
    return latitude_value;
  }

  double getLongitudeValue() {
    return longitude_value;
  }
}
