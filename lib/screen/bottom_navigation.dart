import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:indieflix/screen/classroom.dart';
// import 'package:indieflix/screen/club_activity.dart';
import 'package:indieflix/screen/home.dart';
// import 'package:indieflix/screen/profile.dart';
// import 'package:indieflix/screen/quick_action.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Home(),
    Home(),
    // ClassRoom(),
    // QuickAction(),
    // ClubActivity(),
    // Profile()
  ];

  void _onItemTapped(int index) {
    if (index == 2) {
      return;
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 12,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box_outline_blank),
            label: 'SCAN',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'PROFILE',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xff073FCF),
        selectedFontSize: 12,
        onTap: _onItemTapped,
      ),
      floatingActionButton: Container(
        width: 100,
        height: 100,
        padding: const EdgeInsets.only(top: 40.0),
        child: FloatingActionButton(
          backgroundColor: const Color(0xffFAB530),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(Icons.qr_code_scanner),
              Text(
                "SCAN",
                style: TextStyle(color: Colors.white, fontSize: 10),
              )
            ],
          ),
          onPressed: () {},
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
