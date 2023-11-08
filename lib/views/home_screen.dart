// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:f1_ranking/styles/app_styles.dart';
import 'package:f1_ranking/utils/utils.dart';
import 'package:flutter/material.dart';

import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';

import 'package:f1_ranking/models/driver_model.dart';
import 'package:f1_ranking/viewmodels/driver_repository.dart';
import 'package:f1_ranking/widgets/driver_tile.dart';
import 'package:f1_ranking/widgets/user_info.dart';
import 'package:f1_ranking/widgets/logout_button.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
    required this.firstName,
    required this.lastName,
  });

  final String firstName;
  final String lastName;

  final _driverRepository = DriverRepository();
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.primaryColor,
      appBar: AppBar(
        toolbarHeight: setWidth(120),
        backgroundColor: AppStyles.primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            UserInfo(
              firstName: firstName,
              lastName: lastName,
            ),
            const LogoutButton(),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(AppStyles.spacingLarge),
        decoration: const BoxDecoration(
          color: AppStyles.whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppStyles.radiusExtraLarge),
            topRight: Radius.circular(AppStyles.radiusExtraLarge),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(AppStyles.spacingLarge),
              child: Text(
                'Top 10 ranking 2021',
                style: TextStyle(
                  color: AppStyles.primaryColor,
                  fontSize: AppStyles.fontSizeLarge,
                  fontWeight: AppStyles.fontWeightBold,
                  height: setHeight(0.07),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<DriverModel>>(
                future: _driverRepository.getDrivers(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    final List<DriverModel> drivers = snapshot.data!;

                    // FadingEdgeScrollView used to add fading edges to the list
                    return FadingEdgeScrollView.fromScrollView(
                      child: ListView.builder(
                        controller: _scrollController,
                        itemCount: drivers.length,
                        itemBuilder: (context, index) {
                          final driver = drivers[index];
                          return DriverTile(driver: driver);
                        },
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
