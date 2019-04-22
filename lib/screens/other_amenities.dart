import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vhelp/utils.dart';

double _height;

var list = [
  OtherDataModel(
      name: 'Ambulance',
      desc: Data.ambulanceData,
      image: 'assets/ambulance.jpg'),
  OtherDataModel(name: "CLUBS", desc: Data.clubsData),
  OtherDataModel(name: "Boating Club", desc: Data.boatClub),
  OtherDataModel(name: "English Reader\'s club", desc: Data.erc),
  OtherDataModel(name: "Media Club", desc: Data.media),
  OtherDataModel(name: "Cultural Club", desc: Data.cultural)

];

class OtherAmenities extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OtherAmenitiesState();
  }
}

class _OtherAmenitiesState extends State<OtherAmenities> {
  Widget _getUI(int id) {
    return Column(
      children: <Widget>[
        list[id].image == null
            ? SizedBox(
          height: 3.0,
        ) : SizedBox(
          height: 150.0,
          child: Image.asset(list[id].image),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          list[id].name,
          style: Styles.pictureHeading,
        ),
        SizedBox(
          height: 10.0,
        ),
        Row(
            children: <Widget>[
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Text(
                  '${list[id].desc}',
                  style: Styles.description,
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
            ]
        ),
        SizedBox(
          height: 15.0,
        )
      ],
    );
  }

  Widget _getBody() {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int id) {
          return Card(
              margin: EdgeInsets.all(10.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
              elevation: 7.0,
              child: SingleChildScrollView(child: _getUI(id)));
        });
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      body: _getBody(),
    );
  }
}

class OtherDataModel {
  String name, desc, image;

  OtherDataModel({this.name, this.desc, this.image});
}
