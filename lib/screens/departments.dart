import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:folding_widget/folding_widget.dart';

double _height, _width;

var _departments = [
  DepartmentsDataModel(
      deptName: 'CSE',
      type: 'Branch',
      facultyPhones:
          '[{"name": "fayaz","phone": "9502039079","email": "fayazfz07@gmail.com"},{"name": "fayaz","phone": "9502039079","email": "fayazfz07@gmail.com"}]'),
  DepartmentsDataModel(
      deptName: 'CSE',
      type: 'Branch',
      facultyPhones:
      '[{"name": "fayaz","phone": "9502039079","email": "fayazfz07@gmail.com"},{"name": "fayaz","phone": "9502039079","email": "fayazfz07@gmail.com"}]')
];

class Departments extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DepartmentsState();
  }
}

var colors = [
  Colors.redAccent,
  Colors.blueAccent,
];

class _DepartmentsState extends State<Departments> {

  Widget _getBody() {
    return ListView.builder(
        itemCount: _departments.length,
        itemBuilder: (BuildContext context, int id) {
          return _depUI('${_departments[id].deptName}', _getContent(id), colors[id]);
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
        print(_faclist.length);
        return Container(
          constraints: BoxConstraints(maxHeight: _height * 4 / 10),
          child: ListView.builder(
              itemCount: _faclist.length,
              itemBuilder: (BuildContext context,int id){
                return Padding(
                  padding: EdgeInsets.only(top: 3.0,bottom: 3.0),
                  child: _getFacultyUI(_faclist[id].name, _faclist[id].email, _faclist[id].phone),
                );
              }
          ),
        );
    };
  }

  Widget _getFacultyUI(String name,String email,String phone){
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Name'),
          Text('$name'),
          Text('Email'),
          Text('$email'),
          Text('Phone'),
          Text('$phone'),
        ],
      ),
    );
  }

  Widget _depUI(String title, Widget content, Color color) {
    FoldingWidget myWidget = new FoldingWidget(title, content);
    myWidget.setCardBackgroundColor(color);
    myWidget.setTitleTextColor(Colors.white);

    return myWidget;
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
  String deptName, type, facultyPhones;

  DepartmentsDataModel({this.deptName, this.type, this.facultyPhones});
}

class FacultyDetailsDM {
  String name, email, phone;

  FacultyDetailsDM(this.name, this.email, this.phone);
}
