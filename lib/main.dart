import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'main_nav_screen/home_page.dart';
import 'main_nav_screen/jobpice.dart';
import 'package:task_to_isloo/jobs.dart';
import 'package:task_to_isloo/navigation_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(debugShowCheckedModeBanner: false,
      title: 'Task To Isloo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      // home: NavBottom(),
      home: MyNavigationBar(),
    );
  }
}

