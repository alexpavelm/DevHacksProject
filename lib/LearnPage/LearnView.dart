import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';
import 'models/QuestionAnswer.dart';

enum LearnType { ONBOARDING, LEARN }

class LearnView extends StatefulWidget {
  final Question question;

  LearnView(this.question);

  @override
  _LearnViewState createState() => _LearnViewState(question);
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
        child: Text(_question.text, style: questionStyle)));
    if (_question.details != null) {
      children.add(SizedBox(
        height: 2.0,
      ));
      children.add(Container(
          alignment: Alignment.topLeft,
          child: Text(_question.details, style: detailsStyle)));
    }
    children.add(SizedBox(
      height: _question.answers.length > 0 ? 5.0 : 0,
    ));
    bool skip = true; // skip first padding
    List<Widget> scrollChildren = <Widget>[];
    for (Answer answer in _question.answers) {
      if (!skip) {
        scrollChildren.add(SizedBox(
          height: 10.0,
        ));
      }
      skip = false;
      scrollChildren.add(getButtonUI(
          answer.text,
          _question.questionType == QuestionType.SINGLE_ANSWER
              ? true
              : answer.selected, () {
        setState(() {
          if (_question.questionType == QuestionType.MULTIPLE_ANSWER)
            answer.selected = !answer.selected;
          else if (_question.nextQuestion != null)
            _question = _question.nextQuestion;
          else if (answer.nextQuestion != null) _question = answer.nextQuestion;
          answer.callback(context);
          _question.callback(context);
        });
      }));
    }
    children.add(ConstrainedBox(
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height / 3),
      child: ListView(
        shrinkWrap: true,
        children: scrollChildren,
      ),
    ));
    if (_question.questionType == QuestionType.MULTIPLE_ANSWER) {
      children.add(SizedBox(
        height: 15.0,
      ));
      bool okEnabled = false;
      for (Answer ans in _question.answers) {
        if (ans.selected) okEnabled = true;
      }
      print("Ok enabled = $okEnabled");
      children.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            getButtonUI("OK", okEnabled, () {
              setState(() {
                if (_question.nextQuestion != null)
                  _question = _question.nextQuestion;
                if (okEnabled) _question.callback(context);
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
