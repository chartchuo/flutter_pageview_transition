import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
