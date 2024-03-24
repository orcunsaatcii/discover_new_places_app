import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/screens/splash/splash_screen.dart';
import 'package:travel_app/settings/colors.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: backgroundColor,
      textTheme: GoogleFonts.marcellusTextTheme().apply(
        bodyColor: textColor,
      ),
      bottomNavigationBarTheme:
          const BottomNavigationBarThemeData(backgroundColor: backgroundColor),
    );

    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
