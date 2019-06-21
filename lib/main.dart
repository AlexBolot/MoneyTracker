import 'package:flutter/material.dart';
import 'package:flutter_stash/flutter_stash.dart';
import 'package:money_tracker/services/wallet_service.dart';
import 'package:money_tracker/views/global_view.dart';
import 'package:intl/date_symbol_data_local.dart' as intl;
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String applicationName = 'Money Tracker';
    buildSplashScreen() => SplashScreen(
          title: applicationName,
          nextRouteName: GlobalView.routeName,
          loadFunctions: [
            () async => await intl.initializeDateFormatting("fr", null),
            () async => WalletService.documentsPath = (await getApplicationDocumentsDirectory()).path,
            //() async => WalletService.initRealTrip(),
            //() async => WalletService.saveWallets(),
            () async => WalletService.readWallets(),
          ],
          nextRoute: MaterialPageRoute(builder: (context) => GlobalView()),
        );

    return MaterialApp(
      title: applicationName,
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => buildSplashScreen(),
        SplashScreen.routeName: (context) => buildSplashScreen(),
        GlobalView.routeName: (context) => GlobalView(),
      },
    );
  }
}
