import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/base_icon.dart';
import '../widgets/base_text.dart';
import '../widgets/calc_button.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key key}) : super(key: key);

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String displayNum = '0';
  String calcNum = '';
  String operationSymbol = '';
  double result;
  bool displaySymbol = false;
  bool shouldCalculate = false;

  BaseIcon _handleSymbol(String operationSymbol) {
    switch (operationSymbol) {
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

  void _pressButton(String selectedButton) {
    setState(() {
      switch (selectedButton) {
        case '+':
        case '-':
        case '*':
        case '/':
          if (shouldCalculate) {
            _calculate();
          } else {
            result = double.tryParse(calcNum) ?? 0;
            shouldCalculate = true;
          }
          calcNum = '';
          operationSymbol = selectedButton;
          displaySymbol = true;
          break;
        case '=':
          _calculate();
          operationSymbol = '';
          shouldCalculate = false;
          break;
        case 'CE':
          calcNum = '';
          displayNum = '0';
          operationSymbol = '';
          result = 0;
          shouldCalculate = false;
          displaySymbol = false;
          break;
        default:
          calcNum += selectedButton;
          displayNum = calcNum;
          displaySymbol = false;
      }
    });
  }

  void _calculate() {
    switch (operationSymbol) {
      case '+':
        result += double.tryParse(calcNum) ?? 0;
        break;
      case '-':
        result -= double.tryParse(calcNum) ?? 0;
        break;
      case '*':
        result *= double.tryParse(calcNum) ?? 0;
        break;
      case '/':
        result /= double.tryParse(calcNum) ?? 0;
        break;
      default:
        break;
    }
    if (result.isNaN) result = 0;
    calcNum = result.toString();
    displayNum = calcNum;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COLORFUL CALCULATOR'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      if (displaySymbol)
                        _handleSymbol(operationSymbol) ?? SizedBox.shrink(),
                      Flexible(
                        child: Text(
                          displayNum,
                          textAlign: TextAlign.end,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 80.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        CalcButton(
                          onPressed: () => _pressButton('+'),
                          buttonWidget:
                              BaseIcon(baseIcon: FontAwesomeIcons.plus),
                        ),
                        CalcButton(
                          onPressed: () => _pressButton('-'),
                          buttonWidget:
                              BaseIcon(baseIcon: FontAwesomeIcons.minus),
                        ),
                        CalcButton(
                          onPressed: () => _pressButton('*'),
                          buttonWidget:
                              BaseIcon(baseIcon: FontAwesomeIcons.times),
                        ),
                        CalcButton(
                          onPressed: () => _pressButton('/'),
                          buttonWidget:
                              BaseIcon(baseIcon: FontAwesomeIcons.divide),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        CalcButton(
                          onPressed: () => _pressButton('7'),
                          buttonWidget: BaseText(baseText: '7'),
                        ),
                        CalcButton(
                          onPressed: () => _pressButton('8'),
                          buttonWidget: BaseText(baseText: '8'),
                        ),
                        CalcButton(
                          onPressed: () => _pressButton('9'),
                          buttonWidget: BaseText(baseText: '9'),
                        ),
                        CalcButton(
                          onPressed: () => _pressButton('0'),
                          buttonWidget: BaseText(baseText: '0'),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        CalcButton(
                          onPressed: () => _pressButton('4'),
                          buttonWidget: BaseText(baseText: '4'),
                        ),
                        CalcButton(
                          onPressed: () => _pressButton('5'),
                          buttonWidget: BaseText(baseText: '5'),
                        ),
                        CalcButton(
                          onPressed: () => _pressButton('6'),
                          buttonWidget: BaseText(baseText: '6'),
                        ),
                        CalcButton(
                          onPressed: () => _pressButton('CE'),
                          buttonWidget: BaseText(baseText: 'CE'),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        CalcButton(
                          onPressed: () => _pressButton('1'),
                          buttonWidget: BaseText(baseText: '1'),
                        ),
                        CalcButton(
                          onPressed: () => _pressButton('2'),
                          buttonWidget: BaseText(baseText: '2'),
                        ),
                        CalcButton(
                          onPressed: () => _pressButton('3'),
                          buttonWidget: BaseText(baseText: '3'),
                        ),
                        CalcButton(
                          onPressed: () => _pressButton('='),
                          buttonWidget:
                              BaseIcon(baseIcon: FontAwesomeIcons.equals),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
