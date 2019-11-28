import 'package:flutter/material.dart';

import 'ui/screens/buttom_navigation_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Colorful Calculator',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: BottomNavigationScreen(),
    );
  }
}
