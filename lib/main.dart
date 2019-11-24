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
      global.invested.add(InvestedData("stonks", "wow stock", 5.7, 6.1));
      global.invested.add(InvestedData("stonks double", "wow stock double", 11.6, 7.3));
      global.invested.add(InvestedData("hahahahah", "such wow", 27.6, 83.1));
    }
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: DesignCourseAppTheme.nearlyBlue
        ),
        home: Scaffold(
          body: SafeArea(
            child: LoginView(false),
          ),
        ));
  }
}