import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vhelp/utils.dart';

var style = TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0);

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/bvrit.png'),
            SizedBox(height: 10.0),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "${Data.aboutUsTitle}",
                style: Styles.heading,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 5.0, bottom: 10.0),
              child: Text(
                Data.aboutUs,
                textAlign: TextAlign.justify,
                style: Styles.description,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Wrap(
              direction: Axis.horizontal,
              children: <Widget>[
                Text(Data.rowText1,
                      textAlign: TextAlign.center, style: style),
                Container(
                  height: 30.0,
                  width: 1.0,
                  color: Colors.white30,
                  margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                ),
                Text(Data.rowText2, textAlign: TextAlign.center, style: style),
                Container(
                  height: 30.0,
                  width: 1.0,
                  color: Colors.white30,
                  margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                ),
                Text(Data.rowText3,
                        textAlign: TextAlign.center, style: style),
                Container(
                  height: 30.0,
                  width: 1.0,
                  color: Colors.white30,
                  margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                ),
                Text(Data.rowText4, textAlign: TextAlign.center, style: style),
              ],
            ),
            Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      Data.coursesOfferedTitle1,
                      style: Styles.heading,
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
                Divider(),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      Data.coursesOffered1,
                      style: Styles.description,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      Data.coursesOfferedTitle2,
                      style: Styles.heading,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                  ],
                ),
                Divider(),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      Data.coursesOffred2,
                      style: Styles.description,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.0,
                )
              ],
            ),
          ],
        )
      )
    );
  }
}
