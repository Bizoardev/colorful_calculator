import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/providers/calculator_provider.dart';
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
                  child: Consumer<CalculatorProvider>(
                    builder: (context, _calculatorProvider, child) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          if (_calculatorProvider.displaySymbol)
                            _calculatorProvider.handleSymbol() ??
                                SizedBox.shrink(),
                          Flexible(
                            child: Text(
                              _calculatorProvider.displayNum,
                              textAlign: TextAlign.end,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 80.0,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: <Widget>[
                  CalcRow(symbols: ['+', '-', '*', '/']),
                  CalcRow(symbols: ['7', '8', '9', '0']),
                  CalcRow(symbols: ['4', '5', '6', 'CE']),
                  CalcRow(symbols: ['1', '2', '3', '=']),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
