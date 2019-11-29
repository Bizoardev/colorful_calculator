import 'package:flutter/material.dart';

class BaseText extends StatelessWidget {
  final String baseText;
  const BaseText({
    Key key,
    @required this.baseText,
  })  : assert(baseText != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      baseText,
      style: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
