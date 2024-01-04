import 'package:flutter/material.dart';
import 'package:youtube_clone/routes/app_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // theme: ThemeData(
      //     brightness: Brightness.dark,
      //     // appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
      //     scaffoldBackgroundColor: Colors.white,
      //     bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      //         backgroundColor: Colors.white)),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRoutes.router,
    );
  }
}
