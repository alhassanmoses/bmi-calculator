import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;
  double _bmi;
  CalculatorBrain({this.height, this.weight});

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'Your body weight is higher than normal. Try to exercise more requently.';
    } else if (_bmi > 18.5) {
      return 'Your body weight is normal. Keep it up.';
    } else {
      return 'Your body weight is lower than normal. Try eating a bit more than usual';
    }
  }
}
