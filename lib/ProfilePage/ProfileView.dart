import 'package:flutter/material.dart';

import '../Global.dart';
import '../LoginPage.dart';
import 'ExpBarWidget.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView>
    with SingleTickerProviderStateMixin {
  var global = Global();
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
    return FutureBuilder(
        future: global.userID,
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    color: Scaffold.of(context).widget.backgroundColor,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25.0, bottom: 25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.blueAccent, width: 2),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: CircleAvatar(
                                    radius: 50,
                                    backgroundImage: NetworkImage(
                                      "https://avatars1.githubusercontent.com/u/31440314?s=460&v=4",
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    AnimatedBuilder(
                                        builder: (BuildContext context, Widget child) {
                                          return FadeTransition(
                                            child: Text("Andrei Hortopan",
                                            style: TextStyle(
                                            fontSize: 25,
                                            fontFamily: 'Avenir',
                                            color: Colors.black)), opacity: Tween(begin: 0.0, end: 1.0)
                                              .animate(CurvedAnimation(
                                          parent: controller,
                                          curve: Interval((1 / 9) * 1, 1.0,
                                          curve:
                                          Curves.easeInOutCirc)),
                                          ));
                                        }, animation: controller,),
                                    Row(
                                      children: <Widget>[
                                        Text("Level 7",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: 'Avenir',
                                                color: Colors.grey)),
                                        Icon(Icons.star,
                                            size: 20, color: Colors.yellow),
                                      ],
                                    ),
                                    ExpBarWidget(
                                      animation: Tween(begin: 0.0, end: 1.0)
                                          .animate(CurvedAnimation(
                                              parent: controller,
                                              curve: Interval((1 / 9) * 1, 1.0,
                                                  curve:
                                                      Curves.fastOutSlowIn))),
                                      animationController: controller,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox.shrink()
                            ],
                          ),
                        ],
                      ),
                    )),
              ],
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "You are not logged in",
                    style: TextStyle(
                        fontFamily: 'Avenir',
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Theme.of(context).primaryColor,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                      ),
                      onPressed: () {
                        setState(() {
                          global.isLoggedIn = false;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginView(true)),
                        );
                      },
                      child: Container(
                        width: 100,
                        height: 50,
                        child: Center(
                          child: Text("Log in",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Avenir',
                                fontSize: 18,
                              )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        });
  }
}
