import 'package:bmi_calculator/calculator.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/screen/resultspage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:audioplayers/audioplayers.dart';

import '../components/bottom_button.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  InputPageState createState() => InputPageState();
}

class InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 160;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(children: [
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
                child: IconContent(icon: FontAwesomeIcons.mars, label: 'MALE'),
                color: selectedGender == Gender.male
                    ? kActiveCardColor
                    : kInActiveCardColor,
              ),
            ),
            Expanded(
              child: ReusableCard(
                onPress: () {
                  setState(() {
                    selectedGender = Gender.female;
                    Fluttertoast.showToast(msg: "سلام فرزاد معصومی...");
                  });
                },
                child:
                    IconContent(icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                color: selectedGender == Gender.female
                    ? kActiveCardColor
                    : kInActiveCardColor,
              ),
            ),
          ],
        )),
        Expanded(
          child: ReusableCard(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'HEIGHT',
                  style: kLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: kNumTextStyle,
                    ),
                    Text(
                      'cm',
                      style: kLabelTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 1,
                    inactiveTrackColor: Color(0xFF8DE98),
                    activeTrackColor: Colors.white,
                    overlayColor: Color(0x1fEB1555),
                    thumbColor: Color(0xFFEB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 18),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                        // Fluttertoast.showToast(msg: height.toString());
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
            child: Row(
          children: [
            Expanded(
              child: ReusableCard(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'WEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: kNumTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPress: () {
                            setState(() {
                              weight--;
                            });
                          },
                        ),
                        SizedBox(width: 10),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPress: () {
                            setState(() {
                              weight++;
                              // final player = AudioCache();
                              // player.loadAsFile('note1.wav');
                              // player.setSource(AssetSource('note1.wav'));
                              // player.play(DeviceFileSource('note1.wav'));
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ReusableCard(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'AGE',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      age.toString(),
                      style: kNumTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPress: () {
                            setState(() {
                              age--;
                            });
                          },
                        ),
                        SizedBox(width: 10),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPress: () {
                            setState(() {
                              age++;
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
        )),
        BottomButton(
            title: 'CALCULATOR',
            onTab: () {
              Calculator calculator =
                  Calculator(weight: weight, height: height);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: calculator.calculateBMI(),
                    resultText: calculator.getResult(),
                    interpretation: calculator.getInterpretation(),
                  ),
                ),
              );
            }),
      ]),
    );
  }
}
