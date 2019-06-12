import 'package:flutter/material.dart';
import 'package:money_tracker/model/static_currency.dart';
import 'package:money_tracker/views/global_view.dart';
import 'package:money_tracker/views/splash_screen.dart';
import 'package:money_tracker/views/currency_setting_view.dart';

void main() {
  StaticCurrency.primary="\$";
  StaticCurrency.secondary="€";
  StaticCurrency.changeRate=0.666;
  runApp(MyApp());
}

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
        CurrencySettingView.routeName : (context) => CurrencySettingView(),
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
