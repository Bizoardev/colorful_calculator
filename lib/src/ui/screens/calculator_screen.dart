import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/button_icon.dart';
import '../widgets/button_text.dart';
import '../widgets/calc_row.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({Key key}) : super(key: key);

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
                  child: Text(
                    '0',
                    style: TextStyle(
                      fontSize: 80.0,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: <Widget>[
                  CalcRow(
                    rowContents: [
                      ButtonIcon(buttonIcon: FontAwesomeIcons.plus),
                      ButtonIcon(buttonIcon: FontAwesomeIcons.minus),
                      ButtonIcon(buttonIcon: FontAwesomeIcons.times),
                      ButtonIcon(buttonIcon: FontAwesomeIcons.divide),
                    ],
                  ),
                  CalcRow(
                    rowContents: [
                      ButtonText(buttonText: '7'),
                      ButtonText(buttonText: '8'),
                      ButtonText(buttonText: '9'),
                      ButtonText(buttonText: '0'),
                    ],
                  ),
                  CalcRow(
                    rowContents: [
                      ButtonText(buttonText: '4'),
                      ButtonText(buttonText: '5'),
                      ButtonText(buttonText: '6'),
                      ButtonText(buttonText: 'CE'),
                    ],
                  ),
                  CalcRow(
                    rowContents: [
                      ButtonText(buttonText: '1'),
                      ButtonText(buttonText: '2'),
                      ButtonText(buttonText: '3'),
                      ButtonIcon(buttonIcon: FontAwesomeIcons.equals),
                    ],
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
