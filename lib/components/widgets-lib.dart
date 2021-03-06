import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

final Color bankColor = Color.fromARGB(255, 9, 154, 200);
final Color assetColor = Color.fromARGB(255, 80, 66, 128);

class MyCard extends StatelessWidget {
  final Widget child;

  const MyCard({
    Key key,
    this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black26,
      ),
      child: child,
    );
  }
}

class CurrencyText extends StatelessWidget {
  final double amount;
  final bool large;
  final bool xlarge;
  final bool small;
  const CurrencyText(
    this.amount, {
    this.large = false,
    this.xlarge = false,
    this.small = false,
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    final i = new NumberFormat("#,##0.00", "th_TH");
    return Text(
      "${i.format(amount)} ฿",
      style: large
          ? textTheme.title
          : small
              ? textTheme.caption
              : xlarge ? textTheme.headline : textTheme.body1,
    );
  }
}

class MyText extends StatelessWidget {
  final String txt;
  final bool large;
  final bool xlarge;
  final bool small;
  const MyText(
    this.txt, {
    this.large = false,
    this.xlarge = false,
    this.small = false,
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Text(
      txt,
      style: large
          ? textTheme.title
          : small
              ? textTheme.caption
              : xlarge ? textTheme.headline : textTheme.body1,
    );
  }
}

class TimeText extends StatelessWidget {
  final String txt;
  final bool large;
  final bool xlarge;
  final bool small;
  const TimeText(
    this.txt, {
    this.large = false,
    this.xlarge = false,
    this.small = false,
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Text(
      txt,
      style: TextStyle(
        fontFamily: 'OpenSansCondensed',
        fontSize: large
            ? textTheme.title.fontSize
            : small
                ? textTheme.caption.fontSize
                : xlarge
                    ? textTheme.headline.fontSize
                    : textTheme.body1.fontSize,
      ),
    );
  }
}

class MockListView extends StatelessWidget {
  const MockListView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        date(),
        listItem(),
        listItem(),
        date(),
        listItem(),
        listItem(),
        listItem(),
        listItem(),
        listItem(),
        listItem(),
        date(),
        listItem(),
        listItem(),
        listItem(),
        listItem(),
        listItem(),
        listItem(),
        listItem(),
        listItem(),
      ],
    );
  }

  Widget listItem() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(2, 0, 2, 2),
      child: MyCard(
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 75,
                child: TimeText('20:00', large: true),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MyText('xxxxxxxxxxxx'),
                    MyText('xxxxxxxxxxxx', small: true),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  CurrencyText(10000),
                  MyText('xxxxxxxx', small: true),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget date() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 12, 4, 0),
      child: Text('12/30/2556'),
    );
  }
}

class MockChart extends StatelessWidget {
  final List<double> data = [
    0.0,
    1.0,
    1.5,
    2.0,
    0.0,
    0.0,
    -0.5,
    -1.0,
    -0.5,
    0.0,
    1.0,
    1.5,
    2.0,
    0.0,
    0.0,
    -0.5,
    -1.0,
    -0.5,
    0.0
  ];

  @override
  Widget build(BuildContext context) {
    return Sparkline(
      data: data,
      lineColor: Colors.white54,
      fillMode: FillMode.below,
      fillGradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.white30,
          Colors.transparent,
        ],
      ),
    );
  }
}
