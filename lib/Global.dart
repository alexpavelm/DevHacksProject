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
  static Question qLearn =
      Question(text: 'What would you like to learn about?', answers: [
    Answer(text: "Risk"),
    Answer(
        text: "Investments",
        nextQuestion: Question(
            text: "Which type of investment are you interested in?",
            answers: [
              Answer(text: "Stocks"),
              Answer(text: "Bonds"),
              Answer(text: "Mutual Funds"),
              Answer(text: "REIT"),
              Answer(text: "Index Funds"),
              Answer(text: "Startups")
            ]))
  ]);
  bool isLoggedIn = false;
  bool isGuest = false;
}