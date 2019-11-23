import 'package:flutter/material.dart';

class InvestmentView extends StatefulWidget {
  @override
  _InvestmentViewState createState() => _InvestmentViewState();
}
class InvestmentData{
  String name;
  String description;
  int points;
  InvestmentData(this.name,this.description,this.points);
}
class _InvestmentViewState extends State<InvestmentView> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }

  Widget buildList() {
    List<InvestmentData> titles = new List();
    titles.add(InvestmentData("Google","desc Google",87));
    titles.add(InvestmentData("Facebook","desc Facebook",34));
    titles.add(InvestmentData("Apple","desc Apple",65));
    return Column(
      children: titles.map((data) => investBlock(data.name, data.points, data.description)).toList(),
    );
  }

  // foreach(list) => {return list.title list.desc list.}
  Widget investBlock(String title, int points, String desc) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontFamily: 'Avenir',
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Colors.black54),
          ),
          //random data
          investCard(title, "desc", points),
          investCard(title, "desc", points),
          investCard(title, "desc", points),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    Container(
                      alignment: Alignment(-1,0),
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
