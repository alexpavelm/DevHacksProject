import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../Global.dart';
import '../LoginPage.dart';
import 'ExpBarWidget.dart';
import 'TabBarProfile.dart';

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
                      padding: const EdgeInsets.only(top: 40.0, bottom: 0),
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
                                        color: Theme.of(context).primaryColor, width: 2),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: CircleAvatar(
                                    radius: 50,
                                    backgroundImage: AssetImage(
                                      "assets/images/userImage.jpeg",
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
                                      builder:
                                          (BuildContext context, Widget child) {
                                        return FadeTransition(
                                            child: Text("Andrei Hortopan",
                                                style: TextStyle(
                                                    fontSize: 25,
                                                    fontFamily: 'Avenir',
                                                    color: Colors.black)),
                                            opacity: Tween(begin: 0.0, end: 1.0)
                                                .animate(
                                              CurvedAnimation(
                                                  parent: controller,
                                                  curve: Interval(
                                                      (1 / 9) * 1, 1.0,
                                                      curve: Curves
                                                          .easeInOutCirc)),
                                            ));
                                      },
                                      animation: controller,
                                    ),
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
                                      progress: .8,
                                      text: '127 exp points until level 8',
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
                Container(
                  height: MediaQuery.of(context).size.height * (2.0 / 3.0),
                  child: TabBarProfile(),
                )
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
  Widget investCard(title, description, sum) {
    return Card(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width - 126,
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
                      Container(
                        alignment: Alignment(-1, 0),
                        child: Text(
                          description,
                          style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 18,
                              fontWeight: FontWeight.w100),
                        ),
                      )
                    ],
                  ),
                ),
                Text(
                  "RON" + sum.toString(),
                  style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 18,
                      fontWeight: FontWeight.w100),
                ),
              ]),
        ),
      ),
    );
  }

  Widget investmentList() {
    var global = Global();
      return Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: global.invested.length,
            itemBuilder: (context, index) {
              final item = global.invested[index];
              double profit = item.priceBought - item.currentPrice;

              return Dismissible(
                // Each Dismissible must contain a Key. Keys allow Flutter to
                // uniquely identify widgets.
                key: Key(item.name),
                // Provide a function that tells the app
                // what to do after an item has been swiped away.
                onDismissed: (direction) {
                  // Remove the item from the data source.
                  setState(() {
                    global.money += item.currentPrice;
                    global.profit += profit;
                    global.invested.removeAt(index);
                  });

                  // Then show a snackbar.
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text(item.name + " sold")));
                },
                // Show a red background as the item is swiped away.
                background: Container(
                  color: profit >= 0 ? Colors.green : Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: profit >= 0
                            ? Text("+" + profit.toStringAsPrecision(2),
                                style: TextStyle(
                                    fontFamily: 'Avenir',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white))
                            : Text(profit.toStringAsPrecision(2),
                                style: TextStyle(
                                    fontFamily: 'Avenir',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white)),
                      ),
                    ],
                  ),
                ),
                child: investCard(global.invested[index].name, item.description,
                    item.currentPrice),
              );
            },
          ),
        ),
      );


  }
}
