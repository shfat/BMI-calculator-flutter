import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// A custom circular icon button with long-press auto-repeat behavior
/// Used for incrementing/decrementing values (e.g. age, weight)
class RoundIconButton extends StatefulWidget {
  /// Creates a round icon button with press callback
  const RoundIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  /// Icon displayed inside the circular button
  final FaIconData icon;

  /// Callback executed when button is pressed or held
  final VoidCallback onPressed;

  @override
  State<RoundIconButton> createState() => _RoundIconButtonState();
}

class _RoundIconButtonState extends State<RoundIconButton> {
  Timer? _timer;

  /// Tracks whether the button is currently being pressed
  bool _isPressed = false;

  /// Triggered when user starts pressing the button
  /// Starts immediate action + prepares auto-repeat behavior
  void _onTapDown(TapDownDetails details) {
    if (_isPressed) return;

    _isPressed = true;

    // Immediate single action on press start
    widget.onPressed();

    // Delay before starting auto-repeat
    _timer = Timer(const Duration(milliseconds: 400), () {
      _timer = Timer.periodic(const Duration(milliseconds: 200), (timer) {
        if (_isPressed) {
          widget.onPressed();
        } else {
          timer.cancel();
        }
      });
    });
  }

  /// Triggered when user lifts finger
  void _onTapUp(TapUpDetails details) {
    _isPressed = false;
    _timer?.cancel();
  }

  /// Triggered when touch is cancelled (e.g. drag away)
  void _onTapCancel() {
    _isPressed = false;
    _timer?.cancel();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: RawMaterialButton(
        onPressed: () {},

        /// Icon displayed inside button
        child: FaIcon(widget.icon),

        /// Elevation for subtle shadow effect
        elevation: 6.0,

        /// Fixed circular size
        constraints: const BoxConstraints.tightFor(
          height: 56.0,
          width: 56.0,
        ),

        /// Circular shape design
        shape: const CircleBorder(),

        /// Background color of the button
        fillColor: const Color(0xFF4C4F5E),
      ),
    );
  }
}

