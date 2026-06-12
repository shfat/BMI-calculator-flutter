import 'dart:math';
import 'package:flutter/material.dart';

/// logic class responsible for calculating BMI
/// and providing related interpretations and UI metadata
class BmiCalculateBrain {
  BmiCalculateBrain({
    required this.height,
    required this.weight,
  }) : _BMI = weight / pow(height / 100, 2);

  /// User height in centimeters
  final int height;

  /// User weight in kilograms
  final int weight;

  /// Calculated BMI value (internal use only)
  final double _BMI;

  /// Returns BMI value formatted to 1 decimal place
  String calculateBMI() {
    return _BMI.toStringAsFixed(1);
  }

  /// Returns BMI category based on WHO classification
  String BMIResult() {
    if (_BMI < 18.5) {
      return 'Underweight';
    } else if (_BMI <= 24.9) {
      return 'Normal weight';
    } else if (_BMI <= 29.9) {
      return 'Overweight';
    } else if (_BMI <= 34.9) {
      return 'Obese Class I';
    } else if (_BMI <= 39.9) {
      return 'Obese Class II';
    } else {
      return 'Obese Class III';
    }
  }

  /// Returns a human-readable interpretation message
  /// based on BMI category
  String getInterpretation() {
    if (_BMI < 18.5) {
      return 'You have a lower than normal body weight!\nYou should consider eating more.';
    } else if (_BMI <= 24.9) {
      return 'You have a normal body weight!\nGood job \\^^/';
    } else if (_BMI <= 29.9) {
      return 'You have a higher than normal body weight!\nTry to exercise more.';
    } else if (_BMI <= 34.9) {
      return 'You have Class I obesity!\nConsider consulting a doctor.';
    } else if (_BMI <= 39.9) {
      return 'You have Class II obesity!\nMedical advice is recommended.';
    } else {
      return 'You have Class III obesity (severe).\nPlease consult a doctor immediately.';
    }
  }

  /// Returns a color associated with BMI category
  /// Used for UI feedback (healthy / warning / danger)
  Color getBMIColor() {
    if (_BMI < 18.5) {
      return const Color(0xFFFF9800); // Underweight (orange)
    } else if (_BMI <= 24.9) {
      return const Color(0xFF4CAF50); // Normal (green)
    } else if (_BMI <= 29.9) {
      return const Color(0xFFFF9800); // Overweight (orange)
    } else {
      return const Color(0xFFF44336); // Obese (red)
    }
  }
}

