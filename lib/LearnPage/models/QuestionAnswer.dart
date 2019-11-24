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
  static Question qLearn = Question(
      text:
          'Stocks are an investment that means you own a share in the company that issued the stock.',
      answers: [
        Answer(
            text: "Continue",
            nextQuestion: Question(
                text:
                    "When you buy the stock of a company, you're effectively buying an ownership share in that company.",
                answers: [
                  Answer(
                      text: "Continue",
                      nextQuestion: Question(
                          text:
                              "Does that mean that you get to sit next to Tim Cook at Apple's next shareholder meeting?",
                          answers: [
                            Answer(
                                text: "Yes?",
                                nextQuestion: Question(
                                    text: "Not quite...",
                                    details:
                                        "But in most cases, it does mean you get a right to vote at those meetings, if you choose to exercise it.",
                                    answers: [Answer(text: "Continue")])),
                            Answer(
                                text: "No?",
                                nextQuestion: Question(
                                    text: "Unfortunately, that's right.",
                                    details:
                                        "But in most cases, it does mean you get a right to vote at those meetings, if you choose to exercise it.",
                                    answers: [Answer(text: "Continue")]))
                          ]))
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
