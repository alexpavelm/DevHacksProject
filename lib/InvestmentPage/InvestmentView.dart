import 'package:auto_size_text/auto_size_text.dart';
import 'package:devhacks_app/InvestmentPage/InvestedData.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'InvestmentData.dart';
import 'package:devhacks_app/Global.dart';

import 'package:devhacks_app/LearnPage/LearnView.dart';
import 'package:devhacks_app/LearnPage/models/QuestionAnswer.dart';

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
  List<InvestmentData> _moreList = new List();
  final myController = TextEditingController();
  int i = Global().counterList;

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
    List<InvestmentData> l6 = new List();

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
    l5.add(InvestmentData("Vanguard S&P 500 ETF", "0.04% expense ratio", 71));
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
    //titles.add(InvestmentCategory("ETF", l6));

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
                  padding: const EdgeInsets.only(right: 4.0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LearnView(Question.qLearn),
                        ),
                      );
                    },
                    icon: Icon(FontAwesomeIcons.questionCircle,
                        color: Colors.black54),
                  ),
                ),
              ],
            ),
          ),
          //random data
          investCard(l[0].name, l[0].description, l[0].points),
          investCard(l[1].name, l[1].description, l[1].points),
          investCard(l[2].name, l[2].description, l[2].points),
          InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ScrollingListViewInvestments(title)),
                );
              },
              child: seeMoreCard()),
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
                  width: MediaQuery.of(context).size.width - 142,
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

  Widget ScrollingListViewInvestments(String title) {
    return Scaffold(
      body: SafeArea(child: _buildSuggestions(title)),
    );
  }

  Widget _buildSuggestions(title) {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i == 0) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                    fontFamily: 'Avenir',
                    fontWeight: FontWeight.w600,
                    fontSize: 24),
              ),
            );
          }
          if (i >= _moreList.length) {
            _moreList.addAll(generateInvestmentData().take(2)); /*4*/
          }
          return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          launchStatsWindow(_moreList[i].name)),
                );
              },
              child: investCard(_moreList[i].name, _moreList[i].description,
                  _moreList[i].points));
        });
  }

  Iterable<InvestmentData> generateInvestmentData() sync* {
    while (true) {
      switch (i) {
        case 0:
          InvestmentData a =
              InvestmentData("Apple Inc.", "No minimum | 0.3%", 89);
          yield a;
          i = (++i % 20);
          break;
        case 1:
          InvestmentData a =
              InvestmentData("Apple2 Inc.", "No minimum | 0.3%", 89);
          yield a;
          i = (++i % 20);
          break;
        case 2:
          InvestmentData a =
              InvestmentData("Apple2 Inc.", "No minimum | 0.3%", 89);
          yield a;
          i = (++i % 20);
          break;
        case 3:
          InvestmentData a =
              InvestmentData("Apple3 Inc.", "No minimum | 0.3%", 89);
          yield a;
          i = (++i % 20);
          break;
        case 4:
          InvestmentData a =
              InvestmentData("Apple4 Inc.", "No minimum | 0.3%", 89);
          yield a;
          i = (++i % 20);
          break;
        case 5:
          InvestmentData a =
              InvestmentData("Apple5 Inc.", "No minimum | 0.3%", 89);
          yield a;
          i = (++i % 20);
          break;
        case 6:
          InvestmentData a =
              InvestmentData("Apple6 Inc.", "No minimum | 0.3%", 89);
          yield a;
          i = (++i % 20);
          break;
        case 7:
          InvestmentData a =
              InvestmentData("Apple7 Inc.", "No minimum | 0.3%", 89);
          yield a;
          i = (++i % 20);
          break;
        case 8:
          InvestmentData a =
              InvestmentData("Apple8 Inc.", "No minimum | 0.3%", 89);
          yield a;
          i = (++i % 20);
          break;
        case 9:
          InvestmentData a =
              InvestmentData("Apple9 Inc.", "No minimum | 0.3%", 89);
          yield a;
          i = (++i % 20);
          break;
        case 10:
          InvestmentData a =
              InvestmentData("Apple10 Inc.", "No minimum | 0.3%", 89);
          yield a;
          i = (++i % 20);
          break;
        case 11:
          InvestmentData a =
              InvestmentData("Apple11 Inc.", "No minimum | 0.3%", 89);
          yield a;
          i = (++i % 20);
          break;
        default:
          InvestmentData a =
              InvestmentData("AppleD Inc.", "No minimum | 0.3%", 89);
          yield a;
          i = (++i % 20);
      }
      InvestmentData a = InvestmentData("Apple Inc.", "No minimum | 0.3%", 89);
      yield a;
    }
  }

  Widget launchStatsWindow(name) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  name,
                  style: TextStyle(
                      fontFamily: 'Avenir',
                      fontWeight: FontWeight.w600,
                      fontSize: 24),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildBuyWindow(name),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBuyWindow(name) {
    int price = 174;
    return Column(children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("\$" + price.toString(),
                  style: TextStyle(
                      fontFamily: 'Avenir',
                      fontWeight: FontWeight.w600,
                      fontSize: 24)),
              InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => CustomDialog(
                              title: "Apple Inc.",
                              description: "-0.24%",
                              buttonText: price.ceilToDouble(),
                            ));
                  },
                  child: getBuyBox("Invest"))
            ]),
      ),
      getImageWidget("graph.png"),
      getNewsInfoPage(name),
    ]);
  }

  Widget getBuyBox(String data) {
    return Container(
        padding: EdgeInsets.only(left: 12, top: 5, right: 12, bottom: 5),
        child: Text(
          data,
          style: TextStyle(
            fontFamily: 'Avenir',
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.green,
        ));
  }

  Widget getImageWidget(String data) {
    return Container(
      width: MediaQuery.of(context).size.width - 10,
      height: 200,
      child: Image.asset(
        "assets/images/" + data,
        scale: 0.45,
      ),
    );
  }

  Widget getNewsInfoPage(name) {
    List<InvestmentDataNews> list1 = new List();
    List<InvestmentCategoryNews> titles = new List();
    list1.add(InvestmentDataNews(
        "Apple expands in Austin",
        "Apple NewsRoom 4 days ago",
        "apple1.jpg",
        "https://www.apple.com/newsroom/2019/11/apple-expands-in-austin/"));
    list1.add(InvestmentDataNews(
        "Apple pulls all customer reviews from online Apple Store",
        "AppleInsider 3 days ago",
        "apple2.jpg",
        "https://appleinsider.com/articles/19/11/21/apple-pulls-all-customer-reviews-from-online-apple-store"));
    list1.add(InvestmentDataNews(
        "This Will Be Apple's Biggest Growth Driver (Hint: It's Not the iPhone)",
        "The Motley Fool 2 days ago",
        "apple3.jpg",
        "https://www.fool.com/investing/2019/11/22/this-will-be-apples-biggest-growth-driver-going-fo.aspx"));
    list1.add(InvestmentDataNews(
        "Microsoft and Apple are better together",
        "ComputerWorld 2 days ago",
        "apple4.jpg",
        "https://www.computerworld.com/article/3455229/microsoft-and-apple-are-better-together.html"));
    titles.add(InvestmentCategoryNews("Apple", list1));
    return investBlockNews(titles[0].name, titles[0].list);
  }

  Widget investBlockNews(String title, List<InvestmentDataNews> l) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 5.0, bottom: 5, top: 10),
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
          investCardNews(l[0].name, l[0].description, l[0].image, l[0].url),
          investCardNews(l[1].name, l[1].description, l[1].image, l[1].url),
          investCardNews(l[2].name, l[2].description, l[2].image, l[2].url),
          investCardNews(l[3].name, l[3].description, l[3].image, l[3].url),
          seeMoreCardNews(),
        ],
      ),
    );
  }

  Widget investCardNews(title, description, points, url) {
    return InkWell(
      onTap: () {
        _launchURL(url);
      },
      child: Card(
        child: Container(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 164,
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
                getImageWidgetNews(points)
              ]),
        ),
      ),
    );
  }

  Widget getImageWidgetNews(String data) {
    return Container(
      width: 100,
      height: 100,
      child: Image.asset("assets/images/" + data, fit: BoxFit.cover),
    );
  }

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget seeMoreCardNews() {
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

  Widget launchBuyWindow(name, price) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Invest",
                  style: TextStyle(
                      fontFamily: 'Avenir',
                      fontWeight: FontWeight.w600,
                      fontSize: 24),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _launchBuyWindowHelper(name, price),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _launchBuyWindowHelper(name, price) {
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: TextField(
            decoration: new InputDecoration(labelText: "How Much?"),
            keyboardType: TextInputType.number,
          ),
        ),
        getBuyBoxLarge("Buy"),
      ]),
    );
  }

  Widget getBuyBoxLarge(String s) {
    return Container(
        padding: EdgeInsets.only(left: 12, top: 5, right: 12, bottom: 5),
        child: Text(
          s,
          style: TextStyle(
            fontFamily: 'Avenir',
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.green,
        ));
  }
}

class InvestmentDataNews {
  String name;
  String description;
  String image;
  String url;

  InvestmentDataNews(this.name, this.description, this.image, this.url);
}

class InvestmentCategoryNews {
  String name;
  List<InvestmentDataNews> list;

  InvestmentCategoryNews(this.name, this.list);
}

class CustomDialog extends StatelessWidget {
  final String title, description;
  final double buttonText;
  final Image image;
  final myController = TextEditingController();

  CustomDialog({
    @required this.title,
    @required this.description,
    @required this.buttonText,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.padding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        //...bottom card part,
        Container(
          padding: EdgeInsets.only(
            top: Consts.avatarRadius + Consts.padding,
            bottom: Consts.padding,
            left: Consts.padding,
            right: Consts.padding,
          ),
          margin: EdgeInsets.only(top: Consts.avatarRadius),
          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(Consts.padding),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              //here modify with my row
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: TextField(
                    controller: myController,
                    decoration: new InputDecoration(labelText: "How Much?"),
                    keyboardType: TextInputType.number,
                  ),
                ),
                InkWell(
                    onTap: () {
                      Global().money -= int.parse(myController.text);
                      InvestedData a = InvestedData(
                          title, description, buttonText, buttonText);
                      Global().invested.add(a);
                      Navigator.of(context).pop(); // To close the dialog
                    },
                    child: getBuyBoxLarge("Buy")),
              ]),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  onPressed: () {},
                  child: Text(""),
                ),
              ),
            ],
          ),
        ),
        //...top circlular image part,
      ],
    );
  }

  Widget getBuyBoxLarge(String s) {
    return Container(
        padding: EdgeInsets.only(left: 12, top: 5, right: 12, bottom: 5),
        child: Text(
          s,
          style: TextStyle(
            fontFamily: 'Avenir',
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.green,
        ));
  }
}

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}
