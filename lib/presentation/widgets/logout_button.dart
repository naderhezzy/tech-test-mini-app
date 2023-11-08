import 'package:flutter/material.dart';

import 'package:f1_ranking/app/styles/app_styles.dart';
import 'package:f1_ranking/presentation/pages/registration_screen.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => RegistrationScreen(),
        ),
      ),
      icon: const Icon(
        Icons.logout,
        color: AppStyles.whiteColor,
      ),
    );
  }
}
