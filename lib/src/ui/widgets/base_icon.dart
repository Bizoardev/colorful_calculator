import 'package:flutter/material.dart';

class BaseIcon extends StatelessWidget {
  final IconData baseIcon;
  const BaseIcon({
    Key key,
    @required this.baseIcon,
  })  : assert(baseIcon != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      baseIcon,
      size: 32.0,
    );
  }
}
