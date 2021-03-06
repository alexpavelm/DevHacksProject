import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'BottomNavBar.dart';
import 'Global.dart';
import 'LearnPage/LearnView.dart';
import 'LearnPage/models/QuestionAnswer.dart';
import 'Widgets/FormCard.dart';
import 'Widgets/SocialIcons.dart';
import 'CustomIcons.dart';

class LoginView extends StatefulWidget {
  bool pop = false;

  LoginView(this.pop);

  @override
  _LoginViewState createState() => new _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var global = Global();

  Widget horizontalLine() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          width: ScreenUtil.getInstance().setWidth(120),
          height: 1.0,
          color: Colors.black26.withOpacity(.2),
        ),
      );

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return !global.isLoggedIn
        ? Scaffold(
            resizeToAvoidBottomPadding: true,
            body: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                SingleChildScrollView(
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 28.0, right: 28.0, top: 00.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(50),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              height: 100,
                              child: Image.asset("assets/images/camel.png", color: Theme.of(context).primaryColor,),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 50.0),
                              child: Text("sofos", style: TextStyle(fontFamily: 'Avenir', fontSize: 45, fontWeight: FontWeight.w500, color: Colors.black),),
                            ),

                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0, bottom: 8),
                          child: FormCard(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: loginButtons(),
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(40),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            horizontalLine(),
                            Text("Social Login",
                                style: TextStyle(
                                    fontSize: 16.0, fontFamily: 'Avenir')),
                            horizontalLine()
                          ],
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(40),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SocialIcon(
                              colors: [
                                Color(0xFF3b5998),
                              ],
                              iconData: CustomIcons.facebook,
                              onPressed: () {},
                            ),
                            SocialIcon(
                              colors: [
                                Color(0xFFff4f38),
                              ],
                              iconData: CustomIcons.googlePlus,
                              onPressed: () {},
                            ),
                            SocialIcon(
                              colors: [
                                Color(0xFF0084b4),
                              ],
                              iconData: CustomIcons.twitter,
                              onPressed: () {},
                            ),
                            SocialIcon(
                              colors: [
                                Color(0xFF2867B2),
                              ],
                              iconData: CustomIcons.linkedin,
                              onPressed: () {},
                            )
                          ],
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(30),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "New User? ",
                              style: TextStyle(fontFamily: 'Avenir'),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Text("Sign up",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontFamily: 'Avenir')),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        : LearnView(Question.qStart);
  }

  Widget loginButtons() {
    return global.isGuest
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                textColor: Colors.white,
                color: Theme.of(context).primaryColor,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(15.0),
                ),
                onPressed: () {
                  setState(() {
                    global.userID =
                        Future.delayed(new Duration(microseconds: 1));
                    global.isLoggedIn = true;
                    if (widget.pop) {
                      Navigator.pop(context);
                    }
                  });
                },
                child: Container(
                  width: 100,
                  height: 50,
                  child: Center(
                    child: Text("Sign in",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Avenir',
                          fontSize: 18,
                        )),
                  ),
                ),
              ),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                textColor: Colors.white,
                color: Theme.of(context).primaryColor,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(15.0),
                ),
                onPressed: () {
                  setState(() {
                    global.isLoggedIn = true;
                    if (widget.pop) {
                      Navigator.pop(context);
                    }
                  });
                },
                child: Container(
                  width: 100,
                  height: 50,
                  child: Center(
                    child: Text("Sign in",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Avenir',
                          fontSize: 18,
                        )),
                  ),
                ),
              ),
              RaisedButton(
                textColor: Colors.white,
                color: Colors.grey,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(15.0),
                ),
                onPressed: () {
                  setState(() {
                    global.isLoggedIn = true;
                    global.isGuest = true;
                    if (widget.pop) {
                      Navigator.pop(context);
                    }
                  });
                },
                child: Container(
                  width: 100,
                  height: 50,
                  child: Center(
                    child: Text("Guest login",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Avenir',
                          fontSize: 18,
                        )),
                  ),
                ),
              ),
            ],
          );
  }
}
