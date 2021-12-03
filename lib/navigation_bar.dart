import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'main_nav_screen/home_page.dart';
import 'main_nav_screen/jobpice.dart';

class MyNavigationBar extends StatefulWidget {
  MyNavigationBar({Key? key}) : super(key: key);

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    // Text('Home Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),

    Text('Profile',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    MyHomePage(),
    JobsPice(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
          bottomLeft: Radius.circular(12.0),
          bottomRight: Radius.circular(12.0),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.black54,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.white,
          onTap: _onItemTapped,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.userCircle),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.tools),
              label: 'Jobs',
            ),
          ],
        ),
      ),
    );
  }
}
