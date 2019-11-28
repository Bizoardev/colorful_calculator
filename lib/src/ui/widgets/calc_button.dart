import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final Widget buttonWidget;
  final Function onPressed;
  const CalcButton({
    Key key,
    @required this.buttonWidget,
    @required this.onPressed,
  })  : assert(buttonWidget != null),
        assert(onPressed != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ButtonTheme(
        height: double.infinity,
        child: OutlineButton(
          onPressed: onPressed,
          child: buttonWidget,
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
