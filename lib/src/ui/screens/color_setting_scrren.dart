import 'package:flutter/material.dart';
import '../../core/color_data.dart';
import '../widgets/color_card.dart';
import '../widgets/random_color_card.dart';

class ColorSettingScreen extends StatelessWidget {
  const ColorSettingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COLOR SETTING'),
      ),
      body: SafeArea(
        child: Container(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: colorData.length + 1,
            itemBuilder: (context, index) {
              if (index < colorData.length) {
                final MaterialColor colorItem = colorData[index];
                return ColorCard(
                  colorItem: colorItem,
                );
              } else {
                return RandomColorCard();
              }
            },
          ),
        ),
      ),
    );
  }
}
