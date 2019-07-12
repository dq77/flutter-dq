import 'package:flutter/material.dart';
import 'package:flutter_taozugong_app/common/config.dart';

class Explain extends StatefulWidget {
  Explain({Key key}) : super(key: key);

  _ExplainState createState() => _ExplainState();
}

class _ExplainState extends State<Explain> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          popUpTitle('运费说明'),
          divider(),
          Container(
            padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 10.0),
            alignment: Alignment.centerLeft,
            child: Text('不配送地区包括:新疆、西藏、青海、宁夏等地区'),
          )
        ],
      ),
    );
  }

  Widget popUpTitle(String title) {
    return Stack(children: <Widget>[
      Container(
          alignment: Alignment.center,
          height: 50.0,
          child: Text(title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0))),
      Positioned(
        right: 8.0,
        top: 15.0,
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.close),
        ),
      )
    ]);
  }

  Widget divider() {
    return new Container(
        margin: EdgeInsets.all(0.0), height: 1, color: Color(0xffebebeb));
  }
}
