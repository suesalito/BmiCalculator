import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusable_card.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your BMI Result!')),
      body: ReusableCard(
        bgColor: kActiveColor,
        childWidget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'TEST',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
