import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../ui/widgets/base_icon.dart';
import '../../ui/widgets/base_text.dart';

class CalculatorProvider with ChangeNotifier {
  String _displayNum = '0';
  String _calcNum = '';
  String _operationSymbol = '';
  double _result;
  bool _displaySymbol = false;
  bool _shouldCalculate = false;

  String get displayNum => _displayNum;
  bool get displaySymbol => _displaySymbol;

  Widget calcButtonWidget(String symbol) {
    switch (symbol) {
      case '+':
        return BaseIcon(baseIcon: FontAwesomeIcons.plus);
      case '-':
        return BaseIcon(baseIcon: FontAwesomeIcons.minus);
      case '*':
        return BaseIcon(baseIcon: FontAwesomeIcons.times);
      case '/':
        return BaseIcon(baseIcon: FontAwesomeIcons.divide);
      case '=':
        return BaseIcon(baseIcon: FontAwesomeIcons.equals);
      default:
        return BaseText(baseText: symbol);
    }
  }

  BaseIcon handleSymbol() {
    switch (_operationSymbol) {
      case '+':
        return BaseIcon(baseIcon: FontAwesomeIcons.plus);
      case '-':
        return BaseIcon(baseIcon: FontAwesomeIcons.minus);
      case '*':
        return BaseIcon(baseIcon: FontAwesomeIcons.times);
      case '/':
        return BaseIcon(baseIcon: FontAwesomeIcons.divide);
      default:
        return null;
    }
  }

  void pressButton(String selectedButtonSymbol) {
    switch (selectedButtonSymbol) {
      case '+':
      case '-':
      case '*':
      case '/':
        if (_shouldCalculate) {
          _calculate();
        } else {
          _result = double.tryParse(_calcNum) ?? 0;
          _shouldCalculate = true;
        }
        _calcNum = '';
        _operationSymbol = selectedButtonSymbol;
        _displaySymbol = true;
        break;
      case '=':
        _calculate();
        _operationSymbol = '';
        _shouldCalculate = false;
        break;
      case 'CE':
        _calcNum = '';
        _displayNum = '0';
        _operationSymbol = '';
        _result = 0;
        _shouldCalculate = false;
        _displaySymbol = false;
        break;
      default:
        _calcNum += selectedButtonSymbol;
        _displayNum = _calcNum;
        _displaySymbol = false;
    }
    notifyListeners();
  }

  void _calculate() {
    switch (_operationSymbol) {
      case '+':
        _result += double.tryParse(_calcNum) ?? 0;
        break;
      case '-':
        _result -= double.tryParse(_calcNum) ?? 0;
        break;
      case '*':
        _result *= double.tryParse(_calcNum) ?? 0;
        break;
      case '/':
        _result /= double.tryParse(_calcNum) ?? 0;
        break;
      default:
        break;
    }
    if (_result.isNaN) _result = 0;
    _calcNum = _result.toString();
    _displayNum = _calcNum;
  }
}
