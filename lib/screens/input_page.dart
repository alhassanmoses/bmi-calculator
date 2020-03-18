import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/buttom_button.dart';
import '../components/constants.dart';
import '../components/icon_content.dart';
import '../components/resuable_card.dart';
import '../components/round_icon_button.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 120;
  int weight = 60;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('BMI CALCULATOR'),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        tapGestureFunction: () {
                          setState(() {
                            // gender.male
                            selectedGender = Gender.male;
                          });
                        },
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.mars,
                          label: 'Male',
                        ),
                        colour: selectedGender == Gender.male
                            ? kActiveCardColour
                            : kInactiveCardColour,
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        tapGestureFunction: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.venus,
                          label: 'FEMALE',
                        ),
                        colour: selectedGender == Gender.female
                            ? kActiveCardColour
                            : kInactiveCardColour,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'HEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            height.toString(),
                            style: kNumberTextStyle,
                          ),
                          Text(
                            'cm',
                            style: kLabelTextStyle,
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Color(0xFF8D8E98),
                          overlayColor: Color(0x29EB1555),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape: RoundSliderOverlayShape(
                            overlayRadius: 30.0,
                          ),
                          thumbColor: Color(0xFFEB1555),
                        ),
                        child: Slider(
                            value: height.toDouble(),
                            min: 100.0,
                            max: 300.0,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            }),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'WEIGHT',
                              style: kLabelTextStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: kNumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                  icon: FontAwesomeIcons.minus,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                RoundIconButton(
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  icon: FontAwesomeIcons.plus,
                                ),
                              ],
                            ),
                          ],
                        ),
                        colour: kActiveCardColour,
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'AGE',
                              style: kLabelTextStyle,
                            ),
                            Text(
                              age.toString(),
                              style: kNumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  icon: FontAwesomeIcons.minus,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                RoundIconButton(
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  icon: FontAwesomeIcons.plus,
                                ),
                              ],
                            ),
                          ],
                        ),
                        colour: kActiveCardColour,
                      ),
                    ),
                  ],
                ),
              ),
              BottomButton(
                onTap: () {
                  CalculatorBrain calc =
                      CalculatorBrain(height: height, weight: weight);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultsPage(
                        bmiResults: calc.calculateBMI(),
                        resultText: calc.getResult(),
                        interpretation: calc.getInterpretation(),
                      ),
                    ),
                  );
                },
                buttonTitle: 'CALCULATE YOUR BMI',
              ),
            ],
          )),
    );
  }
}
