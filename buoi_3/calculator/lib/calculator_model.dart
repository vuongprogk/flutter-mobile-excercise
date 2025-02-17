class CalculatorModel {
  String _output = "0";
  String _input = "";
  String _operator = "";
  double _num1 = 0;
  final String _operation = "";
  double _num2 = 0;

  String get output => _output;
  String get operation => _operation;

  void buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _output = "0";
      _input = "";
      _operator = "";
      _num1 = 0;
      _num2 = 0;
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "*" ||
        buttonText == "/") {
      _num1 = double.parse(_input);
      _operator = buttonText;
      _input = "";
    } else if (buttonText == "=") {
      _num2 = double.parse(_input);
      if (_operator == "+") {
        _output = (_num1 + _num2).toString();
      } else if (_operator == "-") {
        _output = (_num1 - _num2).toString();
      } else if (_operator == "*") {
        _output = (_num1 * _num2).toString();
      } else if (_operator == "/") {
        _output = (_num1 / _num2).toString();
      }
      _input = _output;
      _operator = "";
    } else {
      _input += buttonText;
      _output = _input;
    }
  }
}
