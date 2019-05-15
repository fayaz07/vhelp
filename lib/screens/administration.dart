import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vhelp/utils.dart';
import 'package:url_launcher/url_launcher.dart';

double _height,_width;

var _details = [
  AdminDm(
      name: 'Mr. M Kantha Rao',
      phone: '9949433570',
      desc: 'Deputy General Manager'),
  AdminDm(
      name: 'Mr. K S S Sp Raju',
      phone: '9177882500',
      desc: 'Accounts Officer'),
  AdminDm(
      name: 'Mrs. A Laxmi',
      phone: '99848659090',
      desc: 'Accounts Officer'),
  AdminDm(
      name: 'Mr. Shiva Shankar Reddy',
      phone: '9494821012',
      desc: 'Accountant'),
];



class Administration extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _AdminState();
  }
}

class _AdminState extends State<Administration>{



  Widget _getDetails() {
    return ListView.builder(
        itemCount: _details.length,
        itemBuilder: (BuildContext context, int id) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 500),
            child: Padding(
              padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: _getProfileModel(
                '',
                _details[id].name,
                _details[id].desc,
                '',
                _details[id].phone,
              ),
            ),
            padding: EdgeInsets.all(10.0),
            curve: Curves.easeInOutCirc,
          );
        });
  }

  Widget _getProfileModel(
      String image, String name, String desc, String email, String phone) {
    Widget _bottom;
    if (phone.length == 0) {
      _bottom = Container();
    } else {
      _bottom = Container(
        height: 50.0,
        //color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 30.0, right: 30.0),
              child: InkWell(
                onTap: () {
                  launch("tel:+91${phone.substring(0,5)}-${phone.substring(5,10)}");
                },
                child: Icon(
                  Icons.phone,
                  color: Colors.blue,
                  size: 30.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.0, right: 30.0),
              child: InkWell(
                onTap: () {
                  launch("mailto:$email");
                },
                child: Icon(Icons.email, color: Colors.blue, size: 30.0),
              ),
            )
          ],
        ),
      );
    }

    return SizedBox(
      width: _width * 9 / 10,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        elevation: 8.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
           /* CircleAvatar(
              radius: _height * 1 / 10,
              backgroundImage: AssetImage('assets/admin.png'),
              backgroundColor: Colors.grey,
            ),
            SizedBox(
              height: 10.0,
            ),*/
            Text(
              name,
              textAlign: TextAlign.center,
              style: Styles.pictureHeading,
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Text(
                desc,
                textAlign: TextAlign.center,
                style: Styles.pictureDescription,
              ),
            ),
            email.length != 0
                ? Divider()
                : SizedBox(
              height: 10.0,
            ),
            _bottom
          ],
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height= MediaQuery.of(context).size.height;

    return Scaffold(
      body: _getDetails(),
    );
  }
}

class AdminDm{
  String name,phone,desc;

  AdminDm({this.name, this.phone, this.desc});

}