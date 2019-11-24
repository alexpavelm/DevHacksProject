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

  /*static Question qStart = Question(
      text: "Do you already know what you want to invest in?",
      answers: [
        Answer(text: "Yes", nextQuestion: qInvestments),
        Answer(text: "No", nextQuestion: qRisk)
      ]);*/

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

  //new list
  static Question qStart =
      Question(text: "How familiar are you with investing?", answers: [
    Answer(
      text: "Not very familiar",
      nextQuestion: qNotFamiliar1,
    ),
    Answer(
      text: "I am well accustomed to it",
      nextQuestion: qMainInterests,
    ),
  ]);
  static Question qMainInterests = Question(
      text: "What are your main interests to invest in?",
      nextQuestion: qRiskAssessment,
      answers: [
        Answer(text: "Stocks"),
        Answer(text: "Bonds"),
        Answer(text: "Mutual Funds"),
        Answer(text: "REIT"),
        Answer(text: "Index Funds"),
        Answer(text: "Startups"),
        Answer(text: "ETFs"),
      ]);
  static Question qRiskAssessment = Question(
      text: "How risk-tolerant are you?",
      nextQuestion: qFrequencyOfInvestment,
      answers: [
        Answer(text: "I am risk-averse"),
        Answer(text: "I am moderately tolerant"),
        Answer(text: "I am risk-seeking"),
      ]);
  static Question qFrequencyOfInvestment = Question(
      text: "How often do you want to invest?",
      nextQuestion: qStartMoney,
      answers: [
        Answer(text: "daily"),
        Answer(text: "weekly"),
        Answer(text: "monthly"),
        Answer(text: "yearly")
      ]);
  static Question qStartMoney = Question(
      text: "Do you have a sum of money you are willing to invest?",
      nextQuestion: qExpectedReturn,
      answers: [
        Answer(text: "No, we will see"),
        Answer(text: "Under \$100"),
        Answer(text: "Under \$1000"),
        Answer(text: "Over \$1000"),
      ]);
  static Question qExpectedReturn = Question(
      text: "When are you expecting to get your return?",
      nextQuestion: qOwnership,
      answers: [
        Answer(text: "as soon as possible"),
        Answer(text: "at the end of the month"),
        Answer(text: "at the end of the year"),
        Answer(text: "in many years' time"),
      ]);
  static Question qOwnership = Question(
      text: "Are you willing to invest into company ownership?",
      nextQuestion: qForeign,
      answers: [
        Answer(text: "Yes, I value ownership"),
        Answer(text: "No, I only care about dividends"),
      ]);
  static Question qForeign = Question(
      text:
          "Do you tolerate foreign assets? (1-Not at all, 5-Yes, I prefer them)",
      nextQuestion: qFinalNew,
      answers: [
        Answer(text: "1"),
        Answer(text: "2"),
        Answer(text: "3"),
        Answer(text: "4"),
        Answer(text: "5"),
      ]);
  static Question qFinalNew = Question(
      text:
          "We have prepared some recommendations based on your preferences. We are now ready to begin investing.",
      answers: [
        Answer(text: "Ok."),
      ],
      callback: (context) {
        print("HELLO");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BottomNavBar(0)),
        );
      });

  static Question qNotFamiliar1 = Question(
      text:
          "I remain calm and relaxed in situations in which most people would become fearful, upset, or stressed.",
      nextQuestion: qNotFamiliar2,
      answers: [
        Answer(text: "1"),
        Answer(text: "2"),
        Answer(text: "3"),
        Answer(text: "4"),
        Answer(text: "5"),
      ]);
  static Question qNotFamiliar2 = Question(
      text:
          "At an amusement park, I automatically gravitate toward the highest, fastest, most intense rides.",
      nextQuestion: qNotFamiliar3,
      answers: [
        Answer(text: "1"),
        Answer(text: "2"),
        Answer(text: "3"),
        Answer(text: "4"),
        Answer(text: "5"),
      ]);
  static Question qNotFamiliar3 = Question(
      text: "I will take a greater risk for a greater potential payoff.",
      nextQuestion: qNotFamiliar4,
      answers: [
        Answer(text: "1"),
        Answer(text: "2"),
        Answer(text: "3"),
        Answer(text: "4"),
        Answer(text: "5"),
      ]);
  static Question qNotFamiliar4 = Question(
      text:
          " I lose confidence when there is a chance that my project will fail.",
      nextQuestion: qNotFamiliar5,
      answers: [
        Answer(text: "1"),
        Answer(text: "2"),
        Answer(text: "3"),
        Answer(text: "4"),
        Answer(text: "5"),
      ]);
  static Question qNotFamiliar5 = Question(
      text: "Chance has a lot to do with being successful.",
      nextQuestion: qNotFamiliar6,
      answers: [
        Answer(text: "1"),
        Answer(text: "2"),
        Answer(text: "3"),
        Answer(text: "4"),
        Answer(text: "5"),
      ]);
  static Question qNotFamiliar6 = Question(
      text: "If I take a risk and fail, I can handle the consequences.",
      nextQuestion: qFrequencyOfInvestment,
      answers: [
        Answer(text: "1"),
        Answer(text: "2"),
        Answer(text: "3"),
        Answer(text: "4"),
        Answer(text: "5"),
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
