import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';

class LearnView extends StatefulWidget {
  static Question ready = Question(
    text:
        "You're ready to use the app! Go to the investment tab (\$) to start making money.",
  );
  static Question risk = Question(
      text: "What kind of risk are you willing to take?",
      details:
          "Please note that a higher risk often leads to a higher reward.",
      answers: [
        Answer(text: "Low risk"),
        Answer(text: "Moderate risk"),
        Answer(text: "High risk"),
      ]);
  static Question invest = Question(
      text: "Do you already know what you want to invest in?",
      answers: [
        Answer(text: "Yes", nextQuestion: ready),
        Answer(text: "No", nextQuestion: risk)
      ]);

  @override
  _LearnViewState createState() => _LearnViewState(invest);
}

class Question {
  String _text;
  String _details;
  List<Answer> _answers;

  Question({String text, String details = null, List<Answer> answers = null}) {
    _text = text;
    _details = details;
    if (answers == null)
      _answers = <Answer>[];
    else
      _answers = answers;
  }
}

class Answer {
  String _text;
  Question _nextQuestion;

  Answer({String text, Question nextQuestion = null}) {
    _text = text;
    _nextQuestion = nextQuestion;
  }
}

class _LearnViewState extends State<LearnView> {
  TextStyle _questionStyle = TextStyle(
      fontFamily: 'Avenir', fontWeight: FontWeight.w600, fontSize: 24);
  TextStyle _detailsStyle = TextStyle(
      fontFamily: 'Avenir',
      fontWeight: FontWeight.w100,
      fontSize: 18,
      color: Colors.black54);
  TextStyle _answerStyle = TextStyle(
    fontFamily: 'Avenir',
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  Question _question;

  _LearnViewState(Question question) {
    _question = question;
  }

  Container getContent() {
    List<Widget> children = <Widget>[];
    children.add(Container(
        alignment: Alignment.topLeft,
        child: Text(_question._text, style: _questionStyle)));
    if (_question._details != null) {
      children.add(SizedBox(height: 2.0,));
      children.add(Container(
          alignment: Alignment.topLeft,
          child: Text(_question._details, style: _detailsStyle)));
    }
    children.add(SizedBox(
      height: 5.0,
    ));
    for (Answer answer in _question._answers) {
      children.add(SizedBox(
        height: 10.0,
      ));
      children.add(getButtonUI(answer._text, () {
        setState(() {
          if (answer._nextQuestion != null) _question = answer._nextQuestion;
        });
      }));
    }

    return Container(
        padding: EdgeInsets.all(10.0), child: Column(children: children));
  }

  Widget getButtonUI(String txt, GestureTapCallback onTap) {
    return Container(
      decoration: new BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(24.0)),
          border: new Border.all(color: Colors.blue)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.grey[400],
          borderRadius: BorderRadius.all(Radius.circular(24.0)),
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.only(top: 12, bottom: 12, left: 18, right: 18),
            child: Center(
              child: Text(
                txt,
                textAlign: TextAlign.left,
                style: _answerStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    BubbleStyle styleTutorial = BubbleStyle(
//        stick: true,
//      nip: BubbleNip.leftBottom,
        color: Colors.white,
        elevation: 1,
        margin: BubbleEdges.only(top: 10.0, bottom: 10.0),
        alignment: Alignment.centerLeft,
        shadowColor: Colors.blue);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Bubble(style: styleTutorial, child: getContent()),
            Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/stonks.png"),
                      alignment: Alignment.bottomLeft),
                )),
          ],
        ),
      ),
    );
  }
}
