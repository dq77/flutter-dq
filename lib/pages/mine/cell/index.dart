import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_taozugong_app/utils/utils.dart';
import 'package:flutter_taozugong_app/common/config.dart';

class MeCell extends StatelessWidget {
  final VoidCallback onPressed;
  final String iconName;
  final String title;

  MeCell({this.title, this.iconName, this.onPressed});

  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              height: ScreenUtil().setHeight(78.0),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: <Widget>[
                  // Image.asset(iconName),
                  // SizedBox(width: 20),
                  Text(title, style: TextStyle(fontSize: 18)),
                  Expanded(child: Container()),
                  Image.asset(Utils.getImgPath('arrow_right')),
                ],
              ),
            ),
            Container(
              height: 1,
              color: Color(0xFFEEEEEE),
              margin: EdgeInsets.only(left: 16.0, right:16.0),
            ),
          ],
        ),
      ),
    );
  }
}
