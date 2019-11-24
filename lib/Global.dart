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

  // Onboarding (starts at qStart)
  static Question qReady = Question(
    text:
    "You're ready to use the app! Go to the investment tab (\$) to start making money.",
  );
  static Question qInvestments = Question(
      text: "What do you want to invest in?",
      questionType: QuestionType.MULTIPLE_ANSWER,
      answers: [
        Answer(
            text: "Stocks",
            callback: (_) {
              stocks = !stocks;
            }),
        Answer(
            text: "Bonds",
            callback: (_) {
              bonds = !bonds;
            }),
        Answer(
            text: "ETFs",
            callback: (_) {
              etfs = !etfs;
            })
      ],
      callback: (context) {
        print("HELLO");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BottomNavBar(0)),
        );
      });
  static Question qRisk = Question(
      text: "What kind of risk are you willing to take?",
      details: "Please note that a higher risk often leads to a higher reward.",
      answers: [
        Answer(text: "Low risk"),
        Answer(text: "Moderate risk"),
        Answer(text: "High risk"),
      ]);
  static Question qStart = Question(
      text: "Do you already know what you want to invest in?",
      answers: [
        Answer(text: "Yes", nextQuestion: qInvestments),
        Answer(text: "No", nextQuestion: qRisk)
      ]);

  // Learn (starts at qLearn)
  static Question qLearn = Question(text: 'Start learning now!');
  bool isLoggedIn = false;
  bool isGuest = false;
  bool loaded = false;
  double money = 150;
  double profit = 0;
  List<InvestedData> invested = new List();
}