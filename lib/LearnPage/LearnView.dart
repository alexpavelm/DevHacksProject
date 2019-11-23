import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';

class LearnView extends StatefulWidget {
  @override
  _LearnViewState createState() => _LearnViewState(
      content: Container(
          child: Text('STONKS',
              style: TextStyle(
                  fontFamily: 'Avenir',
                  fontSize: 30))));
}

class _LearnViewState extends State<LearnView> {
  Container _content;

  _LearnViewState({Container content}) {
    _content = content;
  }

  @override
  Widget build(BuildContext context) {
    BubbleStyle styleTutorial = BubbleStyle(
        stick: true,
        color: Colors.grey[200],
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
        child: Bubble(style: styleTutorial, child: _content),
      ),
    );
  }
}
