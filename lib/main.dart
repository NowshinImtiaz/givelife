import 'package:flutter/material.dart';
import 'splash.dart';


void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GiveLife',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF49010F),),
        scaffoldBackgroundColor: Color(0xFFF8F3F3),

        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF49010F),
          foregroundColor: Color(0xFFF8F3F3),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF49010F),
          foregroundColor: Color(0xFFF8F3F3),
        ),
      ),

      home: const Splash(),
    );
  }
}

