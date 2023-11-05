import 'package:f1_ranking/app/config/app_config.dart';
import 'package:flutter/material.dart';

import 'package:f1_ranking/data/driver_model.dart';
import 'package:f1_ranking/repositories/driver_repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final driverRepository = DriverRepository();

    return Center(
      child: Scaffold(
          body: Center(
        child: Container(
          height: context.height * 0.5,
          width: context.width * 0.5,
          child: FutureBuilder<List<DriverModel>>(
            future: driverRepository.getDrivers(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                final List<DriverModel> drivers = snapshot.data!;

                return ListView.builder(
                  itemCount: drivers.length,
                  itemBuilder: (context, index) {
                    final driver = drivers[index];
                    return ListTile(
                      title: Text(driver.fullName),
                    );
                  },
                );
              }
            },
          ),
        ),
      )),
    );
  }
}
