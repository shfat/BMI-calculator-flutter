import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import '../components/large_bottom_button.dart';

/// Result screen of the BMI Calculator application
/// Displays calculated BMI value, category, and health interpretation
class ResultsPage extends StatelessWidget {
  /// Creates a result page with BMI data
  const ResultsPage({
    super.key,
    required this.BMIResultNumber,
    required this.interpretation,
    required this.resultText,
    required this.bmiColor,
  });

  /// Numeric BMI value (formatted as string)
  final String BMIResultNumber;

  /// BMI category label (e.g. Normal, Overweight)
  final String resultText;

  /// Human-readable health interpretation message
  final String interpretation;

  /// Color representing BMI category status
  final Color bmiColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App bar showing screen title
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          /// Header section
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(18),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Your Result:',
                style: kTitleTextStyle,
              ),
            ),
          ),

          /// Main result card
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    /// BMI category (color-coded)
                    Text(
                      resultText.toUpperCase(),
                      style: kResultTextStyle.copyWith(color: bmiColor),
                    ),

                    /// BMI numeric value
                    Text(
                      BMIResultNumber,
                      style: kBMITextStyle,
                    ),

                    /// Reference BMI range information
                    const Text(
                      'Normal BMI range:\n18.5 - 24.9 kg/m²',
                      style: kNormalRangeText,
                      textAlign: TextAlign.center,
                    ),

                    /// Health interpretation message
                    Text(
                      interpretation,
                      style: kBodyTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// Bottom action button (navigate back to input screen)
          LargeBottomButton(
            buttonTitle: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
