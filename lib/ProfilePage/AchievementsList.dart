import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'ExpBarWidget.dart';

class AchievementsList extends StatefulWidget {
  @override
  _AchievementsListState createState() => _AchievementsListState();
}

class _AchievementsListState extends State<AchievementsList> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            achievementCard("Invest 10 times", .5, "assets/images/ach01.png"),
            achievementCard("Get profit with a high risk", 1, "assets/images/ach02.png"),
            achievementCard("Get a return of 2x or more", 0, "assets/images/ach04.png"),
            achievementCard("Login for 10 consecutive days", .7, "assets/images/ach03.png"),
          ],
        ),
      ),
    );
  }

  Widget achievementCard(title, double progress, link) {
    return Card(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 100,
                  child: Image.asset(link),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AutoSizeText(
                        title,
                        style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                        maxLines: 1,
                      ),
                      ExpBarWidget(
                        animation: Tween(begin: 0.0, end: 1.0)
                            .animate(CurvedAnimation(
                            parent: controller,
                            curve: Interval((1 / 9) * 1, 1.0,
                                curve:
                                Curves.fastOutSlowIn))),
                        animationController: controller,
                        progress: progress,
                        text: (progress * 100).floor().toString() + "% Completed",
                      ),
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
