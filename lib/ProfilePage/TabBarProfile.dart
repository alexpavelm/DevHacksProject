import 'package:flutter/material.dart';

import 'AchievementsList.dart';
import 'InvestmentsList.dart';

class TabBarProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: ListView(
        children: <Widget>[
          Container(
            width: 48,
            color: Scaffold.of(context).widget.backgroundColor,
            child: TabBar(
              tabs: [
                Tab(child: Text("Investments", style: TextStyle(fontFamily: 'Avenir', fontSize: 20,),),),
                Tab(child: Text("Achievements", style: TextStyle(fontFamily: 'Avenir', fontSize: 20),),),
              ],
              labelColor: Theme.of(context).primaryColor,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Theme.of(context).primaryColor,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 380,
            child: TabBarView(
              children: [
                InvestmentsList(),
                AchievementsList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
