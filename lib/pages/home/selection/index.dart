import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_taozugong_app/common/config.dart';
import 'package:flutter_taozugong_app/routers/application.dart';
import 'package:flutter_taozugong_app/utils/toast.dart';
import 'package:oktoast/oktoast.dart';

class SelectionWidget extends StatelessWidget {
  final List selectionsList;
  const SelectionWidget({Key key, this.selectionsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[SelectionTitle('精选速递'), SelectionContent(context)],
      ),
    );
  }

  Widget SelectionTitle(String title) {
    return new Container(
      margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 10),
      child: Text(
        title,
        style: TextStyle(color: Colors.black, fontSize: 24.0),
      ),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _goodsItem(context, Map selection) {
    return Container(
      width: ScreenUtil().setWidth(375),
      padding: EdgeInsets.only(top: 7.0, bottom: 7.0, left: 8.0, right: 8.0),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8.0))),
      alignment: Alignment.centerRight,
      child: InkWell(
        // borderRadius:BorderRadius.all(Radius.circular(20.0)),
        onTap: () {
          // type 0 商品   10 活动
          if (selection['type'] == 0) {
            print('当前点击的是商品跳转');
            print('你点击了事件 ${selection['content']}');
            // Application.router
            //     .navigateTo(context, "/goodsDetail?no=${selection['content']}");
          } else {
            print('10····当前点击的是活动跳转');
            print('你点击了事件 ${selection['content']}');

            Toast.show("活动跳转开发中");
          }
        },
        child: Image.network(selection['img']),
      ),
    );
  }

  Widget SelectionContent(context) {
    return selectionsList.isEmpty
        ? SizedBox(height: 10.0)
        : Row(
            children: <Widget>[
              _goodsItem(context, selectionsList[0]),
              Column(
                children: <Widget>[
                  _goodsItem(context, selectionsList[1]),
                  _goodsItem(context, selectionsList[2]),
                ],
              )
            ],
          );
  }
}
