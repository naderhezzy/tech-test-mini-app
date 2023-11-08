import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import 'package:f1_ranking/data/models/driver_model.dart';

class DriverRepository {
  Future<List<DriverModel>> getDrivers() async {
    // Load driver data from assets
    final String jsonData = await rootBundle.loadString('assets/json/drivers_data.json');
    final List<dynamic> jsonList = json.decode(jsonData);

    List<DriverModel> drivers = jsonList.map((json) => DriverModel.fromJson(json)).toList();

    return drivers;
  }
}
