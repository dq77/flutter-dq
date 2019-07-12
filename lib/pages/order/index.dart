// 确认订单页面

import 'package:flutter/material.dart';
import 'package:flutter_taozugong_app/common/config.dart';
import 'package:flutter_taozugong_app/pages/order/orderConfirm/address.dart';
import 'package:flutter_taozugong_app/pages/order/orderConfirm/agreement.dart';
import 'package:flutter_taozugong_app/pages/order/orderConfirm/infoInput.dart';

class OrderConfirmPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => OrderConfirmState();
}

class OrderConfirmState extends State<OrderConfirmPage> {
  BuildContext _context;
  final TextEditingController _idcardNumberController =
      new TextEditingController();
  final TextEditingController _remarkController = new TextEditingController();

  Widget build(BuildContext context) {
    this._context = context;
    return new Scaffold(
      backgroundColor: GlobalColor.backPageColor,
      appBar: new AppBar(
        backgroundColor: GlobalColor.whiteWordColor,
        elevation: 0.2,
        iconTheme: IconThemeData(color: GlobalColor.blackWordColor),
        title: new Text(
          '确认订单',
          style: TextStyle(color: GlobalColor.blackWordColor),
        ),
        centerTitle: true,
      ),
      body: new Container(
          height: MediaQuery.of(_context).size.height - 145,
          child: ListView(
            children: <Widget>[
              //noAddress(),
              //hasAddress(context),
              new Container(
                color: GlobalColor.whiteWordColor,
                margin: EdgeInsets.only(top: 10),
                child: new Column(
                  children: <Widget>[
                    productInfo(),
                    new Container(
                      height: 1.0,
                      color: GlobalColor.backPageColor,
                      margin: EdgeInsets.only(left: 16.0, right: 16.0),
                    ),
                    rentTime()
                  ],
                ),
              ),
              deposit(),
              listItem('优惠券', '不使用'),
              // 支付方式  分期详情
              new Container(
                color: GlobalColor.whiteWordColor,
                margin: EdgeInsets.only(top: 10),
                child: new Column(
                  children: <Widget>[
                    listItem('支付方式', '支付宝预授'),
                    new Container(
                      height: 1.0,
                      color: GlobalColor.backPageColor,
                      margin: EdgeInsets.only(left: 16.0, right: 16.0),
                    ),
                    stagesDetail()
                  ],
                ),
              ),
              //身份证和备注输入框
              new Container(
                color: GlobalColor.whiteWordColor,
                margin: EdgeInsets.only(top: 10),
                child: new Column(
                  children: <Widget>[
                    initInput('身份证（必填）', '快递需要实名认证', _idcardNumberController),
                    new Container(
                      height: 1.0,
                      color: GlobalColor.backPageColor,
                      margin: EdgeInsets.only(left: 16.0, right: 16.0),
                    ),
                    initInput('备注', '填写内容和客服协商确认', _remarkController),
                  ],
                ),
              ),
              AgreementPage()
            ],
          )),
      bottomSheet: new Container(
          height: 56.0,
          child: new Row(
            children: <Widget>[
              new Expanded(
                  flex: 0,
                  child: new Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 16.0),
                      child: new Text('￥ 100.',
                          style: TextStyle(
                              color: GlobalColor.baseColor, fontSize: 22)))),
              new Expanded(
                child: new Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: 8.0),
                    child: new Text('00',
                        style: TextStyle(
                            color: GlobalColor.baseColor, fontSize: 14))),
                flex: 4,
              ),
              new Expanded(
                  flex: 6,
                  child: new Container(
                    color: GlobalColor.baseColor,
                    alignment: Alignment.center,
                    child: new Text(
                      '下单并预授支付',
                      style: TextStyle(
                          color: GlobalColor.whiteWordColor,
                          fontSize: GlobalFont.fontSize16),
                    ),
                  ))
            ],
          )),
    );
  }

  Widget listItem(title, content) {
    return new Container(
        color: GlobalColor.whiteWordColor,
        margin: EdgeInsets.only(top: 10),
        padding:
            EdgeInsets.only(left: 16.0, right: 16.0, top: 13.0, bottom: 13.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Expanded(
              child: new Container(
                  child: new Text(
                title,
                style: TextStyle(fontSize: GlobalFont.fontSize14, height: 1.2),
              )),
              flex: 10,
            ),
            new Expanded(
              child: new Container(
                  margin: EdgeInsets.only(right: 5.0),
                  child: new Text(
                    content,
                    style: TextStyle(
                        color: GlobalColor.categoryDefaultColor, height: 1.2),
                  )),
              flex: 0,
            ),
            new Expanded(
                flex: 0,
                child: new Container(
                    margin: EdgeInsets.only(top: 2),
                    child: new Icon(
                      Icons.chevron_right,
                      color: GlobalColor.rightIconColor,
                      size: 20,
                    ))),
          ],
        ));
  }

  // 租赁的信息
  Widget productInfo() {
    return new Container(
      color: GlobalColor.whiteWordColor,
      padding: EdgeInsets.only(left: 16, right: 30, top: 16, bottom: 16),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
              margin: EdgeInsets.only(right: 15.0),
              child: new InkWell(
                onTap: null,
                child: new Image(
                    width: 70,
                    height: 70,
                    image: NetworkImage(
                        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1553078711438&di=d474963ced185d314428291f0a3fdd93&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201510%2F14%2F20151014104346_U3M2n.jpeg')),
              )),
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                    child: new Text(
                  'Beats SOLO3 头戴式耳机',
                  style: TextStyle(fontSize: 14.0),
                )),
                new Expanded(
                  child: new Container(
                    margin: EdgeInsets.only(top: 20),
                    child: new Text(
                      '规格：土豪金 128G',
                      style: TextStyle(
                          color: GlobalColor.color999,
                          fontSize: 12.0,
                          height: 1.1),
                    ),
                  ),
                  flex: 0,
                ),
                new Expanded(
                  child: new Container(
                    child: new Text(
                      '租金：￥100/月',
                      style: TextStyle(
                          color: GlobalColor.color999, fontSize: 12.0),
                    ),
                  ),
                  flex: 0,
                )
              ],
            ),
            flex: 0,
          ),
          new Expanded(
            child: new Container(),
            flex: 10,
          ),
          new Expanded(
            child: new Text('1'),
            flex: 0,
          )
        ],
      ),
    );
  }

  // 租期 (备注： 如果是售卖的商品是没有租期的)
  Widget rentTime() {
    return new Container(
        color: GlobalColor.whiteWordColor,
        padding:
            EdgeInsets.only(left: 16.0, right: 16.0, top: 10.0, bottom: 10.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Expanded(
              child: new Container(
                  child: new Text(
                '租期',
                style: TextStyle(fontSize: GlobalFont.fontSize14, height: 1.2),
              )),
              flex: 1,
            ),
            new Expanded(
              child: new Container(
                  margin: EdgeInsets.only(left: 10.0),
                  child: new Text(
                    '自物流签收第二天开始计算',
                    style: TextStyle(
                        color: GlobalColor.color999,
                        fontSize: GlobalFont.fontSize12,
                        height: 1.2),
                  )),
              flex: 10,
            ),
            new Expanded(
                flex: 0,
                child: new Text(
                  '3个月',
                  style: TextStyle(color: GlobalColor.categoryDefaultColor),
                )),
          ],
        ));
  }

  // 押金 没有押金则不展示，有押金则展示，京东渠道进入该页面时判断用户的信用，免押则展示 减免押金
  Widget deposit() {
    return new Container(
        color: GlobalColor.whiteWordColor,
        margin: EdgeInsets.only(top: 10),
        padding:
            EdgeInsets.only(left: 16.0, right: 16.0, top: 13.0, bottom: 13.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Expanded(
              child: new Container(
                  child: new Text(
                '押金',
                style: TextStyle(fontSize: GlobalFont.fontSize14, height: 1.2),
              )),
              flex: 10,
            ),
            new Expanded(
              child: new Container(
                  margin: EdgeInsets.only(right: 5.0),
                  child: new Text(
                    '￥1000',
                    style: TextStyle(
                        color: GlobalColor.categoryDefaultColor, height: 1.2),
                  )),
              flex: 0,
            ),
            new Expanded(
                flex: 0,
                child: new Container(
                    margin: EdgeInsets.only(top: 2),
                    child: new ImageIcon(
                      new AssetImage('assets/images/order/explain.png'),
                      color: GlobalColor.rightIconColor,
                      size: 25,
                    ))),
          ],
        ));
  }

  // 分期详情
  Widget stagesDetail() {
    return new Container(
        color: GlobalColor.whiteWordColor,
//        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 0, bottom: 13.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Expanded(
              child: new Container(
                  child: new Text(
                '分期详情',
                style: TextStyle(fontSize: GlobalFont.fontSize14, height: 1.2),
              )),
              flex: 10,
            ),
            new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  new Container(
                      margin: EdgeInsets.only(right: 5.0, top: 5.0),
                      child: new Text(
                        '首期：￥50',
                        style: TextStyle(
                            color: GlobalColor.categoryDefaultColor,
                            height: 1.2),
                      )),
                  new Container(
                      margin: EdgeInsets.only(right: 5.0),
                      child: new Text(
                        '剩余：￥100*6期',
                        style:
                            TextStyle(color: GlobalColor.categoryDefaultColor),
                      ))
                ],
              ),
              flex: 0,
            ),
            new Expanded(
                flex: 0,
                child: new Container(
                    margin: EdgeInsets.only(top: 2),
                    child: new Icon(
                      Icons.chevron_right,
                      color: GlobalColor.rightIconColor,
                      size: 20,
                    ))),
          ],
        ));
  }
}
