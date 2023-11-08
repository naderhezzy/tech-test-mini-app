import 'package:f1_ranking/app/styles/app_styles.dart';
import 'package:flutter/material.dart';

import 'package:f1_ranking/app/config/app_config.dart';

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
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            'assets/images/avatar.png',
            height: context.height * 0.10,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Good Morning',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
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
