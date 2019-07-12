import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_taozugong_app/routers/application.dart';
import 'package:flutter_taozugong_app/utils/utils.dart';

class OrderDetailPage extends StatefulWidget {
  OrderDetailPage({Key key}) : super(key: key);

  _OrderDetailPageState createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  @override
  Widget build(BuildContext context) {
    // 顶部标题栏
    return Container(
        child: Scaffold(
            backgroundColor: Color(0xFFf3f4f5),
            appBar: AppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    print('返回上一页');
                    Navigator.pop(context);
                  },
                ),
                title: Text('订单详情')),
            body: Center(child: _orderDetailPage())));
  }

  Widget _orderDetailPage() {
    // 内容页
    return Column(
      children: <Widget>[
        new Container(
          // header部
          child: _orderDetail_header(),
        ),
        new Expanded(
          // main部
          child: _orderDetail_main(),
        ),
        new Container(
          // footer部
          child: _orderDetail_footer(),
        ),
      ],
    );
  }

// header (订单状态 地址信息)
  Widget _orderDetail_header() {
    return new Column(
      children: <Widget>[
        new Container(
          padding: EdgeInsets.only(left: 20, right: 130),
          width: double.infinity,
          constraints: new BoxConstraints.expand(
            height: 120.0,
          ),
          decoration: BoxDecoration(
              image: DecorationImage(
            image: new ExactAssetImage(Utils.getImgPath('ordertail/guanbi')),
            fit: BoxFit.fill,
          )),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '已取消',
                style: new TextStyle(fontSize: 25, color: Colors.white),
              ),
              Text(
                '描述描述描述描述描述描述描述描述描述描述描述描述描述',
                style: new TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
        new Container(
          padding: EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 20),
          width: double.infinity,
          color: Colors.white,
          child: new Row(
            children: <Widget>[
              new Container(
                alignment: Alignment.topLeft,
                width: ScreenUtil().setWidth(40.0),
                height: ScreenUtil().setHeight(40.0),
                margin: EdgeInsets.only(bottom: 35, right: 5),
                child: new Image.asset('assets/images/order/address.png'),
              ),
              Expanded(
                child: new Column(
                  children: <Widget>[
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '收货人: 测试',
                          style: new TextStyle(fontSize: 14),
                        ),
                        Text(
                          '17839936704',
                          style: new TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                    new Align(
                        child: Text(
                          '详细地址详细地址详细地址详细地址详细地址详细地址详细地址详细地址',
                          style: new TextStyle(color: Color(0xFF999999)),
                        ),
                        alignment: FractionalOffset.centerLeft)
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  // main (订单的具体信息)
  Widget _orderDetail_main() {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return new Container(
        margin: EdgeInsets.only(top: 10, bottom: 10),
        width: double.infinity,
        // color: Colors.white,
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    // 商品信息
                    padding: EdgeInsets.only(left: 15, right: 20),
                    margin: EdgeInsets.only(bottom: 10),
                    color: Colors.white,
                    child: Container(
                      height: 80.0,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                  ),
                  Container(
                    // 商品金额信息
                    padding: EdgeInsets.only(left: 15, right: 20),
                    margin: EdgeInsets.only(bottom: 10),
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[Text('总租金'), Text('¥199')],
                          ),
                          padding: EdgeInsets.only(top: 10),
                        ),
                        Padding(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[Text('租期'), Text('6个月')],
                          ),
                          padding: EdgeInsets.symmetric(vertical: 10),
                        ),
                        Divider(
                          // 分割线
                          height: 0.0,
                          indent: 0.0,
                          color: Color(0xFFEBEBEB),
                        ),
                        Padding(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('应付金额'),
                              Text(
                                '¥199',
                                style: TextStyle(color: Color(0xFF00a4ff)),
                              )
                            ],
                          ),
                          padding: EdgeInsets.symmetric(vertical: 10),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15, right: 20),
                    margin: EdgeInsets.only(bottom: 10),
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('订单编号'),
                              Text(' 12312321321312312213')
                            ],
                          ),
                          padding: EdgeInsets.only(top: 10),
                        ),
                        Padding(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[Text('下单时间'), Text('6个月')],
                          ),
                          padding: EdgeInsets.only(top: 10),
                        ),
                        Padding(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[Text('支付方式'), Text('6个月')],
                          ),
                          padding: EdgeInsets.only(top: 10),
                        ),
                        Padding(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[Text('备注'), Text('6个月')],
                          ),
                          padding: EdgeInsets.symmetric(vertical: 10),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15, right: 20),
                    margin: EdgeInsets.only(bottom: 10),
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[Text('aa'), Text('aa')],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  // footer (按钮区域)
  Widget _orderDetail_footer() {
    return new Container(
      height: 60,
      padding: EdgeInsets.only(right: 20),
      width: double.infinity,
      color: Colors.white,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          new OutlineButton(
            child: Text("联系客服"), // 按钮文字内容
            textColor: Color(0xFF333333), // 文字颜色
            splashColor: Color(0xFF00a4ff), // 点击时的颜色
            borderSide: new BorderSide(
                // 边框线颜色
                color: Theme.of(context).primaryColor),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
