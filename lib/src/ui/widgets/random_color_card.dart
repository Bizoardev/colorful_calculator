import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/providers/color_provider.dart';
import '../../core/color_data.dart';

class RandomColorCard extends StatelessWidget {
  const RandomColorCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorProvider _colorProvider =
        Provider.of<ColorProvider>(context, listen: false);
    return GestureDetector(
      onTap: () => _colorProvider.getRandomColor(),
      child: Container(
        height: 100.0,
        width: 100.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: _colorProvider.colorList),
        ),
      ),
    );
  }
}
