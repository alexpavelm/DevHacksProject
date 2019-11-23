
import 'package:flutter/material.dart';

import 'InvestmentPage/InvestmentView.dart';
import 'LearnPage/LearnView.dart';
import 'NewsPage/NewsView.dart';
import 'ProfilePage/ProfileView.dart';

class BottomNavBar extends StatefulWidget {
  @override
  State<BottomNavBar> createState() {
    return BottomNavBarState();
  }
}

class BottomNavBarState extends State<BottomNavBar> {
  final List<Widget> _children = [
    InvestmentView(),
    NewsView(),
    LearnView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
                icon: Icon(Icons.list),
              ),
              Tab(
                icon: Icon(Icons.account_circle),
              ),
            ],
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.blue,
          ),
        ),
      ),
    );
  }
}
