import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../tambahan/icon_content.dart';
import '../tambahan/reusable_card.dart';
import 'package:bmi_calculator/tambahan/constraints.dart';
import 'result_page.dart';
import '../tambahan/bottom_button.dart';
import '../tambahan/round_icon_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget{
  @override
  _InputPageState createState() => _InputPageState();
}
class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(
                warna: selectedGender == Gender.male ? kActiveCardColor : kInactiveCardColor,
                cardChild: IconContent(icon: FontAwesomeIcons.mars, label: 'MALE',),
                onPress: () {
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
              )),
              Expanded(child: ReusableCard(
                warna: selectedGender == Gender.female ? kActiveCardColor : kInactiveCardColor,
                cardChild: IconContent(icon: FontAwesomeIcons.venus, label: 'FEMALE',),
                onPress: () {
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
              )),
            ],
          )),
          Expanded(child: ReusableCard(
              warna: kActiveCardColor,
              cardChild: Column(
                children: <Widget>[
                  Text('HEIGHT', style: kLabelTextStyle,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(height.toString(), style: kNumberTextStyle,),
                      Text('cm', style: kLabelTextStyle,),
                    ],
                  ),
                  SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 25.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 0.0,
                        max: 300.0,
                        onChanged: (double value) {
                          setState(() {
                            height = value.round();
                          });
                        },
                      )
                  ),
                ],
              ),
            onPress: () {},
          )),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(
                warna: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                        'WEIGHT', style: kLabelTextStyle,
                    ),
                    Text(
                      weight.toString(), style: kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            }),
                        SizedBox(width: 10.0,),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: () {
                            setState(() {
                              weight++;
                            });
                          },
                        ),
                      ],
                    )
                  ]
                ),
                onPress: () {},
              )),
              Expanded(child: ReusableCard(
                warna: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                        'AGE', style: kLabelTextStyle,
                    ),
                    Text(
                        age.toString(), style: kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: () {
                            setState(() {
                              age--;
                            });
                          },
                        ),
                        SizedBox(width: 10.0,),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: () {
                            setState(() {
                              age++;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
                onPress: () {},
              )),
            ],
          )),
          BottomButton(
            onTap: (){
              CalculatorBrain hitung = CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                        bmiResult: hitung.CalculateBMI(),
                        resultText: hitung.getResult(),
                        interpretation: hitung.getInterpretation(),
                      )
                  )
              );
            },
            buttonTitle: 'CALCULATE')
        ],
      ),
    );
  }
}
