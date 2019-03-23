import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vhelp/screens/about_us.dart';
import 'package:vhelp/screens/departments.dart';
import 'package:vhelp/screens/governing_body.dart';
import 'package:vhelp/screens/other_amenities.dart';

int _screenToBeShown = 0;

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  Widget _getAppBar() {
    return AppBar(
      title: Text('vHelp'),
      centerTitle: true,
    );
  }

  Widget _getHome() {
    switch(_screenToBeShown){
      case 0: return AboutUs();
      case 1: return GoverningBody();
      case 2: return Departments();
      case 3: return AboutUs();
      case 4: return OtherAmenities();

    }
  }

  Widget _getBottomNavBar() {
    var style = TextStyle(fontSize: 12.0);
    return BottomNavigationBar(
      onTap: (int i) {
        setState(() {
          _screenToBeShown = i;
        });
        print('$i tapped');
      },
      iconSize: 25.0,
      type: BottomNavigationBarType.shifting,
      currentIndex: _screenToBeShown,
      items: [
        BottomNavigationBarItem(backgroundColor: Colors.blue,icon: Icon(Icons.home), title: Text('Home',textAlign: TextAlign.center,style: style)),
        BottomNavigationBarItem(backgroundColor: Colors.blue,icon: ImageIcon(AssetImage('assets/governing_body.png')), title: Text('Governing body',textAlign: TextAlign.center,style: style)),
        BottomNavigationBarItem(backgroundColor: Colors.blue,icon: ImageIcon(AssetImage('assets/department.png')), title: Text('Departments',textAlign: TextAlign.center,style: style)),
        BottomNavigationBarItem(backgroundColor: Colors.blue,icon: ImageIcon(AssetImage('assets/administator.png')), title: Text('Administration',textAlign: TextAlign.center,style: style)),
        BottomNavigationBarItem(backgroundColor: Colors.blue,icon: ImageIcon(AssetImage('assets/other_amenities.png')), title: Text('Other amenities',textAlign: TextAlign.center,style: style)),
      ],
      fixedColor: Colors.blue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: _getHome(),
      bottomNavigationBar: _getBottomNavBar(),
    );
  }
}

/*

*************** Home **************
* About us

*************** Governing body ***************
* Principal
* Dean

************** Departments **************
* Placement cell
* Departments
* Research and Development
* Library

************* Other amenities *********
* Sports and Fitness
* Clubs
* Hostels
* Wellness center

************ Administration *************
* Examination Branch
* Accounts section
* Network & IT
* Transport

*/