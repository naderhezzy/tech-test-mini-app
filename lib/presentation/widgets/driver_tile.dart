import 'package:flutter/material.dart';

import 'package:f1_ranking/app/utils/utils.dart';
import 'package:f1_ranking/app/styles/app_styles.dart';
import 'package:f1_ranking/data/models/driver_model.dart';

class DriverTile extends StatelessWidget {
  const DriverTile({super.key, required this.driver});

  final DriverModel driver;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: setHeight(84),
      margin: EdgeInsets.only(bottom: setHeight(AppStyles.spacingLarge)),
      decoration: ShapeDecoration(
        color: AppStyles.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppStyles.radiusExtraSmall),
        ),
        shadows: const [
          BoxShadow(
            color: AppStyles.blackColor,
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
                  fontSize: AppStyles.fontSizeMedium,
                  color: AppStyles.primaryColor,
                  fontWeight: AppStyles.fontWeightBold,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 5,
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                radius: setHeight(30),
                foregroundImage: AssetImage(
                  'assets/images/${(driver.fullName).toLowerCase().replaceAll(RegExp(r' '), '-')}.png',
                ),
              ),
              title: Text(
                driver.fullName,
                style: const TextStyle(
                  fontSize: AppStyles.fontSizeMedium,
                  fontWeight: AppStyles.fontWeightMid,
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
