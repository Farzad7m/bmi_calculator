import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';

import '../components/bottom_button.dart';

class ResultPage extends StatelessWidget {
  final String? bmiResult, resultText, interpretation;

  ResultPage({@required this.bmiResult, @required this.resultText, @required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results Page'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(15),
              child: Text(
                'Your Results',
                style: kTittleTextStyle,
              ),
            ),

          ),
          Expanded(
              flex: 5,
              child: ReusableCard(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 15,0,0),
                      child: Text(
                        resultText!,
                        style: kResultTextStyle,
                      ),
                    ),
                    Text(
                      bmiResult!,
                      style: kBMUTestStyle,
                    ),
                    Column(
                      children: [
                        Text(
                          interpretation!.toUpperCase(),
                          style: kGreyBodyTestStyle,
                          textAlign: TextAlign.center,

                        ),
                        Text(
                          '18.5 - 25 kg/m2',
                          style: kBodyTestStyle,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'You have a normal body weight. Good job',
                        style: kBodyTestStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    BottomButton(
                        title: 'RE-CALCULATOR',
                        onTab: () {
                          Navigator.pop(context);
                        }),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
