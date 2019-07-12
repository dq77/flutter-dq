// 没有收货地址
import 'package:flutter/material.dart';
import 'package:flutter_taozugong_app/common/config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fluro/fluro.dart';
import 'package:flutter_taozugong_app/routers/application.dart';

Widget noAddress(context, model) {
  return new Container(
      color: GlobalColor.whiteWordColor,
      padding:
          EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Expanded(
            child: InkWell(
              onTap: () {
                Application.router.navigateTo(
                      context, "/addressManagement?fromPage=orderConfirm",
                      transition: TransitionType.inFromBottom);
              },
                child: new Container(
                    child: Center(
              child: new Text(
                '没有地址信息，请点击后添加地址',
                style: TextStyle(
                    color: GlobalColor.blackWordColor,
                    fontSize: GlobalFont.fontSize14),
              ),
            ))),
            flex: 1,
          ),
          new Expanded(
              flex: 0,
              child: new Container(
                  child: new Icon(
                Icons.chevron_right,
                color: GlobalColor.rightIconColor,
                size: 30,
              ))),
        ],
      ));
}

Widget hasAddress(context, orderDefaultAddress) {
  return new Container(
      color: GlobalColor.whiteWordColor,
      padding:
          EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Expanded(
            child: new Container(
              alignment: Alignment.centerLeft,
              width: ScreenUtil().setWidth(48.0),
              height: ScreenUtil().setHeight(48.0),
              child: new Image.asset('assets/images/order/address.png'),
            ),
            flex: 0,
          ),
          new Expanded(
            child: InkWell(
                onTap: () {
                  Application.router.navigateTo(
                      context, "/addressManagement?fromPage=orderConfirm",
                      transition: TransitionType.inFromBottom);
                },
                child: new Container(
                    child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Container(
                        margin: EdgeInsets.only(left: 16),
                        child: new Text(
                          '${orderDefaultAddress.province}${orderDefaultAddress.city}${orderDefaultAddress.area}${orderDefaultAddress.detail}',
                          style: TextStyle(
                              color: GlobalColor.blackWordColor,
                              fontSize: GlobalFont.fontSize14),
                        )),
                    new Row(
                      children: <Widget>[
                        new Container(
                          margin: EdgeInsets.only(left: 16),
                          child: new Text(
                            '${orderDefaultAddress.receiveName}',
                            style: TextStyle(
                                color: GlobalColor.blackWordColor,
                                fontSize: GlobalFont.fontSize14),
                          ),
                        ),
                        new Container(
                          margin: EdgeInsets.only(left: 16),
                          child: new Text(
                            '${orderDefaultAddress.mobile}',
                            style: TextStyle(
                                color: GlobalColor.blackWordColor,
                                fontSize: GlobalFont.fontSize14),
                          ),
                        ),
                      ],
                    )
                  ],
                ))),
            flex: 8,
          ),
          new Expanded(
              flex: 0,
              child: new Container(
                  child: new Icon(
                Icons.chevron_right,
                color: GlobalColor.rightIconColor,
                size: 30,
              ))),
        ],
      ));
}
