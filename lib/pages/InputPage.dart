import 'package:bmi_tt9/Widgets/floatingButton.dart';
import 'package:bmi_tt9/Widgets/my_card.dart';
import 'package:bmi_tt9/pages/result_page.dart';
import 'package:flutter/material.dart';

import '../Widgets/bottom_btn.dart';
import '../Widgets/card_content.dart';
import '../bmi_brain.dart';
import '../constants.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;
  int weight = 60;
  int height = 170;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: MyCard(
                  color:
                      selectedGender == Gender.male ? activeColor : cardColor,
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  child: CardContent(
                    icon: Icons.male,
                    text: 'male',
                  ),
                )),
                Expanded(
                    child: MyCard(
                  color:
                      selectedGender == Gender.female ? activeColor : cardColor,
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  child: CardContent(
                    icon: Icons.female,
                    text: 'female',
                  ),
                )),
              ],
            ),
            Expanded(
              child: MyCard(
                color: cardColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "HEIGHT",
                      style: titleStyle,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: NumTextStyle,
                        ),
                        Text(
                          "cm",
                          style: titleStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: const Color(0xFF8D8E98),
                        thumbColor: const Color(0xFFEB1555),
                        overlayColor: const Color(0x29EB1555),
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 15.0),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 35.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
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
            Row(
              children: [
                Expanded(
                  child: MyCard(
                    color: cardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("WEIGHT", style: titleStyle),
                        SizedBox(
                          height: 4,
                        ),
                        Text(weight.toString(), style: NumTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            My_fab(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              icon: Icons.add,
                            ),
                            My_fab(
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              icon: Icons.remove,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: MyCard(
                    color: cardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: titleStyle,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          age.toString(),
                          style: NumTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            My_fab(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              icon: Icons.add,
                            ),
                            My_fab(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              icon: Icons.remove,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            BottomBtn(
              onTap: () {
                BMI calc = BMI(weight, height);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(
                              resultLabel: calc.getLabel(),
                              bmi: calc.calcBMI().toStringAsFixed(1),
                              advice: calc.getAdvice(),
                              labelColor: calc.getTextColor(),
                            )));
              },
              btnText: 'calculate',
            )
          ],
        ));
  }
}

enum Gender {
  male,
  female,
}
