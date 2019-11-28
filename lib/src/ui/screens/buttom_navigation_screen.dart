import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'calculator_screen.dart';
import 'color_setting_scrren.dart';

class BottomNavigationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoTabScaffold(
        tabBuilder: (context, index) {
          return CupertinoTabView(
            builder: (context) {
              switch (index) {
                case 0:
                  return CalculatorScreen();
                case 1:
                  return ColorSettingScreen();
                default:
                  return Container();
              }
            },
          );
        },
        tabBar: CupertinoTabBar(
          border: Border(
            top: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 0.0,
              style: BorderStyle.solid,
            ),
          ),
          //* to avoid overlap with screen, add backgroundColor, or use safeArea to screen
          // backgroundColor: Theme.of(context).primaryColor,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.calculator),
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.palette),
            ),
          ],
        ),
      ),
    );
  }
}
