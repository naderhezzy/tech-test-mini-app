import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:f1_ranking/config/app_config.dart';
import 'package:f1_ranking/styles/app_styles.dart';
import 'package:f1_ranking/viewmodels/driver_viewmodel.dart';
import 'package:f1_ranking/viewmodels/user_viewmodel.dart';
import 'package:f1_ranking/views/registration_screen.dart';

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

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserViewmodel()),
        ChangeNotifierProvider(create: (_) => DriverViewmodel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'F1 Ranking',
      theme: ThemeData(useMaterial3: true),
      home: const RegistrationScreen(),
      navigatorKey: appNavigatorKey,
      debugShowCheckedModeBanner: false,
    );
  }
}
