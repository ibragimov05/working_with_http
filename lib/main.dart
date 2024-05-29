import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:working_with_http/views/screens/category_screen.dart';
import 'package:working_with_http/views/screens/product_screen.dart';
import 'package:working_with_http/views/screens/user_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});

  final List<Widget> _pages = [
    ProductScreen(),
    CategoryScreen(),
    UserScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (BuildContext context) => LiquidSwipe(
          ignoreUserGestureWhileAnimating: true,
          waveType: WaveType.liquidReveal,
          pages: _pages,
        ),
      ),
    );
  }
}
