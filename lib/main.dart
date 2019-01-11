import 'package:flutter/material.dart';

import 'package:bank_ux/pages/asset.dart';
import 'package:bank_ux/pages/bank.dart';
import 'package:bank_ux/pages/consolidate.dart';
import 'pages/page_trans.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        backgroundColor: Colors.black,
        fontFamily: 'Kanit',
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 24.0, fontStyle: FontStyle.normal),
          body1: TextStyle(fontSize: 16.0),
          caption: TextStyle(fontSize: 14.0),
        ),
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  PageController pageController;
  int currentPage = 1;
  double page;

  final List<Widget> pages = [
    BankPage(0),
    ConsolidatePage(1),
    AssetPage(2),
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: currentPage,
      // viewportFraction: 0.5,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          if (notification is ScrollUpdateNotification) {
            setState(() {
              page = pageController.page;
              PageTransitionSubject().update(page);
              // print(page);
            });
          }
        },
        child: Column(
          children: <Widget>[
            Expanded(
              child: PageView.builder(
                itemCount: pages.length,
                controller: pageController,
                onPageChanged: (pos) {
                  setState(() {
                    // print('pageChanged $pos');
                    currentPage = pos;
                  });
                },
                itemBuilder: (context, index) {
                  // print('build $index');
                  return pages[index];
                },
              ),
            ),
            Text('${page == null ? 'nodata' : page.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}
