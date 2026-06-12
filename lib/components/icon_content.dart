import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';

/// A reusable UI component that displays an icon with a label
/// Used for gender selection (Male / Female) in the BMI app
class IconContent extends StatelessWidget {
  /// Creates an IconContent widget with required label and icon
  IconContent({
    required this.label,
    required this.icon,
  });

  /// Text label displayed below the icon (e.g. MALE, FEMALE)
  final String label;

  /// FontAwesome icon representing the category
  final FaIconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// Displays the selected icon with a fixed size
        FaIcon(icon, size: 80),

        /// Spacing between icon and text label
        const SizedBox(height: 15),

        /// Label text with predefined app style
        Text(
          label,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
