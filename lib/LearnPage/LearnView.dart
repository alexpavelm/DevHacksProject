import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';
import 'package:devhacks_app/BottomNavBar.dart';

enum LearnType {ONBOARDING, LEARN}

class LearnView extends StatefulWidget {
  Question question;

  LearnView(Question question) {
    this.question = question;
  }

  @override
  _LearnViewState createState() => _LearnViewState(question);
}

enum QuestionType { MULTIPLE_ANSWER, SINGLE_ANSWER }

class Question {
  String _text;
  String _details;
  List<Answer> _answers;
  QuestionType _questionType;
  Question _nextQuestion; // used for multiple answer
  Function(BuildContext) _callback; // used for multiple answer

  Question(
      {String text,
      String details = null,
      List<Answer> answers = null,
      QuestionType questionType = QuestionType.SINGLE_ANSWER,
      Question nextQuestion = null,
      Function(BuildContext) callback = null}) {
    _text = text;
    _details = details;
    if (answers == null)
      _answers = <Answer>[];
    else
      _answers = answers;
    _questionType = questionType;
    _nextQuestion = nextQuestion;
    if (callback == null)
      _callback = (context) {};
    else
      _callback = callback;
  }
}

class Answer {
  String _text;
  Question _nextQuestion;
  bool _selected;
  Function(BuildContext) _callback;

  Answer(
      {String text,
      Question nextQuestion = null,
      Function(BuildContext) callback = null}) {
    _text = text;
    _nextQuestion = nextQuestion;
    _selected = false;
    if (callback == null)
      _callback = (context) {};
    else
      _callback = callback;
  }
}

class _LearnViewState extends State<LearnView> {
  Question _question;

  _LearnViewState(Question question) {
    _question = question;
  }

  Container getContent() {
    TextStyle questionStyle = TextStyle(
        fontFamily: 'Avenir', fontWeight: FontWeight.w600, fontSize: 24);
    TextStyle detailsStyle = TextStyle(
        fontFamily: 'Avenir',
        fontWeight: FontWeight.w100,
        fontSize: 18,
        color: Colors.black54);

    List<Widget> children = <Widget>[];
    children.add(Container(
        alignment: Alignment.topLeft,
        child: Text(_question._text, style: questionStyle)));
    if (_question._details != null) {
      children.add(SizedBox(
        height: 2.0,
      ));
      children.add(Container(
          alignment: Alignment.topLeft,
          child: Text(_question._details, style: detailsStyle)));
    }
    children.add(SizedBox(
      height: 5.0,
    ));
    for (Answer answer in _question._answers) {
      children.add(SizedBox(
        height: 10.0,
      ));
      children.add(getButtonUI(
          answer._text,
          _question._questionType == QuestionType.SINGLE_ANSWER
              ? true
              : answer._selected, () {
        setState(() {
          if (_question._questionType == QuestionType.MULTIPLE_ANSWER)
            answer._selected = !answer._selected;
          else if (answer._nextQuestion != null)
            _question = answer._nextQuestion;
          answer._callback(context);
        });
      }));
    }
    if (_question._questionType == QuestionType.MULTIPLE_ANSWER) {
      children.add(SizedBox(
        height: 15.0,
      ));
      bool okEnabled = false;
      for (Answer ans in _question._answers) {
        if (ans._selected) okEnabled = true;
      }
      print("Ok enabled = $okEnabled");
      children.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            getButtonUI("OK", okEnabled, () {
              setState(() {
                if (_question._nextQuestion != null)
                  _question = _question._nextQuestion;
                if (okEnabled)
                  _question._callback(context);
              });
            }),
          ],
        ),
      );
    }

    return Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, children: children));
  }

  Widget getButtonUI(String txt, bool selected, GestureTapCallback onTap) {
    TextStyle answerStyleSelected = TextStyle(
      fontFamily: 'Avenir',
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    );
    TextStyle answerStyleNotSelected = TextStyle(
      fontFamily: 'Avenir',
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).primaryColor,
    );

    return Container(
      decoration: new BoxDecoration(
          color: selected ? Theme.of(context).primaryColor : Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(24.0)),
          border: new Border.all(color: Theme.of(context).primaryColor)),
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
                style: selected ? answerStyleSelected : answerStyleNotSelected,
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
        padding: EdgeInsets.only(left: 8.0, right: 8.0),
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
