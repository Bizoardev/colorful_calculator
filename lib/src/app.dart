import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/providers/calculator_provider.dart';
import 'core/providers/color_provider.dart';
import 'ui/screens/buttom_navigation_screen.dart';
import 'ui/screens/home_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CalculatorProvider>(
          create: (context) => CalculatorProvider(),
        ),
        ChangeNotifierProvider<ColorProvider>(
          create: (context) => ColorProvider(),
        ),
      ],
      child: Consumer<ColorProvider>(
        builder: (context, colorProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Colorful Calculator',
            theme: ThemeData(
              primarySwatch: colorProvider.currentColor,
            ),
            // home: HomeScreen(),
            home: BottomNavigationScreen(),
          );
        },
      ),
    );
  }
}
