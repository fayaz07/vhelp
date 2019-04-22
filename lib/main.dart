import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vhelp/home.dart';
import 'package:animated_splash/animated_splash.dart';

void main(){
//  runApp(
//    MaterialApp(
//      debugShowCheckedModeBanner: false,
//      home: VHelpSplash(),
//    )
//  );

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(
        imagePath: 'assets/vishnu.png',
        home: Home(),
        duringSplash: (){},
        duration: 2500),
  ));

}

// ignore: must_be_immutable
class VHelpSplash extends StatelessWidget{
  BuildContext _context;

  checkExistence(){
    Future.delayed(Duration(milliseconds: 2000)).then((v){
       Navigator.of(_context).pushReplacement(CupertinoPageRoute(
         builder: (BuildContext context) => Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    checkExistence();
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 250.0,
          child: Image.asset('assets/vishnu.png'),
        )
      )
    );
  }
}