import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_taozugong_app/common/styles.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_taozugong_app/routers/application.dart';

class OrderListView extends StatefulWidget {
  OrderListView({Key key}) : super(key: key);

  @override
  _OrderListView createState() => new _OrderListView();
}

class _OrderListView extends State<OrderListView> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Expanded(
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              color: Colors.white, // 背景颜色
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              // padding: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
              child: new Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 40.0,
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Text('2017-02-22'),
                        new Text('已取消',
                            style: new TextStyle(color: Color(0xFF00a4ff)))
                      ],
                    ),
                  ),
                  Divider(
                    // 分割线
                    height: 0.0,
                    indent: 0.0,
                    color: Color(0xFFEBEBEB),
                  ),
                  Container(
                    height: 80.0,
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    child: new Row(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Image(
                            width: 70,
                            height: 70,
                            image: AssetImage('assets/images/home.png')),
                        new Expanded(
                          child: new Container(
                            margin: EdgeInsets.only(left: 10),
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'namenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamenamename',
                                  overflow: TextOverflow.ellipsis, // 文字超出省略号
                                ),
                                Text('brief'),
                                new Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'price',
                                      style: new TextStyle(
                                          color: Color(0xFFff1926)),
                                    ),
                                    Text('count')
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    // 分割线
                    height: 0.0,
                    indent: 0.0,
                    color: Color(0xFFEBEBEB),
                  ),
                  Container(
                    height: 60.0,
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Container(
                          child: new Row(
                            children: <Widget>[
                              Text('付款方式:',
                                  style:
                                      new TextStyle(color: Color(0xFF9b9b9b))),
                              Text('支付宝支付',
                                  style:
                                      new TextStyle(color: Color(0xFF9b9b9b))),
                            ],
                          ),
                        ),
                        new Container(
                          child: new OutlineButton(
                            child: Text("待收货"), // 按钮文字内容
                            textColor: Color(0xFFFF00a4ff), // 文字颜色
                            splashColor: Color(0xFF00a4ff), // 点击时的颜色
                            borderSide: new BorderSide(
                                // 边框线颜色
                                color: Theme.of(context).primaryColor),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    ]);
  }
}
