import 'package:flutter/material.dart';
import 'screens/input_page.dart';

/// Entry point of the application
/// Runs the BMI Calculator app
void main() => runApp(const BMICalculator());

/// Root widget of the BMI Calculator application
/// Defines app-wide theme and initial route
class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // App theme configuration (Dark mode base)
      theme: ThemeData.dark().copyWith(
        // Custom FloatingActionButton theme
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.purpleAccent,
        ),

        // Global scaffold background color
        scaffoldBackgroundColor: const Color(0xFF0D101F),

        // AppBar styling applied across the app
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Color(0xFF0D101F),
        ),
      ),

      // First screen of the app
      home: InputPage(),

      // Removes debug banner in production/UI preview
      debugShowCheckedModeBanner: false,
    );
  }
}

