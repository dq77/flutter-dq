import 'package:flutter/material.dart';
import 'package:flutter_taozugong_app/pages/mine/orderEntry/index.dart';
import 'package:flutter_taozugong_app/pages/mine/userHead/index.dart';
import 'cell/index.dart';
import 'package:flutter_taozugong_app/routers/application.dart';
import 'package:fluro/fluro.dart';

class MinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
          color: Colors.white,
          child: Column(children: <Widget>[
            UserHead(),
            SizedBox(
              height: 10.0,
            ),
            OrderEntryList(),
            SizedBox(
              height: 10.0,
            ),
            MeCell(
              title: '余额',
              iconName: 'images/me_wallet.png',
              onPressed: () {},
            ),
            MeCell(
              title: '优惠券',
              iconName: 'images/me_wallet.png',
              onPressed: () {
                Application.router.navigateTo(context, "/myCoupon",
                    transition: TransitionType.inFromBottom);
              },
            ),
            MeCell(
              title: '地址管理',
              iconName: 'images/me_record.png',
              onPressed: () {
                Application.router.navigateTo(context, "/addressManagement",
                    transition: TransitionType.inFromBottom);
              },
            ),
            MeCell(
              title: '常见问题',
              iconName: 'images/me_record.png',
              onPressed: () {
                Application.router.navigateTo(context, "/commonProblem",
                    transition: TransitionType.inFromBottom);
              },
            ),
            MeCell(
              title: '意见反馈',
              iconName: 'images/me_record.png',
              onPressed: () {
                Application.router.navigateTo(context, "/feedBack",
                    transition: TransitionType.inFromBottom);
              },
            ),
            MeCell(
              title: '在线客服',
              iconName: 'images/me_record.png',
              onPressed: () {},
            ),
          ])),
    );
  }
}
