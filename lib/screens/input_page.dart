import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import 'results_page.dart';
import '../components/large_bottom_button.dart';
import '../components/round_icon_button.dart';
import 'package:bmi_calculator/BMI_calculate_brain.dart';

/// Enum representing gender selection state
enum Gender { male, female }

/// Main input screen of the BMI Calculator application
/// Handles user input for height, weight, age and gender
class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  /// Selected gender by user
  Gender? selectedGender;

  /// User height in centimeters
  int height = 180;

  /// User weight in kilograms
  int weight = 60;

  /// User age in years
  int age = 25;

  /// Controls SnackBar spam prevention timing
  DateTime? _snackBarTimeControl;

  /// Shows a SnackBar with anti-spam protection
  void _showSnackBar(String message) {
    if (_snackBarTimeControl != null &&
        DateTime.now().difference(_snackBarTimeControl!) <
            const Duration(seconds: 2)) {
      return;
    }

    _snackBarTimeControl = DateTime.now();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.white70,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App bar showing application title
      appBar: AppBar(
        title: const Text(
          'BMI CALCULATOR',
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          /// Gender selection cards (Male / Female)
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      label: 'MALE',
                      icon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      label: 'FEMALE',
                      icon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// Height input section with slider
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('HEIGHT', style: kLabelTextStyle),

                  /// Height display
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      const Text('cm', style: kLabelTextStyle),
                    ],
                  ),

                  /// Custom styled height slider
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: const Color(0xFFEB1555),
                      overlayColor: const Color(0x28EB1555),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 15,
                      ),
                      overlayShape: const RoundSliderOverlayShape(
                        overlayRadius: 30,
                      ),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: kMinHeight,
                      max: kMaxHeight,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// Weight & Age input section
          Expanded(
            child: Row(
              children: [

                /// Weight card
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('WEIGHT', style: kLabelTextStyle),
                        Text(weight.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            /// Increase weight button
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),

                            const SizedBox(width: 20),

                            /// Decrease weight button with validation
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (weight > 10) {
                                    weight--;
                                  } else {
                                    _showSnackBar(
                                      'Weight cannot be less than 10 kg!',
                                    );
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                /// Age card
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('AGE', style: kLabelTextStyle),
                        Text(age.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            /// Increase age button
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),

                            const SizedBox(width: 20),

                            /// Decrease age button with validation
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (age > 20) {
                                    age--;
                                  } else {
                                    _showSnackBar(
                                      'This BMI calculation is accurate for ages 20 and above!',
                                    );
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// Bottom calculate button
          LargeBottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              final calculate = BmiCalculateBrain(
                height: height,
                weight: weight,
              );

              /// Navigate to results page with computed BMI data
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ResultsPage(
                      BMIResultNumber: calculate.calculateBMI(),
                      interpretation: calculate.getInterpretation(),
                      resultText: calculate.BMIResult(),
                      bmiColor: calculate.getBMIColor(),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

