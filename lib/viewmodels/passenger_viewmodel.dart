import 'package:flutter/material.dart';
import 'package:trafic_app/models/vehicle_location.dart';
import 'package:trafic_app/services/location_service.dart';

class PassengerViewModel with ChangeNotifier {
  String vehicleNumber = '';
  VehicleLocation? vehicleLocation;
  bool isLoading = false;

  Future<void> getLocation() async {
    try {
      isLoading = true;
      notifyListeners();

      final locationService = LocationService();
      final location = await locationService.getVehicleLocation(vehicleNumber);

      vehicleLocation = location;
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      notifyListeners();
      print('Erreur lors de la récupération de la localisation : $e');
    }
  }
}
