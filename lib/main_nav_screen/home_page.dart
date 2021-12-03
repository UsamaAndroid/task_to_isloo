import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task_to_isloo/tabs/all.dart';
import 'package:task_to_isloo/tabs/trailers.dart';

import '../tabs/cranes.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.9;
    double yourWidth = width / 3;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.amber,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Icon(
                  FontAwesomeIcons.search,
                  color: Colors.white,
                ),
              )
            ],
            title: Container(
              child: Text(
                'Listings',
                style: TextStyle(color: Colors.white),
              ),
            ),
            bottom: TabBar(
                labelColor: Colors.white,
                isScrollable: true,
                unselectedLabelColor: Colors.black,
                indicatorColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black12),
                labelPadding: EdgeInsets.symmetric(horizontal: 1.0),
                tabs: [
                  Container(
                    width: yourWidth,
                    height: 25,
                    child: Tab(
                      child: Text('All'),
                    ),
                  ),
                  Container(
                    width: yourWidth,
                    height: 25,
                    child: Tab(
                      child: Text('Cranes'),
                    ),
                  ),
                  Container(
                    width: yourWidth,
                    height: 25,
                    child: Tab(
                      child: Text('Trailers'),
                    ),
                  ),
                ]),
          ),
          body: TabBarView(
            children: <Widget>[All(), Cranes(), Trailers()],
          )),
    );
  }
}
