import 'package:flutter/material.dart';
import 'package:youtube_clone/presentation/screen.dart/SplashScreen.dart';
import 'package:youtube_clone/routes/app_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRoutes.router,
    );
  }
}
