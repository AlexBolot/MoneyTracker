import 'package:flutter/material.dart';
import 'package:money_tracker/model/currency.dart';
import 'package:money_tracker/views/global_view.dart';
import 'package:money_tracker/views/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashScreen(),
        SplashScreen.routeName: (context) => SplashScreen(),
        GlobalView.routeName: (context) => GlobalView(),
      },
    );
  }
}

Color contrastOf(Color background) {
  var brightness = ThemeData.estimateBrightnessForColor(background);
  return brightness == Brightness.light ? Colors.black : Colors.white;
}

String toFirstUpper(String string) {
  return string[0].toUpperCase() + string.substring(1).toLowerCase();
}

Currency currency = Currency(primary: "\$", secondary: "€", changeRate: 0.666);
