import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vhelp/custom_navbar.dart';
import 'package:vhelp/screens/about_us.dart';
import 'package:vhelp/screens/administration.dart';
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

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animController;

  @override
  void initState() {
    super.initState();
    animController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 500));
    animation = Tween(begin: 0.0, end: 1.0).animate(animController);
    animController.forward();
  }

  Widget _getAppBar() {
    return AppBar(
      title: Text('vHelp'),
      centerTitle: true,
    );
  }

  Widget _getHome(int sc) {
   // print(animation.value);
    switch (sc) {
      case 0:
        return AboutUs();
      case 1:
        return GoverningBody();
      case 2:
        return Departments();
      case 3:
        return Administration();
      case 4:
        return OtherAmenities();
      default:
        return Container();
    }
  }

  Widget _getBottomNavBar() {
    var style = TextStyle(fontSize: 12.0);
    /*return CustomNavBar(
      unSelectedColor: Colors.grey,
      selectedIndex: 0,
      selectedColor: Colors.blue,
      iconSize: 24.0,
      onChanged: (int i){
        setState(() {
          _screenToBeShown = i;
          animController.reset();
          animController.forward();
          // print(animation.value);
        });
      },
      items: [
        CustomNavBarItem(Icons.home, 'Home'),
        CustomNavBarItem(Icons.home, 'Governing Body'),
        CustomNavBarItem(Icons.home, 'Departments'),
        CustomNavBarItem(Icons.home, 'Administration'),
        CustomNavBarItem(Icons.home, 'Other amenities'),
      ],
    );
*/


    return BottomNavigationBar(
      onTap: (int i) {
        setState(() {
          _screenToBeShown = i;
          animController.reset();
          animController.forward();
         // print(animation.value);
        });

//        print('$i tapped');
      },
      iconSize: 25.0,
      type: BottomNavigationBarType.fixed,
      currentIndex: _screenToBeShown,
      items: [
        BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(Icons.home),
            title: Text('Home', textAlign: TextAlign.center, style: style)),
        BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: ImageIcon(AssetImage('assets/governing_body.png')),
            title: Text('Governing body',
                textAlign: TextAlign.center, style: style)),
        BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: ImageIcon(AssetImage('assets/department.png')),
            title:
                Text('Departments', textAlign: TextAlign.center, style: style)),
        BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: ImageIcon(AssetImage('assets/administator.png')),
            title: Text('Administration',
                textAlign: TextAlign.center, style: style)),
        BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: ImageIcon(AssetImage('assets/other_amenities.png')),
            title: Text('Other amenities',
                textAlign: TextAlign.center, style: style)),
      ],
      fixedColor: Colors.blue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: AnimatedBuilder(
          animation: animController,
          builder: (BuildContext ctx, Widget widget) {
            return Opacity(
              opacity: animation.value,
              child: _getHome(_screenToBeShown),
            );
          }),
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
