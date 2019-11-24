import 'package:flutter/material.dart';
import 'package:devhacks_app/Global.dart';
import 'package:devhacks_app/BottomNavBar.dart';

enum QuestionType { MULTIPLE_ANSWER, SINGLE_ANSWER }

class Question {
  String text;
  String details;
  List<Answer> answers;
  QuestionType questionType;
  Question nextQuestion; // used for multiple answer
  Function(BuildContext) callback; // used for multiple answer

  Question(
      {String this.text,
      this.details = null,
      this.answers = const <Answer>[],
      this.questionType = QuestionType.SINGLE_ANSWER,
      this.nextQuestion = null,
      this.callback = null}) {
    if (callback == null) callback = (context) {};
  }

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
              Global.stocks = !Global.stocks;
            }),
        Answer(
            text: "Bonds",
            callback: (_) {
              Global.bonds = !Global.bonds;
            }),
        Answer(
            text: "ETFs",
            callback: (_) {
              Global.etfs = !Global.etfs;
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
}

class Answer {
  String text;
  Question nextQuestion;
  bool selected;
  Function(BuildContext) callback;

  Answer({this.text, this.nextQuestion = null, this.callback = null}) {
    selected = false;
    if (callback == null) callback = (context) {};
  }
}
