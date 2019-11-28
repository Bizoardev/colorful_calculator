import 'package:flutter/material.dart';
import '../../core/color_data.dart';

class RandomColorCard extends StatelessWidget {
  const RandomColorCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: 100.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: colorData),
      ),
    );
  }
}
