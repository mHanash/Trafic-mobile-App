import 'package:flutter/material.dart';
import 'package:trafic_app/models/driver_location.dart';
import 'package:trafic_app/services/location_service.dart';

class DriverViewModel with ChangeNotifier {
  String driverId = '';
  DriverLocation? driverLocation;
  bool isLoading = false;

  Future<void> getLocation() async {
    try {
      isLoading = true;
      notifyListeners();

      final locationService = LocationService();
      final location = await locationService.getDriverLocation(driverId);

      driverLocation = location;
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      notifyListeners();
      print('Erreur lors de la récupération de la localisation : $e');
    }
  }
}
