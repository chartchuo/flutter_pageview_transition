import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

import 'package:bank_ux/components/widgets-lib.dart';

class BankPage extends StatefulWidget {
  @override
  _BankPageState createState() => _BankPageState();
}

class _BankPageState extends State<BankPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            bankColor.withAlpha(64),
            bankColor,
            assetColor,
            assetColor.withAlpha(128),
          ],
          begin: Alignment(-1, -1),
          end: Alignment(4, 1),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: <Widget>[
            buildTop(context),
            Center(
              child: Text('Page 2'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTop(BuildContext context) {
    return Column(
      children: <Widget>[
        MyCard(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'สินทรัพย์รวม',
                style: Theme.of(context).textTheme.caption,
              ),
              CurrencyText(-9876543210.75, xlarge: true),
              buildChart(),
              SizedBox(height: 40),
            ],
          ),
        ),
      ],
    );
  }

  var data = [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0];
  Widget buildChart() {
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
