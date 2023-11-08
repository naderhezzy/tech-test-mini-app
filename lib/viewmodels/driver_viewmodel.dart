import 'package:flutter/material.dart';

import 'package:f1_ranking/models/driver_model.dart';
import 'package:f1_ranking/services/driver_service.dart';

class DriverViewmodel extends ChangeNotifier {
  DriverViewmodel() {
    init();
  }

  DriverService driverService = DriverService();

  List<DriverModel> _drivers = [];
  List<DriverModel> get drivers => _drivers;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void init() => getDrivers();

  Future<void> getDrivers() async {
    _isLoading = true;
    notifyListeners();

    final List jsonList = await driverService.loadDriversData();
    _drivers = jsonList.map((json) => DriverModel.fromJson(json)).toList();

    _isLoading = false;
    notifyListeners();
  }
}
