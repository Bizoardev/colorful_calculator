import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/providers/color_provider.dart';

class ColorCard extends StatelessWidget {
  final MaterialColor colorItem;
  const ColorCard({Key key, @required this.colorItem})
      : assert(colorItem != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Color> colorItemList = [
      colorItem.shade100,
      colorItem.shade200,
      colorItem.shade300,
      colorItem.shade400,
      colorItem.shade500,
      colorItem.shade600,
      colorItem.shade700,
      colorItem.shade800,
      colorItem.shade900
    ];
    return GestureDetector(
      onTap: () => Provider.of<ColorProvider>(context, listen: false)
          .handleColor(colorItem),
      child: Container(
        height: 100.0,
        width: 100.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: colorItemList,
          ),
        ),
      ),
    );
  }
}
