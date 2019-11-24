import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'BottomNavBar.dart';
import 'Global.dart';
import 'InvestmentPage/InvestedData.dart';
import 'LoginPage.dart';
import 'LearnPage/designCourseAppTheme.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarDividerColor: Colors.grey,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
}

class MyApp extends StatelessWidget {
  var global = Global();

  @override
  Widget build(BuildContext context) {
    if(!global.loaded) {
      global.loaded = true;
      global.invested.add(InvestedData("NIKE, Inc.", "+1.18%", 68.8, 68));
      global.invested.add(InvestedData("Starbucks Corporation", "+0.72%", 67.48, 67));
      global.invested.add(InvestedData("Burberry", "-0.11%", 33.96, 34));
    }
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Color.fromRGBO(240, 141, 79, 1)
        ),
        home: Scaffold(
          body: SafeArea(
            child: LoginView(false),
          ),
        ));
  }
}