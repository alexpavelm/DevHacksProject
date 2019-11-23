import 'package:flutter/material.dart';

class InvestmentView extends StatefulWidget {
  @override
  _InvestmentViewState createState() => _InvestmentViewState();
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
    List<String> titles = new List();
    titles.add("Google");
    titles.add("Facebook");
    titles.add("hardcoding is life");
    return Column(
      children: titles.map((data) => investBlock(data, data.length)).toList(),
    );
  }

  Widget investBlock(String title, int points) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title, style: TextStyle(fontFamily: 'Avenir', fontSize: 22, fontWeight: FontWeight.w500, color: Colors.black54),),
          investCard(title, points),
          investCard(title, points),
          investCard(title, points),
        ],
      ),
    );
  }
  Widget investCard(title, points) {
    return Card(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[Text(title, style: TextStyle(fontFamily: 'Avenir', fontSize: 18, fontWeight: FontWeight.w500),), Text(points.toString())],
          ),
        ),
      ),
    );
  }
}
