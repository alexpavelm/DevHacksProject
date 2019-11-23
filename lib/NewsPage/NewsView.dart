import 'package:flutter/material.dart';

class NewsView extends StatefulWidget {
  @override
  _NewsViewState createState() => _NewsViewState();
}

class InvestmentData {
  String name;
  String description;
  String image;

  InvestmentData(this.name, this.description, this.image);
}

class InvestmentCategory {
  String name;
  List<InvestmentData> list;

  InvestmentCategory(this.name, this.list);
}

class _NewsViewState extends State<NewsView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "News",
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

    l0.add(InvestmentData("How Do Financial Advisors Make Money?",
        "Yahoo Finance Yesterday", "top1.jpg"));
    l0.add(InvestmentData(
        "Head of the world’s largest hedge fund says report of a massive \$1 billion bet that the stock market will tumble by March is wrong",
        "Yahoo Finance 1 hour ago",
        "top2.jpg"));

    l2.add(InvestmentData(
        "Worried About a Bear Market? Bonds Pose More Danger Than Stocks.",
        "Barron's Yesterday",
        "bonds1.jpg"));
    l2.add(InvestmentData(
        "Ecuador Bonds Hit Record Low Amid Latin America’s Month of Chaos",
        "Bloomberg 5 days ago",
        "bonds2.jpg"));

    l3.add(InvestmentData(
        "Cboe Wants to Install a Speed Bump on a Stock Exchange. Wall Street Hates the Idea.",
        "Barron's 10 hours ago",
        "mutualfunds1.jpg"));
    l3.add(InvestmentData(
        "Avoid These 3 Mutual Fund Misfires - November 22, 2019",
        "Yahoo Finance Yesterday",
        "mutualfunds2.jpg"));

    l4.add(InvestmentData("The Only REIT Bargains Left On The Market",
        "Forbes 14 days ago", "reit1.jpg"));
    l4.add(InvestmentData("These 3 REITs Could Plunge In 2020",
        "Forbes 17 days ago", "reit2.jpg"));

    l5.add(InvestmentData("Index Funds That Pay Dividends",
        "TheStreet.com 5 days ago", "index1.jpg"));
    l5.add(InvestmentData(
        "China's index funds could grow ten-fold in a decade: Hua An",
        "Reuters 17 days ago",
        "index2.jpg"));

    l1.add(InvestmentData(
        "Investors are left to wonder if the stock market rally is resting or rolling over",
        "CNBC 7 hours ago",
        "stock1.png"));
    l1.add(InvestmentData(
        "Wall Street’s stock forecasters see just a 5% gain in 2020",
        "CNBC 7 hours ago",
        "stock2.png"));

    titles.add(InvestmentCategory("Top Stories", l0));
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
              ],
            ),
          ),
          //random data
          investCard(l[0].name, l[0].description, l[0].image),
          investCard(l[1].name, l[1].description, l[1].image),
          seeMoreCard(),
        ],
      ),
    );
  }

  Widget investCard(title, description, points) {
    return Card(
      child: Container(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: 240,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Container(
                        alignment: Alignment(-1, 0),
                        child: Text(
                          description,
                          style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 12,
                              fontWeight: FontWeight.w100),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              getImageWidget(points)
            ]),
      ),
    );
  }

  Widget getImageWidget(String data) {
    return Container(
      width: 100,
      height: 100,
      child: Image.asset("assets/images/" + data, fit: BoxFit.cover),
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

}
