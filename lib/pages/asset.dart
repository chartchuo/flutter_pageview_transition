import 'package:flutter/material.dart';
import 'package:bank_ux/components/widgets-lib.dart';
import 'page_trans.dart';

class AssetPage extends StatelessWidget {
  const AssetPage(
    this.pageid, {
    Key key,
  }) : super(key: key);

  final double pageid;

  @override
  Widget build(BuildContext context) {
    StreamBuilder<double> streamBuilder = StreamBuilder(
      stream: PageTransitionSubject().filter(2),
      builder: (context, snap) {
        if (snap.hasError) {
          return SizedBox();
        } else if (snap.data == null) {
          return SizedBox();
        } else {
          return SizedBox(
            height: (snap.data - pageid).abs() * 1000,
          );
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
            streamBuilder,
            Expanded(
              child: MockListView(),
            )
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
              MockChart(),
              SizedBox(height: 40),
            ],
          ),
        ),
      ],
    );
  }
}
