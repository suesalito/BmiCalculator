import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusable_card.dart';
import 'Buttombutton.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                      'Normal',
                      textAlign: TextAlign.center,
                      style: kResultTextStyle,
                    ),
                    Text(
                      '17.2',
                      textAlign: TextAlign.center,
                      style: kBMITextStyle,
                    ),
                    Text(
                      'You have a good BMI, keep working out and stay shape!',
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
