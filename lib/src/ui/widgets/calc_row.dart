import 'package:colorful_calculator/src/ui/widgets/calc_button.dart';
import 'package:flutter/material.dart';

class CalcRow extends StatelessWidget {
  final List<String> symbols;
  const CalcRow({Key key, @required this.symbols})
      : assert(symbols != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: <Widget>[
          ...symbols
              .map((symbol) => CalcButton(
                    symbol: symbol,
                  ))
              .toList() // is not required with spread operator
        ],
      ),
    );
  }
}
