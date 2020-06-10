import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/Components/reusable_card.dart';
import 'package:bmi_calculator/Components/Buttombutton.dart';
import 'package:bmi_calculator/calculator.dart';

class ResultPage extends StatelessWidget {
  ResultPage({this.bmiResult, this.bmiScore, this.bmiComment});

  static const routeName = '/passArguments';
  final String bmiResult;
  final String bmiScore;
  final String bmiComment;

  //Calculator calc = Calculator();

  @override
  Widget build(BuildContext context) {
    final ResultPage bmiArgs = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text('Your BMI Result!')),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: ReusableCard(
              //bgColor: kActiveColor,
              bgColor: kActiveColor,
              childWidget: Container(
                //height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      bmiArgs.bmiResult,
                      textAlign: TextAlign.center,
                      style: kResultTextStyle,
                    ),
                    Text(
                      bmiArgs.bmiScore,
                      //calc.calculateBMI(),
                      textAlign: TextAlign.center,
                      style: kBMITextStyle,
                    ),
                    Text(
                      bmiArgs.bmiComment,
                      //calc.getInterpretation(),
                      textAlign: TextAlign.center,
                      style: kBodyTextStyle,
                    ),
                  ],
                ),
              ),
            ),
          ),
          ButtomButton(
            ontab: () {
              Navigator.pop(context);
            },
            buttonTitle: 'RE-CALCULATE',
          )
        ],
      ),
    );
  }
}
