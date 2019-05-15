import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vhelp/folding_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vhelp/utils.dart';

double _height, _width;

var _small = TextStyle(fontSize: 14.0, color: Colors.white);
var _large =
    TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.w800);

var _departments = [
  DepartmentsDataModel(
      deptName: 'Library', type: 'Library', desc: Data.libraryData),
  DepartmentsDataModel(
      deptName: 'Research and Development',
      type: 'Library',
      desc: Data.rNdData),
  DepartmentsDataModel(
      deptName: 'CSE',
      type: 'Branch',
      facultyPhones: Data.cse),
  DepartmentsDataModel(deptName: 'BME', type: 'Branch', facultyPhones: Data.bme),
  DepartmentsDataModel(deptName: 'MECHANICAL', type: 'Branch', facultyPhones: Data.mech),
  DepartmentsDataModel(deptName: 'BS & H', type: 'Branch', facultyPhones: Data.bsh),
  DepartmentsDataModel(deptName: 'MBA', type: 'Branch', facultyPhones: Data.mba),
  DepartmentsDataModel(deptName: 'BS & H', type: 'Branch', facultyPhones: Data.bsh),
  DepartmentsDataModel(deptName: 'CHE', type: 'Branch', facultyPhones: Data.che),
  DepartmentsDataModel(deptName: 'ECE', type: 'Branch', facultyPhones: Data.ece),
  DepartmentsDataModel(deptName: 'EEE', type: 'Branch', facultyPhones: Data.eee),
  DepartmentsDataModel(deptName: 'IT', type: 'Branch', facultyPhones: Data.it),
  DepartmentsDataModel(deptName: 'PHE', type: 'Branch', facultyPhones: Data.phe)
];

class Departments extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DepartmentsState();
  }
}

var colors = [Color(0xffec407a),Color(0xffef5350),Color(0xffab47bc),Color(0xff7e57c2)
            ,Color(0xff5c6bc0),Color(0xff42a5f5),Color(0xff26c6da),Color(0xff26a69a)
            ,Color(0xffffa726),
Color(0xffec407a),Color(0xffef5350),Color(0xffab47bc),Color(0xff7e57c2)
,Color(0xff5c6bc0),Color(0xff42a5f5),Color(0xff26c6da),Color(0xff26a69a)
,Color(0xffffa726)];


class _DepartmentsState extends State<Departments> {
  Widget _getBody() {
    return ListView.builder(
       scrollDirection: Axis.vertical,
        itemCount: _departments.length,
        itemBuilder: (BuildContext context, int id) {
          return _depUI(
              '${_departments[id].deptName}',
              _getContent(id),
              colors[id % _departments.length]);
        });
  }

  Widget _getContent(int id) {
    switch (_departments[id].type) {
      case 'Branch':
        var phones = json.decode(_departments[id].facultyPhones);
        List<FacultyDetailsDM> _faclist = [];
        //print(phones[0]['name']);

        for (var p in phones) {
          FacultyDetailsDM f =
              new FacultyDetailsDM(name: p['name'],email: p['email'],phone: p['phone']);
          _faclist.add(f);
          //print(f.email);
        }
        //print(_faclist.length);
        return Container(
          constraints: BoxConstraints(maxHeight: _height * 4 / 10),
//          child: ListView.builder(
//              itemCount: _faclist.length,
//              itemBuilder: (BuildContext context, int id) {
//                return Padding(
//                  padding: EdgeInsets.only(top: 3.0, bottom: 3.0),
//                  child: _getFacultyUI(_faclist[id].name, _faclist[id].email,
//                      _faclist[id].phone),
//                );
//              }),
        //  constraints: BoxConstraints(maxHeight: _height * 4 / 10),
          child: SingleChildScrollView(
          child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: buildContacts(_faclist)),
        ),
//            child: NestedScrollView(
//              headerSliverBuilder: (BuildContext ctx,bool value){
//                return buildContacts(_faclist);
//              },
//              body: Column(
//                    mainAxisSize: MainAxisSize.min,
//                    children: buildContacts(_faclist)),
//            ),
        );
      case 'Library':
        return Container(
         // constraints: BoxConstraints(maxHeight: _height * 4 / 10),
          child: SingleChildScrollView(
              child: Text(
            _departments[id].desc,
            textAlign: TextAlign.justify,
            style: TextStyle(color: Colors.white,fontSize: 18.0),
          )),
        );

      default: return Container();
    }
  }

  List<Widget> buildContacts(List<FacultyDetailsDM> facList){
    List<Widget> _listOfContacts = [];

    for(int i=0;i<facList.length;i++){
      _listOfContacts.add(Padding(
        padding: EdgeInsets.only(top: 3.0, bottom: 3.0),
        child: _getFacultyUI(facList[i].name, facList[i].email,
            facList[i].phone),
      ));
      //print('building contacts: ${facList[i].email}');
    }
    return _listOfContacts;
  }

  Widget _getFacultyUI(String name, String email, String phone) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
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
                  '$name',
                  style: _large,
                ),
              ),
              InkWell(
                onTap: () {
                  launch("tel:+91${phone.substring(0,5)}-${phone.substring(5,10)}");
                  print('call "tel:+91${phone.substring(0,5)}-${phone.substring(5,10)}"');
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 5.0,right: 5.0),
                  child: Icon(
                    Icons.phone,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  launch("mailto:$email");
                  print("mailto:$email");
                  canLaunch("mailto:$email").then((value){
                    print(value);
                  });
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 5.0,right: 5.0),
                  child: Icon(Icons.email, color: Colors.white, size: 30.0),
                ),
              )
            ],
          ),
//          SizedBox(
//            height: 10.0,
//          ),
//          Row(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              InkWell(
//                onTap: () {
//                  launch("tel:+91 $phone");
//                },
//                child: Padding(
//                  padding: EdgeInsets.only(left: 60.0, right: 60.0),
//                  child: Icon(
//                    Icons.phone,
//                    color: Colors.white,
//                    size: 30.0,
//                  ),
//                ),
//              ),
//              InkWell(
//                onTap: () {
//                  launch("mailto:$email?subject=Support Request&body=");
//                },
//                child: Padding(
//                  padding: EdgeInsets.only(left: 60.0, right: 60.0),
//                  child: Icon(Icons.email, color: Colors.white, size: 30.0),
//                ),
//              )
//            ],
//          ),
          Divider(
            color: Colors.white,
          )
        ],
      ),
    );
  }

  Widget _depUI(String title, Widget content, Color color) {
    FoldingWidget myWidget = new FoldingWidget(
        title,
        content);
    myWidget.setCardBackgroundColor(color);
    myWidget.setTitleTextColor(Colors.white);
    myWidget.setCardElevation(7.0);
    return Padding(
      key: Key(title),
      padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 5.0),
      child: Card(
        elevation: 8.0,
        color: color,
        child: ExpansionTile(
//        backgroundColor:,
            title: Text(title,style: TextStyle(color: Colors.white,fontSize: 18.0,fontWeight: FontWeight.w700),),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: content,
              )
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
      body: _getBody(),
    );
  }
}

class DepartmentsDataModel {
  String deptName, type, facultyPhones, desc;

  DepartmentsDataModel(
      {this.deptName, this.type, this.facultyPhones, this.desc});
}

class FacultyDetailsDM {
  String name, email, phone;

  FacultyDetailsDM({this.name, this.email, this.phone});
}

