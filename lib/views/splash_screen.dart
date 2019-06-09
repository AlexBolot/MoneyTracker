import 'package:flutter/material.dart';
import 'package:money_tracker/main.dart';
import 'package:money_tracker/views/global_view.dart';
import 'package:money_tracker/widgets/bubble_loader.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "/SplashScreen";

  final String title;

  const SplashScreen({this.title = ''});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  BubbleLoader loader = BubbleLoader();

  @override
  void initState() {
    super.initState();
    applicationLoading();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Stack(
          alignment: Alignment(0, -1),
          children: <Widget>[
            Container(
              width: double.infinity,
              height: screenHeight * 2 / 5,
              child: Container(
                margin: EdgeInsets.all(0),
                color: Theme.of(context).primaryColor,
                child: Center(
                  child: Text(
                    'Money Tracker',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      color: contrastOf(Theme.of(context).primaryColor),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: screenHeight * 2 / 5),
              width: double.infinity,
              height: screenHeight * 3 / 5,
              child: Center(child: Container(child: loader)),
            ),
          ],
        ),
      ),
    );
  }

  applicationLoading() async {
    await Future.delayed(const Duration(seconds: 1));
    loader.dispose();
     Navigator.of(context).pushReplacementNamed(GlobalView.routeName);
  }
}
