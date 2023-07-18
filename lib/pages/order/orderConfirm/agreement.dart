import 'package:flutter/material.dart';
import 'package:flutter_taozugong_app/common/config.dart';

class AgreementPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AgreementState();
}

class AgreementState extends State<AgreementPage> {
  bool selectFlag = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(top: 15, bottom: 15, left: 16, right: 16),
      color: GlobalColor.whiteWordColor,
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new GestureDetector(
              onTap: () {
                setState(() {
                  selectFlag = !selectFlag;
                });
              },
              child: selectFlag
                  ? new Container(
                      width: 20,
                      height: 20,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.blue),
                      child: Icon(
                        Icons.check,
                        size: 15.0,
                        color: Colors.white,
                      ))
                  : new Container(
                      width: 20,
                      height: 20,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: GlobalColor.rightIconColor),
                          shape: BoxShape.circle,
                          color: Colors.white),
                    )),
          new Container(
            child: new Text(
              '我已同意并同',
              style: TextStyle(fontSize: GlobalFont.fontSize12),
            ),
          ),
          new Container(
            child: new Text(
              '《小公公用户协议》',
              style: TextStyle(
                  fontSize: GlobalFont.fontSize12,
                  color: GlobalColor.baseColor),
            ),
          )
        ],
      ),
    );
  }
}
