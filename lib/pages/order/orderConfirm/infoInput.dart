// 姓名输入框
import 'package:flutter/material.dart';
import 'package:flutter_taozugong_app/common/config.dart';

Widget initInput(title, holder, controller) {
  return new Container(
    alignment: Alignment.centerLeft,
    padding: EdgeInsets.only(left: 20, right: 20),
    decoration: new BoxDecoration(
      border: Border(
        bottom: BorderSide(color: GlobalColor.backPageColor, width: 1),
      ),
    ),
    child: new Row(
      children: <Widget>[
        new Expanded(
          child: Container(
            alignment: Alignment.centerLeft,
            child: new Text(title),
          ),
          flex: 3,
        ),
        new Expanded(
          flex: 8,
          child: Container(
//                alignment: Alignment.centerRight,
              child: new TextField(
            controller: controller,
            textAlign: TextAlign.right,
            style: TextStyle(color: Colors.grey),
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: holder,
              hintStyle: TextStyle(color: Colors.grey, fontSize: 14.0),
            ),
          )),
        ),
      ],
    ),
  );
}
