import 'package:flutter/material.dart';

class ButtonText extends StatelessWidget {
  final String buttonText;
  const ButtonText({
    Key key,
    @required this.buttonText,
  })  : assert(buttonText != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      buttonText,
      style: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
