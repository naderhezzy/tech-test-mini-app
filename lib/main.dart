import 'dart:io' show Platform;

import 'package:f1_ranking/config/app_config.dart';
import 'package:f1_ranking/styles/app_styles.dart';
import 'package:f1_ranking/views/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  // In IOS we keep the status bar text dark
  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: AppStyles.primaryColor,
      ),
    );
  }

  WidgetsFlutterBinding.ensureInitialized();

  // Splash screen for one second
  await Future.delayed(
    const Duration(seconds: 1),
    FlutterNativeSplash.remove,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'F1 Ranking',
      theme: ThemeData(useMaterial3: true),
      home: RegistrationScreen(),
      navigatorKey: appNavigatorKey,
      debugShowCheckedModeBanner: false,
    );
  }
}
