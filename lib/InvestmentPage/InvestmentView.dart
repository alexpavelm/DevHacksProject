import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'InvestmentData.dart';

class InvestmentView extends StatefulWidget {
  @override
  _InvestmentViewState createState() => _InvestmentViewState();
}

class InvestmentCategory {
  String name;
  List<InvestmentData> list;

  InvestmentCategory(this.name, this.list);
}

class _InvestmentViewState extends State<InvestmentView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Investment",
                style: TextStyle(
                    fontFamily: 'Avenir',
                    fontWeight: FontWeight.w600,
                    fontSize: 24),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: buildList(),
            )
          ],
        ),
      ),
    );
  }

  Widget buildList() {
    List<InvestmentCategory> titles = new List();
    List<InvestmentData> l0 = new List();
    List<InvestmentData> l1 = new List();
    List<InvestmentData> l2 = new List();
    List<InvestmentData> l3 = new List();
    List<InvestmentData> l4 = new List();
    List<InvestmentData> l5 = new List();

    l0.add(InvestmentData("GB3:GOV", "3 month US Government Bond", 95));
    l0.add(InvestmentData("APPLE 13/23", "Apple Inc. Bond", 93));
    l0.add(InvestmentData(
        "Fidelity NASDAQ Composite Index", "No minimum | 0.3%", 89));

    l2.add(InvestmentData("GB3:GOV", "3 month US Government Bond", 95));
    l2.add(InvestmentData("APPLE 13/23", "Apple Inc. Bond", 93));
    l2.add(InvestmentData("GB6:GOV", "6 month US Government Bond", 87));

    l3.add(InvestmentData(
        "Fidelity NASDAQ Composite Index", "No minimum | 0.3%", 89));
    l3.add(InvestmentData(
        "Vanguard Growth Index", "\$3,000 minimum | 0.17% return", 83));
    l3.add(InvestmentData(
        "Vanguard High Dividend Yield Index", "\$3,000 minimum | 0.15%", 79));

    l4.add(InvestmentData("CubeSmart", "+3.6%", 84));
    l4.add(InvestmentData("Crown Castle International", "+3.3%", 81));
    l4.add(InvestmentData("Equity LifeStyle Properties", "+1.8%", 78));

    l5.add(InvestmentData(
        "Fidelity ZERO Large Cap Index", "0% expense ratio", 73));
    l5.add(InvestmentData("Vanguard S&P 500 ETF", "0.04% expense ration", 71));
    l5.add(InvestmentData("SPDR S&P 500 ETF Trust", "0.09% expense ratio", 69));

    l1.add(InvestmentData("NIKE, Inc.", "+1.18%", 68));
    l1.add(InvestmentData("Starbucks Corporation", "+0.72%", 67));
    l1.add(InvestmentData("Apple Inc.", "-0.23%", 40));

    titles.add(InvestmentCategory("Recommended For You", l0));
    titles.add(InvestmentCategory("Stocks", l1));
    titles.add(InvestmentCategory("Bonds", l2));
    titles.add(InvestmentCategory("Mutual Funds", l3));
    titles.add(InvestmentCategory("REIT", l4));
    titles.add(InvestmentCategory("Index Funds", l5));

    return Column(
      children:
          titles.map((data) => investBlock(data.name, data.list)).toList(),
    );
  }

  // foreach(list) => {return list.title list.desc list.}
  Widget investBlock(String title, List<InvestmentData> l) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 5.0, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54),
                ),
                //icon

                Padding(
                  padding: const EdgeInsets.only(right:4.0),
                  child: Icon(FontAwesomeIcons.questionCircle,
                  color:Colors.black54),
                ),
              ],
            ),
          ),
          //random data
          investCard(l[0].name, l[0].description, l[0].points),
          investCard(l[1].name, l[1].description, l[1].points),
          investCard(l[2].name, l[2].description, l[2].points),
          seeMoreCard(),
        ],
      ),
    );
  }

  Widget investCard(title, description, points) {
    return Card(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width-126,
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
                getBoxRounded(points)
              ]),
        ),
      ),
    );
  }

  Widget getBoxRounded(int data) {
    return Container(
      padding: EdgeInsets.only(left: 12, top: 5, right: 12, bottom: 5),
      child: Text(
        data.toString() + "%",
        style: TextStyle(
          fontFamily: 'Avenir',
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: getColorBasedOnScore(data)),
    );
  }

  Widget seeMoreCard() {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Center(
        child: Text("See more...",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontFamily: 'Avenir',
              fontSize: 18,
            )),
      ),
    );
  }

  Color getColorBasedOnScore(int points) {
    if (points > 80) {
      return Colors.green;
    }
    if (points > 50) {
      return Colors.orange;
    }
    return Colors.red;
  }
}
