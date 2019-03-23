import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vhelp/utils.dart';
import 'package:url_launcher/url_launcher.dart';

var _details = [
  GoverningBodyDataModel(
      name: 'KV Vishnu Raju',
      image: 'assets/kvvishnu.jpg',
      email: '',
      phone: '',
      description: 'This contains some description about our chairman'),
  GoverningBodyDataModel(
      name: 'KV Vishnu Raju',
      image: 'assets/kvvishnu.jpg',
      email: '',
      phone: '',
      description: 'This contains some description about our chairman'),
];

class GoverningBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GoverningBodyState();
  }
}

class _GoverningBodyState extends State<GoverningBody> {
  double _height, _width;

  Widget _getDetails() {
    return ListView.builder(
        itemCount: _details.length,
        itemBuilder: (BuildContext context, int id) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 500),
            child: Padding(
              padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: _getProfileModel(
                _details[id].image,
                _details[id].name,
                _details[id].description,
                _details[id].email,
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
    if (email.length == 0) {
      _bottom = Container();
    } else {
      _bottom = Container(
        height: 50.0,
        //color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 60.0, right: 60.0),
              child: InkWell(
                onTap: () {
                  launch("tel:+91 $phone");
                },
                child: Icon(
                  Icons.phone,
                  color: Colors.blue,
                  size: 30.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 60.0, right: 60.0),
              child: InkWell(
                onTap: () {
                  launch("mailto:$email?subject=Support Request&body=");
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
            CircleAvatar(
              radius: _height * 1 / 10,
              backgroundImage: AssetImage(image),
              backgroundColor: Colors.grey,
            ),
            SizedBox(
              height: 10.0,
            ),
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
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: _getDetails()
    );
  }
}

class GoverningBodyDataModel {
  String name, description, image, email, phone;

  GoverningBodyDataModel(
      {this.name, this.description, this.image, this.email, this.phone});
}
