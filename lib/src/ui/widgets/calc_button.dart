import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/providers/calculator_provider.dart';

class CalcButton extends StatelessWidget {
  final String symbol;

  const CalcButton({
    Key key,
    @required this.symbol,
  })  : assert(symbol != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    CalculatorProvider _calculatorProvider = Provider.of<CalculatorProvider>(
      context,
      listen: false, // do not to listen here
    );
    return Expanded(
      child: ButtonTheme(
        height: double.infinity,
        child: OutlineButton(
          onPressed: () => _calculatorProvider.pressButton(symbol),
          child: _calculatorProvider.calcButtonWidget(symbol),
          splashColor: Theme.of(context).primaryColor.withOpacity(0.1),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
          ),
          highlightedBorderColor:
              Theme.of(context).primaryColor.withOpacity(0.1),
        ),
      ),
    );
  }
}
