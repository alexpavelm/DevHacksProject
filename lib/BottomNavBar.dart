
import 'package:flutter/material.dart';

import 'InvestmentPage/InvestmentView.dart';
import 'LearnPage/LearnView.dart';
import 'LearnPage/homeDesignCourse.dart';
import 'LearnPage/models/QuestionAnswer.dart';
import 'LoginPage.dart';
import 'NewsPage/NewsView.dart';
import 'ProfilePage/ProfileView.dart';
import 'Global.dart';

class BottomNavBar extends StatefulWidget {
  int index;
  BottomNavBar(this.index);
  @override
  State<BottomNavBar> createState() {
    return BottomNavBarState();
  }
}

class BottomNavBarState extends State<BottomNavBar> {
  final List<Widget> _children = [
    InvestmentView(),
    NewsView(),
    DesignCourseHomeScreen(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: widget.index,
      length: 4,
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: new Scaffold(
          body: TabBarView(children: _children), // new
          bottomNavigationBar: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.attach_money),
              ),
              Tab(
                icon: Icon(Icons.library_books),
              ),
              Tab(
                icon: Icon(Icons.help),
              ),
              Tab(
                icon: Icon(Icons.account_circle),
              ),
            ],
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
