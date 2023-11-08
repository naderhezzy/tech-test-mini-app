import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class DriverService {
  Future<List> loadDriversData() async {
    // Load drivers data from assets
    final String jsonData = await rootBundle.loadString(
      'assets/json/drivers_data.json',
    );

    final jsonList = json.decode(jsonData);
    return jsonList;
  }
}
