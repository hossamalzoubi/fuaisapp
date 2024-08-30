import 'package:flutter/material.dart';
import 'package:inventory_managemen_fuais/constant.dart';

import '../components/home.dart';
import '../components/self_management.dart';
import '../helper/showdialog_exitapp.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    SelfManagement(),
    Text('Profile Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showMyDialog(context);
        return shouldPop ?? false; // Stay on page
      },
      child: Scaffold(
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: greyColor, width: 3.0))),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            selectedItemColor: textColor,
            unselectedItemColor: greyColor,
            iconSize: 30,
            backgroundColor: whiteColor,
            onTap: _onItemTapped,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.compare_arrows_rounded),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notification_add),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: '',
              ),
            ],
          ),
        ),
        body: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }

  
}
