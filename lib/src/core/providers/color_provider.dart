import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../color_data.dart';

class ColorProvider with ChangeNotifier {
  List<MaterialColor> _colorList = colorData;
  MaterialColor _currentColor;
  List<MaterialColor> get colorList => [..._colorList];
  MaterialColor get currentColor => _currentColor;

  ColorProvider() {
    getColor();
  }

  void getColor() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int currentColorIndex = (prefs.getInt('color') ?? 0);
    _currentColor = _colorList[currentColorIndex];
    notifyListeners();
  }

  void handleColor(MaterialColor selectedColor) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int selectedColorIndex = _colorList.indexOf(selectedColor);
    await prefs.setInt('color', selectedColorIndex);
    _currentColor = selectedColor;
    notifyListeners();
  }

  int _randomNum(int min, int max) => min + Random().nextInt(max - min);
  void getRandomColor() {
    final randomIndex = _randomNum(0, _colorList.length);
    final randomColor = _colorList[randomIndex];
    handleColor(randomColor);
  }
}
