import 'InvestmentPage/InvestedData.dart';
import 'LearnPage/LearnView.dart';
import 'package:flutter/material.dart';
import 'BottomNavBar.dart';

class Global {
  static final Global _singleton = Global._internal();

  factory Global() {
    return _singleton;
  }

  Global._internal();

  Future userID;

  static bool stocks = false;
  static bool bonds = false;
  static bool etfs = false;

  bool isLoggedIn = false;
  bool isGuest = false;
  bool loaded = false;
  double money = 150;
  double profit = 0;
  int counterList = 0;
  List<InvestedData> invested = new List();
}