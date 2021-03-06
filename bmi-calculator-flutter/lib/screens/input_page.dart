import 'file:///C:/Users/yzook/AndroidStudioProjects/bmi-calculator-flutter/lib/components/icon_card.dart';
import 'file:///C:/Users/yzook/AndroidStudioProjects/bmi-calculator-flutter/lib/components/reusable_card.dart';
import 'package:bmi_calculator/calculator.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';
import '../components/number_change_widget.dart';

enum Gender { MALE, FEMALE }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  NumberChangeWidget weightWidget = NumberChangeWidget(
    label: 'Weight',
    number: 60,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: selectedGender == Gender.MALE
                        ? kActiveReusableCardColor
                        : kInactiveReusableCardColor,
                    cardChild: IconCard(
                      icon: FontAwesomeIcons.mars,
                      text: 'MALE',
                    ),
                    onTapFunction: () {
                      setState(() {
                        selectedGender = Gender.MALE;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: selectedGender == Gender.FEMALE
                        ? kActiveReusableCardColor
                        : kInactiveReusableCardColor,
                    cardChild: IconCard(
                      icon: FontAwesomeIcons.venus,
                      text: 'FEMALE',
                    ),
                    onTapFunction: () {
                      setState(() {
                        selectedGender = Gender.FEMALE;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kActiveReusableCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Height',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kSuperTextStyle,
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
                      thumbColor: kBottomContainerColor,
                      overlayColor: Color(0X29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 13.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 25.0),
                      trackHeight: 1.5,
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 100.0,
                      max: 250.0,
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
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: kActiveReusableCardColor,
                    cardChild: weightWidget,
                  ),
                ),
                Expanded(
                    child: ReusableCard(
                  color: kActiveReusableCardColor,
                  cardChild: NumberChangeWidget(
                    label: 'Age',
                    number: 20,
                  ),
                )),
              ],
            ),
          ),
          BottomButton(
            onPressed: () {
              Calculator calc =
                  Calculator(height: height, weight: weightWidget.getNumber());
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultsPage(
                          resultNumber: calc.getBMI(),
                          resultText: calc.getResult(),
                          advice: calc.getDescription(),
                        )),
              );
            },
            label: 'Calculate BMI',
          ),
        ],
      ),
    );
  }
}
