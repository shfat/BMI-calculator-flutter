import 'package:flutter/material.dart';
import '../constants.dart';

/// A reusable bottom action button used across the app
/// Typically used for primary actions like "Calculate" or "Re-Calculate"
class LargeBottomButton extends StatelessWidget {
  /// Creates a bottom button with tap callback and label text
  const LargeBottomButton({
    required this.onTap,
    required this.buttonTitle,
    super.key,
  });

  /// Callback triggered when the button is tapped
  final VoidCallback onTap;

  /// Text displayed inside the button
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        /// Button label centered inside the container
        child: Center(
          child: Text(
            buttonTitle,
            style: kLargeButtonTextStyle,
          ),
        ),

        /// Primary accent color of the button
        color: kBottomContainerColor,

        /// Top margin to separate from above content
        margin: const EdgeInsets.only(top: 10),

        /// Padding for better touch experience
        padding: const EdgeInsets.only(bottom: 20),

        /// Full-width button
        width: double.infinity,

        /// Fixed height for consistent UI
        height: kBottomContainerHeight,
      ),
    );
  }
}

