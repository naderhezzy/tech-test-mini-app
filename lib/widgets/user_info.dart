import 'package:f1_ranking/styles/app_styles.dart';
import 'package:f1_ranking/utils/utils.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
    required this.firstName,
    required this.lastName,
  });

  final String firstName;
  final String lastName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          height: setHeight(87),
          'assets/images/avatar.png',
        ),
        SizedBox(width: setWidth(12)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Good Morning',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: AppStyles.fontSizeLarge,
                color: AppStyles.whiteColor,
              ),
            ),
            Text(
              '$firstName $lastName',
              style: const TextStyle(
                fontSize: AppStyles.fontSizeSmall,
                color: AppStyles.whiteColor,
              ),
            ),
          ],
        )
      ],
    );
  }
}
