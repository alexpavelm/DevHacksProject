import 'package:flutter/material.dart';

class ExpBarWidget extends StatelessWidget {
  final AnimationController animationController;
  final Animation animation;
  final double progress;
  final String text;

  const ExpBarWidget(
      {Key key, this.animationController, this.animation, this.progress, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: new Transform(
            transform: new Matrix4.translationValues(
                0.0, 30 * (1.0 - animation.value), 0.0),
            child: Padding(
                padding: const EdgeInsets.only(
                    left: 24, right: 24, top: 16, bottom: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Container(
                        height: 4,
                        width: 150,
                        decoration: BoxDecoration(
                          color:
                          Colors.grey.shade200,
                          borderRadius: BorderRadius.all(
                              Radius.circular(4.0)),
                        ),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: ((150 * progress) * animation.value),
                              height: 4,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Colors.green,
                                  Colors.green
                                      .withOpacity(0.5),
                                ]),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(4.0)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        text,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Avenir',
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Colors.grey
                              .withOpacity(0.5),
                        ),
                      ),
                    ),
                  ],
                ),
            ),
          ),);
      },
    );
  }
}

