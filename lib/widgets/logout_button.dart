import 'package:f1_ranking/styles/app_styles.dart';
import 'package:f1_ranking/views/registration_screen.dart';
import 'package:flutter/material.dart';

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
