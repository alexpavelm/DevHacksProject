import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../Global.dart';

class InvestmentsList extends StatefulWidget {
  @override
  _InvestmentsListState createState() => _InvestmentsListState();
}

class _InvestmentsListState extends State<InvestmentsList> {
  var global = Global();

  @override
  Widget build(BuildContext context) {
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
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text(item.name + " sold, " + profit.toStringAsPrecision(2) + "RON profit made", textAlign: TextAlign.center,)));
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
              child: investCard(global.invested[index].name, item.description, item.currentPrice),
            );
          },
        ),
      ),
    );
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
                  "£" + sum.toString(),
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
}
