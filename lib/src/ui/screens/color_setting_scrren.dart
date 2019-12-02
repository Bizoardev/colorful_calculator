import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/color_card.dart';
import '../widgets/random_color_card.dart';
import '../../core/providers/color_provider.dart';

class ColorSettingScreen extends StatelessWidget {
  const ColorSettingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<MaterialColor> _colorList =
        Provider.of<ColorProvider>(context, listen: false).colorList;
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
            itemCount: _colorList.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return RandomColorCard();
              } else {
                final MaterialColor colorItem = _colorList[index - 1];
                return ColorCard(
                  colorItem: colorItem,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
