import 'package:bmi_tt9/Widgets/my_card.dart';
import 'package:bmi_tt9/constants.dart';
import 'package:flutter/material.dart';

import '../Widgets/bottom_btn.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ResultPage extends StatelessWidget {
  final String resultLabel;
  final String bmi;
  final String advice;
  final Color labelColor;
  const ResultPage(
      {Key? key,
      required this.resultLabel,
      required this.bmi,
      required this.advice,
      required this.labelColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(Icons.menu),
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'Your Result',
              style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: MyCard(
              color: cardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultLabel,
                    style: TextStyle(
                      color: labelColor,
                      fontSize: 27.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    bmi,
                    style: TextStyle(
                      fontSize: 88.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Normal BMI range:',
                    style: titleStyle,
                  ),
                  Text(
                    '18.5 - 25 kg/m2',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    advice,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                  RawMaterialButton(
                    onPressed: () {},
                    fillColor: backgroundColor,
                    elevation: 0.0,
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 32),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Text(
                      'SAVE RESULT',
                    ),
                  )
                ],
              ),
            ),
          ),
          BottomBtn(
            btnText: 're-calculate your bmi',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
