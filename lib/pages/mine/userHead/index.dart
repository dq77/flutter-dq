import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_taozugong_app/utils/utils.dart';
import 'package:flutter_taozugong_app/routers/application.dart';

class UserHead extends StatefulWidget {
  UserHead({Key key}) : super(key: key);

  _UserHeadState createState() => _UserHeadState();
}

class _UserHeadState extends State<UserHead> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () { 
        print('你点击了头像');
        Application.router.navigateTo(context,"/login",transition: TransitionType.inFromBottom);
      },
      child: Container(
          height: ScreenUtil().setHeight(200.0),
          width: ScreenUtil().setWidth(750.0),
          decoration: new BoxDecoration(
            // border: new Border.all(width: 2.0, color: Colors.red),
            // color: Colors.grey,
            image: new DecorationImage(
              image: new ExactAssetImage(Utils.getImgPath('user/user-bg')),
              centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ListTile(
                leading: ImgHead(
                    'http://avaimg.nosdn0.126.net/avaimg/WmRPU1F2QWNVcHM9.png'),
                title: Text(
                  '登录',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                subtitle: Text(
                  '登录后可享受更多的特权',
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.white,
                ),
              ),
            ],
          )),
    );
  }

  

  // 默认文字头像
  Widget TextHead() {
    return Container(
      // color: Colors.blue,
      width: ScreenUtil().setWidth(120),
      height: ScreenUtil().setHeight(120),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
      ),
      child: Text(
        '租',
        style: TextStyle(
            fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  // 图片头像
  Widget ImgHead(String imgUrl) {
    return ClipOval(
      child: new Image.network(imgUrl),
    );
  }
}
