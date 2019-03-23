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
      facultyPhones:
          '[{"name": "Faculty","phone": "9502039079","email": "fayazfz07@gmail.com"}]'),
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

var colors = Colors.accents;

class _DepartmentsState extends State<Departments> {
  Widget _getBody() {
    return ListView.builder(
        itemCount: _departments.length,
        itemBuilder: (BuildContext context, int id) {
          return _depUI('${_departments[id].deptName}', _getContent(id),
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
              new FacultyDetailsDM(p['name'], p['email'], p['phone']);
          _faclist.add(f);
        }
        //print(_faclist.length);
        return Container(
          constraints: BoxConstraints(maxHeight: _height * 4 / 10),
          child: ListView.builder(
              itemCount: _faclist.length,
              itemBuilder: (BuildContext context, int id) {
                return Padding(
                  padding: EdgeInsets.only(top: 3.0, bottom: 3.0),
                  child: _getFacultyUI(_faclist[id].name, _faclist[id].email,
                      _faclist[id].phone),
                );
              }),
        );
      case 'Library':
        return Container(
          constraints: BoxConstraints(maxHeight: _height * 4 / 10),
          child: SingleChildScrollView(
              child: Text(
            _departments[id].desc,
            textAlign: TextAlign.justify,
            style: TextStyle(color: Colors.white),
          )),
        );
    }
    ;
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
              Text(
                '$name',
                style: _large,
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: () {
                  launch("tel:+91 $phone");
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 60.0, right: 60.0),
                  child: Icon(
                    Icons.phone,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  launch("mailto:$email?subject=Support Request&body=");
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 60.0, right: 60.0),
                  child: Icon(Icons.email, color: Colors.white, size: 30.0),
                ),
              )
            ],
          ),
          Divider(
            color: Colors.white,
          )
        ],
      ),
    );
  }

  Widget _depUI(String title, Widget content, Color color) {
    FoldingWidget myWidget = new FoldingWidget(title, content);
    myWidget.setCardBackgroundColor(color);
    myWidget.setTitleTextColor(Colors.white);
    myWidget.setCardElevation(7.0);
    return Padding(
      padding: EdgeInsets.only(
        top: 10.0,
      ),
      child: myWidget,
    );
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: _getBody(),
      bottomNavigationBar: SizedBox(height: 30.0,),
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

  FacultyDetailsDM(this.name, this.email, this.phone);
}

