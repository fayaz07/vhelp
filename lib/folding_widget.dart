import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class FoldingWidget extends StatefulWidget {

  String title;
  Widget content;

  _FoldingWidgetState __foldingWidgetState;

  void setTitleTextColor(Color color) {
    __foldingWidgetState._textColor = color;
  }

  void setTitleTextFontSize(double size) {
    __foldingWidgetState._fontSize = size;
  }

  void setTitleTextFontWeight(FontWeight fweight) {
    __foldingWidgetState._fontWeight = fweight;
  }

  void setCardBackgroundColor(Color color) {
    __foldingWidgetState._cardColor = color;
  }

  void setCardElevation(double elevation) {
    __foldingWidgetState._cardElevation = elevation;
  }

  FoldingWidget(this.title, this.content) {
    __foldingWidgetState = new _FoldingWidgetState(title, content);
  }

  @override
  State<StatefulWidget> createState() {
    return __foldingWidgetState;
  }
}

class _FoldingWidgetState extends State<FoldingWidget> {
  String title;
  Color _cardColor = Colors.white, _textColor = Colors.black;
  Widget content;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  var _icon = Icons.chevron_right;
  bool _showContent = false;

  double _cardElevation = 10.0, _fontSize = 18.0;
  FontWeight _fontWeight = FontWeight.w700;

  _FoldingWidgetState(this.title, this.content);

  Widget _getHeader() {
    return Padding(
      padding:
      EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0, bottom: 10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              '$title',
              style: TextStyle(
                  fontSize: _fontSize,
                  fontWeight: _fontWeight,
                  color: _textColor),
            ),
          ),
          Icon(_icon,color: Colors.white,)
        ],
      ),
    );
  }

  Widget _getContent() {
    if (_showContent)
      return Padding(
        padding: EdgeInsets.all(10.0),
        child: content,
      );
    else
      return Container();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          setState(() {

            if (_showContent) {
              _showContent = !_showContent;
              _icon = Icons.chevron_right;
            } else {
              _showContent = !_showContent;
              _icon = Icons.keyboard_arrow_down;
            }
          });
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 9.5 / 10,
                child: Card(
                    color: _cardColor,
                    elevation: _cardElevation,
                    child: SizedBox(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          _getHeader(),
                          _showContent
                              ? Divider(
                            height: 2.0,
                            color: Colors.black,
                          )
                              : Container(),
                          _getContent(),
                        ],
                      ),
                    )),
              ),
            )
          ],
        ));
  }
}