import 'package:flutter/material.dart';

/// App-wide constants for layout, styling, and UI configuration
/// This file helps maintain consistency across the entire application

/// Height limits for the BMI height slider
const kMaxHeight = 260.0;
const kMinHeight = 100.0;

/// Height of the bottom action button container
const kBottomContainerHeight = 80.0;

/// Card colors used for active and inactive states
const kActiveCardColor = Color(0xFF1D1E33);
const kInactiveCardColor = Color(0xFF111328);

/// Primary accent color for bottom action button
const kBottomContainerColor = Color(0xFFEB1555);

/// Text style for labels (e.g. "HEIGHT", "WEIGHT", "AGE")
const kLabelTextStyle = TextStyle(
  fontSize: 18,
  color: Color(0xFF8D8E98),
);

/// Large numeric display style (used for height, weight, age)
const kNumberTextStyle = TextStyle(
  fontSize: 70,
  fontWeight: FontWeight.w900,
);

/// Style for primary action button text
const kLargeButtonTextStyle = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.bold,
);

/// Title text style used on result screen header
const kTitleTextStyle = TextStyle(
  fontSize: 50,
  fontWeight: FontWeight.bold,
);

/// Style for BMI category result (e.g. Normal, Overweight)
const kResultTextStyle = TextStyle(
  color: Color(0xFF24D876),
  fontSize: 24,
  fontWeight: FontWeight.bold,
);

/// Style for displaying BMI numeric value
const kBMITextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 100,
);

/// General body text style for interpretation messages
const kBodyTextStyle = TextStyle(
  fontSize: 22,
);

/// Style for displaying normal BMI range information
const kNormalRangeText = TextStyle(
  color: Color(0xFF656374),
  fontSize: 18,
);

