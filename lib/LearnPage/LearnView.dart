import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';

class LearnView extends StatefulWidget {
  @override
  _LearnViewState createState() =>
      _LearnViewState(Question(text: "Stonks", answers: [
        Answer(text: "Stonks1", nextQuestion: Question(text: "Simple stonks")),
        Answer(text: "Stonks2")
      ]));
}

class Question {
  String _text;
  List<Answer> _answers;

  Question({String text, List<Answer> answers = null}) {
    _text = text;
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
        margin: BubbleEdges.only(top: 20.0, bottom: 20.0),
        alignment: Alignment.centerLeft,
        shadowColor: Colors.blue);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/stonks.png"),
              fit: BoxFit.fitWidth,
              alignment: Alignment.bottomLeft),
        ),
        child: Column(
          verticalDirection: VerticalDirection.up,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 240.0,
            ),
            Bubble(style: styleTutorial, child: getContent()),
          ],
        ),
      ),
    );
  }
}
