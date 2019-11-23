import 'package:flutter/material.dart';

class InvestmentView extends StatefulWidget {
  @override
  _InvestmentViewState createState() => _InvestmentViewState();
}

class _InvestmentViewState extends State<InvestmentView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Investments", style: TextStyle(fontFamily: 'Avenir', fontSize: 30, fontWeight: FontWeight.w500),)),
    );
  }
}
