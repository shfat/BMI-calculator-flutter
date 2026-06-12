import 'package:flutter/material.dart';

/// A reusable card widget used across the BMI application UI
/// Provides consistent styling and optional tap interaction
class ReusableCard extends StatelessWidget {
  /// Creates a reusable card with customizable color, content, and tap action
  ReusableCard({
    required this.colour,
    this.cardChild,
    this.onPress,
    super.key,
  });

  /// Background color of the card
  final Color colour;

  /// Optional child widget displayed inside the card
  final Widget? cardChild;

  /// Optional tap callback for interactive cards
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        /// Content displayed inside the card
        child: cardChild,

        /// Outer spacing between cards
        margin: const EdgeInsets.all(15),

        /// Card visual styling (background + rounded corners)
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

