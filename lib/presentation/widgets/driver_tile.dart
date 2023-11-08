import 'package:f1_ranking/app/styles/app_styles.dart';
import 'package:flutter/material.dart';

import 'package:f1_ranking/data/models/driver_model.dart';
import 'package:f1_ranking/app/config/app_config.dart';

class DriverTile extends StatelessWidget {
  const DriverTile({super.key, required this.driver});

  final DriverModel driver;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      margin: const EdgeInsets.symmetric(
        vertical: AppStyles.spacingLarge,
      ),
      decoration: ShapeDecoration(
        color: AppStyles.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppStyles.radiusExtraSmall),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 15,
            offset: Offset(2, 2),
            spreadRadius: 2,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: Center(
              child: Text(
                driver.position.toString(),
                style: const TextStyle(
                  fontSize: 18,
                  color: AppStyles.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 5,
            child: ListTile(
              contentPadding: const EdgeInsets.all(0.0),
              leading: CircleAvatar(
                radius: context.height * 0.04,
                foregroundImage: AssetImage(
                  'assets/images/${(driver.fullName).toLowerCase().replaceAll(RegExp(r' '), '-')}.png',
                ),
              ),
              title: Text(
                driver.fullName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(driver.team),
            ),
          ),
        ],
      ),
    );
  }
}
