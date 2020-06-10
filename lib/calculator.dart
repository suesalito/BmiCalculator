import 'dart:math';

class Calculator {
  Calculator({this.weight, this.height});

  final int weight;
  final int height;

  double _bmi; //make it private but global in the class.

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'OverWeight';
    } else if (_bmi > 18) {
      return 'Normal';
    } else
      return 'UnderWeight';
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to do some workout to lose some weight.';
    } else if (_bmi > 18) {
      return 'You have a good BMI, keep this shape and healthy.';
    } else
      return 'You have a lower than normal body weight, eat more protein and vegetable.';
  }
}
