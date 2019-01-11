import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:bank_ux/components/widgets-lib.dart';
import 'page_trans.dart';

class AssetPage extends StatefulWidget {
  @override
  _AssetPageState createState() => _AssetPageState();
}

class _AssetPageState extends State<AssetPage> {
  @override
  Widget build(BuildContext context) {
    StreamBuilder<double> streamBuilder = StreamBuilder(
      stream: PageTransitionSubject().filter(2),
      builder: (context, snap) {
        if (snap.hasError) {
          return Text('Error!');
        } else if (snap.data == null) {
          return Text('nodata');
        } else {
          return Text('${snap.data}');
        }
      },
    );
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            bankColor.withAlpha(64),
            bankColor,
            assetColor,
            assetColor.withAlpha(192),
          ],
          begin: Alignment(-5, -1),
          end: Alignment(0, 1),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: <Widget>[
            buildTop(context),
            Center(
              child: streamBuilder,
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
