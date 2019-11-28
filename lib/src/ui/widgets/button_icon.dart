import 'package:flutter/material.dart';

class ButtonIcon extends StatelessWidget {
  final IconData buttonIcon;
  const ButtonIcon({
    Key key,
    @required this.buttonIcon,
  })  : assert(buttonIcon != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      buttonIcon,
      size: 32.0,
    );
  }
}
