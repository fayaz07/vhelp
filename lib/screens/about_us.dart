import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vhelp/utils.dart';



class AboutUs extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AboutUsState();
  }
}

class _AboutUsState extends State<AboutUs> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/bvrit.png'),
            SizedBox(height: 10.0),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(Data.aboutUsTitle,style: Styles.heading,),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0,right: 20.0,top: 5.0,bottom: 10.0),
              child: Text(Data.aboutUs,textAlign:TextAlign.justify,style: Styles.description,),
            ),
          ],
        )),
      ),
    );
  }
}
